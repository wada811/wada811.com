#!/usr/bin/env bash
# work リポジトリの blog/*.md を、このサイトの content/blog/ に取り込む。
#
# 使い方: scripts/import-from-work.sh <work の blog/*.md> [...]
#
# work 側の frontmatter（状態・作成日・公開日・公開先）を Hugo の frontmatter に変換する。
#   - title: 本文先頭の「# 見出し」から取り、本文からその行を除く
#   - date : 状態が published なら 公開日、それ以外（draft）なら 作成日
#   - draft: 状態が published なら false、それ以外なら true
# 同じ入力からは同じ出力ができる（何度実行しても結果は変わらない）。

set -euo pipefail

if [ "$#" -lt 1 ]; then
  echo "usage: $0 <work の blog/*.md> [...]" >&2
  exit 2
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
out_dir="${OUT_DIR:-$script_dir/../content/blog}"
mkdir -p "$out_dir"

# frontmatter（先頭の --- と次の --- の間）から "キー: 値" の値を取り出す
fm_value() {
  local file="$1" key="$2"
  awk -v key="$key" '
    NR == 1 && $0 == "---" { in_fm = 1; next }
    in_fm && $0 == "---" { exit }
    in_fm {
      prefix = key ":"
      if (index($0, prefix) == 1) {
        v = substr($0, length(prefix) + 1)
        gsub(/^[ \t]+|[ \t\r]+$/, "", v)
        print v
        exit
      }
    }
  ' "$file"
}

for src in "$@"; do
  if [ ! -f "$src" ]; then
    echo "error: $src が見つかりません" >&2
    exit 1
  fi
  name="$(basename "$src" .md)"

  state="$(fm_value "$src" 状態)"
  created="$(fm_value "$src" 作成日)"
  published="$(fm_value "$src" 公開日)"

  case "$state" in
    published)
      draft=false
      date_value="$published"
      if [ -z "$date_value" ]; then
        echo "error: $src は状態が published ですが 公開日 が空です" >&2
        exit 1
      fi
      ;;
    draft | "")
      draft=true
      date_value="$created"
      ;;
    *)
      echo "error: $src の 状態 が不明です: $state" >&2
      exit 1
      ;;
  esac

  if ! printf '%s' "$date_value" | grep -Eq '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'; then
    echo "error: $src の date が YYYY-MM-DD ではありません: '$date_value'" >&2
    exit 1
  fi

  # frontmatter を除いた本文
  body="$(awk '
    NR == 1 && $0 == "---" { in_fm = 1; next }
    in_fm && $0 == "---" { in_fm = 0; next }
    !in_fm { print }
  ' "$src")"

  title="$(printf '%s\n' "$body" | awk '/^# / { sub(/^# +/, ""); sub(/[ \t\r]+$/, ""); print; exit }')"
  if [ -z "$title" ]; then
    echo "error: $src に「# 見出し」がありません" >&2
    exit 1
  fi

  # 最初の「# 見出し」の行と、その直後の空行を本文から除く。先頭の空行も詰める
  body="$(printf '%s\n' "$body" | awk '
    !removed && /^# / { removed = 1; skip_blank = 1; next }
    skip_blank && /^[ \t]*$/ { next }
    { skip_blank = 0; print }
  ' | awk 'started || !/^[ \t]*$/ { started = 1; print }')"

  title_escaped="$(printf '%s' "$title" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g')"

  dest="$out_dir/$name.md"
  tmp="$(mktemp "${dest}.XXXXXX")"
  {
    printf -- '---\n'
    printf 'title: "%s"\n' "$title_escaped"
    printf 'date: %s\n' "$date_value"
    printf 'draft: %s\n' "$draft"
    printf -- '---\n\n'
    printf '%s\n' "$body"
  } > "$tmp"
  mv "$tmp" "$dest"
  echo "imported: $src -> $dest (draft: $draft, date: $date_value)"
done
