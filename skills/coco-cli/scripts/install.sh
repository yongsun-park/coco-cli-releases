#!/bin/bash
set -e

REPO="yongsun-park/coco-cli-releases"
INSTALL_DIR="${HOME}/.local/bin"

# OS/아키텍처 감지
OS=$(uname -s | tr '[:upper:]' '[:lower:]')
ARCH=$(uname -m)

case "${OS}-${ARCH}" in
  linux-x86_64)   ARTIFACT="coco-linux-x64" ;;
  darwin-x86_64)  ARTIFACT="coco-macos-x64" ;;
  darwin-arm64)   ARTIFACT="coco-macos-arm64" ;;
  *)
    echo "Error: Unsupported platform: ${OS}-${ARCH}"
    echo "Supported: linux-x86_64, darwin-x86_64, darwin-arm64"
    exit 1
    ;;
esac

echo "Platform: ${OS}-${ARCH}"
echo "Artifact: ${ARTIFACT}"
echo "Install directory: ${INSTALL_DIR}"
echo ""

# 설치 디렉토리 생성
mkdir -p "${INSTALL_DIR}"

# 다운로드
echo "Downloading ${ARTIFACT}..."
curl -fsSL "https://github.com/${REPO}/releases/latest/download/${ARTIFACT}" \
  -o "${INSTALL_DIR}/coco"

# 실행 권한
chmod +x "${INSTALL_DIR}/coco"

echo ""
echo "[OK] Installed: ${INSTALL_DIR}/coco"
echo ""

# PATH 확인
if [[ ":$PATH:" != *":${INSTALL_DIR}:"* ]]; then
  echo "PATH에 추가하려면:"
  if [[ "$SHELL" == *"zsh"* ]]; then
    echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.zshrc"
    echo "  source ~/.zshrc"
  else
    echo "  echo 'export PATH=\"\$HOME/.local/bin:\$PATH\"' >> ~/.bashrc"
    echo "  source ~/.bashrc"
  fi
else
  echo "coco --help 로 확인하세요."
fi
