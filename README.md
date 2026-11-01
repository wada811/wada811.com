# wada811.com

wada811 のブログ。[Hugo](https://gohugo.io/) で作り、GitHub Pages で公開する。

## サイトの作り方

- 設定は `hugo.yaml`。テーマは使わず、`layouts/` の最小のテンプレートで描画する。
  - `layouts/baseof.html`: 共通の枠
  - `layouts/home.html`: 一覧（`/`）。公開の記事だけを新しい順に出す
  - `layouts/page.html`: 記事ページ（`/blog/<slug>/`）
- スタイルは `static/css/style.css`（ダークモード対応）。
- 記事は `content/blog/*.md`。`draft: true` の記事は通常のビルドに出ない。
- `static/CNAME`（`wada811.com`）がビルド出力の `public/CNAME` になる。カスタムドメイン用。
- Hugo の版は `.mise.toml` と `.github/workflows/deploy.yml` の `HUGO_VERSION` で固定している。上げるときは両方を同じ版にする。

## ローカルで確認する

```bash
mise install                  # .mise.toml の版の Hugo を入れる
mise exec -- hugo server      # http://localhost:1313/ （下書きは出ない）
mise exec -- hugo server -D   # 下書きも出す
mise exec -- hugo --gc --minify   # 本番と同じビルド。出力は public/（git に入れない）
```

## 記事を取り込む

記事の原稿は work リポジトリの `blog/*.md` にある。このスクリプトで `content/blog/` に変換して置く。

```bash
scripts/import-from-work.sh /path/to/work/blog/<記事>.md [...]
```

work の frontmatter を次のように変える。

| work | Hugo |
| --- | --- |
| 本文先頭の `# 見出し` | `title`（本文からはその行を除く） |
| `状態: draft` と `作成日` | `draft: true` と `date: <作成日>` |
| `状態: published` と `公開日` | `draft: false` と `date: <公開日>` |

- 何度実行しても、同じ入力から同じ `content/blog/<ファイル名>.md` ができる（上書きする）。
- `状態: published` で `公開日` が空だと失敗する。
- `公開先` は取り込まない。

## 公開の流れ

1. work の `blog/<記事>.md` で `状態: published`・`公開日` を埋める。
2. 取り込みスクリプトを実行し、`hugo server` で見た目を確かめる。
3. `content/blog/` の変更を `andy/…` のブランチで PR にし、`master` にマージする。
4. `master` への push で GitHub Actions（`.github/workflows/deploy.yml`）が `hugo --gc --minify` を実行し、GitHub Pages に出す。手動で出すときは Actions から `workflow_dispatch` を実行する。

### 初回だけ必要な設定

- GitHub の Settings > Pages で、公開元（Source）を「GitHub Actions」にする。
- Cloudflare の DNS で `wada811.com` の向き先を GitHub Pages にする。
- Settings > Pages で、カスタムドメイン `wada811.com` と「Enforce HTTPS」を確かめる。
