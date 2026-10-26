#!/usr/bin/env bash
# Package the Chinese fork without using upstream's private update-signing key.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"
bash scripts/package_app.sh release
APP="$ROOT_DIR/build/Osmotic.app"
/usr/libexec/PlistBuddy -c 'Set :CFBundleShortVersionString 0.3.1' "$APP/Contents/Info.plist"
codesign --force --sign - --options runtime --entitlements Resources/Osmotic.entitlements --identifier io.github.smithplus.osmotic "$APP"
codesign --verify --strict "$APP"
STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT
cp -R "$APP" "$STAGE/Osmotic.app"
ln -s /Applications "$STAGE/Applications"
cp LICENSE "$STAGE/LICENSE.txt"
cp scripts/dmg_readme_zh.txt "$STAGE/安装说明.txt"
DMG="$ROOT_DIR/build/Osmotic-0.3.1-zh.1-universal.dmg"
hdiutil create -volname 'Osmotic 简体中文版' -srcfolder "$STAGE" -ov -format UDZO -fs HFS+ "$DMG"
hdiutil verify "$DMG"
(cd build && shasum -a 256 Osmotic-0.3.1-zh.1-universal.dmg > SHA256SUMS.txt)
echo "$DMG"
