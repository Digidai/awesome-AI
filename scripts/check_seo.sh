#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-docs}"

fail() {
  echo "[SEO CHECK] $1" >&2
  exit 1
}

require_file() {
  local file="$1"
  [[ -f "$ROOT/$file" ]] || fail "Missing required file: $ROOT/$file"
}

check_contains() {
  local file="$1"
  local pattern="$2"
  local desc="$3"
  if ! grep -qE "$pattern" "$file"; then
    fail "Missing ${desc} in ${file}"
  fi
}

require_file "index.html"
require_file "en/index.html"
require_file "categories/ai-chat-assistants/index.html"
require_file "categories/ai-coding-assistants/index.html"
require_file "categories/ai-video-tools/index.html"
require_file "categories/ai-marketing-seo/index.html"
require_file "en/categories/ai-chat-assistants/index.html"
require_file "en/categories/ai-coding-assistants/index.html"
require_file "en/categories/ai-video-tools/index.html"
require_file "en/categories/ai-marketing-seo/index.html"
require_file "404.html"
require_file "robots.txt"
require_file "sitemap.xml"
require_file "llms.txt"
require_file "site.webmanifest"
require_file "favicon.svg"

check_contains "$ROOT/index.html" '<title>.*Awesome AI 工具库' 'Chinese title tag'
check_contains "$ROOT/index.html" 'name="description"' 'Chinese meta description'
check_contains "$ROOT/index.html" 'rel="canonical" href="https://digidai.github.io/awesome-AI/"' 'Chinese canonical URL'
check_contains "$ROOT/index.html" 'hreflang="en"' 'Chinese hreflang to English page'
check_contains "$ROOT/index.html" 'application/ld\+json' 'Chinese structured data'

check_contains "$ROOT/en/index.html" '<title>.*Awesome AI Tools' 'English title tag'
check_contains "$ROOT/en/index.html" 'name="description"' 'English meta description'
check_contains "$ROOT/en/index.html" 'rel="canonical" href="https://digidai.github.io/awesome-AI/en/"' 'English canonical URL'
check_contains "$ROOT/en/index.html" 'hreflang="zh-CN"' 'English hreflang to Chinese page'
check_contains "$ROOT/en/index.html" 'application/ld\+json' 'English structured data'
check_contains "$ROOT/categories/ai-chat-assistants/index.html" 'rel="canonical" href="https://digidai.github.io/awesome-AI/categories/ai-chat-assistants/"' 'Chinese chat canonical URL'
check_contains "$ROOT/en/categories/ai-chat-assistants/index.html" 'rel="canonical" href="https://digidai.github.io/awesome-AI/en/categories/ai-chat-assistants/"' 'English chat canonical URL'
check_contains "$ROOT/404.html" 'noindex,follow' '404 noindex robots tag'

check_contains "$ROOT/robots.txt" '^Sitemap: https://digidai.github.io/awesome-AI/sitemap.xml$' 'Sitemap declaration in robots.txt'

SEO_ROOT="$ROOT" python3 - <<'PY'
import sys
import xml.etree.ElementTree as ET
import os
from pathlib import Path

path = os.path.join(os.environ.get('SEO_ROOT', 'docs'), 'sitemap.xml')
ns = {'sm': 'http://www.sitemaps.org/schemas/sitemap/0.9'}

try:
    tree = ET.parse(path)
except Exception as exc:
    print(f"[SEO CHECK] Failed to parse sitemap.xml: {exc}", file=sys.stderr)
    sys.exit(1)

root = tree.getroot()
urls = [node.text.strip() for node in root.findall('sm:url/sm:loc', ns) if node.text]
base_url = 'https://digidai.github.io/awesome-AI/'
seo_root = Path(os.environ.get('SEO_ROOT', 'docs')).resolve()

expected_urls = set()
for html in seo_root.rglob('*.html'):
    rel = html.relative_to(seo_root).as_posix()
    if rel == '404.html':
        continue
    if rel == 'index.html':
        expected_urls.add(base_url)
        continue
    if rel.endswith('/index.html'):
        expected_urls.add(base_url + rel[:-len('index.html')])

missing_from_sitemap = sorted(expected_urls - set(urls))
if missing_from_sitemap:
    print(f"[SEO CHECK] sitemap.xml missing URLs: {missing_from_sitemap}", file=sys.stderr)
    sys.exit(1)

print('[SEO CHECK] sitemap.xml validated')
PY

echo "[SEO CHECK] Passed"
