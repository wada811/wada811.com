#!/usr/bin/env bash
# 取り込みスクリプトと、公開の流れ（日付の扱い）を確かめる。
# 使い方: scripts/test.sh   （hugo が PATH に要る。mise exec -- scripts/test.sh でもよい）
set -uo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
work="$(mktemp -d)"
trap 'trash "$work"' EXIT
fail=0

check() { # check <名前> <0 なら成功>
  if [ "$2" -eq 0 ]; then echo "ok   $1"; else echo "FAIL $1"; fail=1; fi
}

mkdoc() { # mkdoc <path> <状態> <作成日> <公開日>
  printf -- '---\n状態: %s\n作成日: %s\n公開日: %s\n公開先: 自サイト\n---\n\n# 試験の "題" \\ です\n\n本文。\n' \
    "$2" "$3" "$4" > "$1"
}

mkdir -p "$work/src" "$work/out"
mkdoc "$work/src/pub.md" published 2026-01-02 2026-01-05
mkdoc "$work/src/drf.md" draft 2026-01-02 ""
mkdoc "$work/src/bad.md" published 2026-01-02 ""

OUT_DIR="$work/out" bash "$root/scripts/import-from-work.sh" "$work/src/pub.md" "$work/src/drf.md" > /dev/null
check "published は draft: false と公開日" "$(grep -q '^draft: false$' "$work/out/pub.md" && grep -q '^date: 2026-01-05$' "$work/out/pub.md"; echo $?)"
check "draft は draft: true と作成日" "$(grep -q '^draft: true$' "$work/out/drf.md" && grep -q '^date: 2026-01-02$' "$work/out/drf.md"; echo $?)"
check "title の引用符と円記号をエスケープ" "$(grep -qF 'title: "試験の \"題\" \\ です"' "$work/out/pub.md"; echo $?)"
check "本文から見出し行を除く" "$(! grep -q '^# ' "$work/out/pub.md"; echo $?)"
cp "$work/out/pub.md" "$work/first.md"
OUT_DIR="$work/out" bash "$root/scripts/import-from-work.sh" "$work/src/pub.md" > /dev/null
check "再実行で同じ出力（冪等）" "$(cmp -s "$work/first.md" "$work/out/pub.md"; echo $?)"
OUT_DIR="$work/out" bash "$root/scripts/import-from-work.sh" "$work/src/bad.md" > /dev/null 2>&1
check "published で公開日が空なら失敗" "$([ $? -ne 0 ]; echo $?)"

# 日本時間で 1 時間前の日時を、時刻帯なしで書いた記事は、UTC 扱いだと未来になる。
# timeZone: Asia/Tokyo があれば、ビルドの時刻にかかわらず一覧に出る。
now="$(date +%s)"
past=$((now - 3600))
jst="$(TZ=Asia/Tokyo date -r "$past" +%Y-%m-%dT%H:%M:%S 2>/dev/null || TZ=Asia/Tokyo date -d "@$past" +%Y-%m-%dT%H:%M:%S)"
site="$work/site"
mkdir -p "$site/content/blog"
cp -R "$root/layouts" "$root/hugo.yaml" "$site/"
printf -- '---\ntitle: "当日"\ndate: %s\ndraft: false\n---\n\n本文\n' "$jst" > "$site/content/blog/today.md"
(cd "$site" && hugo --gc --minify --destination "$work/public" > "$work/hugo.log" 2>&1)
check "日本時間で過ぎた時刻の記事が一覧に出る" "$(grep -q 'href=/blog/today/' "$work/public/index.html"; echo $?)"
check "hugo に WARN・ERROR が無い" "$(! grep -Eq 'WARN|ERROR' "$work/hugo.log"; echo $?)"

exit $fail
