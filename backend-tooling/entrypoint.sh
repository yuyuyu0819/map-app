#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="/work/backend"

echo "[backend] starting..."

# 1) 初回のみプロジェクト生成
if [ ! -d "${PROJECT_DIR}/grails-app" ]; then
  echo "[init] ${PROJECT_DIR}/grails-app not found. Creating Grails project..."

  # 既存 backend が「中途半端」な場合のみ削除（安全側）
  if [ -d "${PROJECT_DIR}" ]; then
    # もしユーザーが別用途で backend を置いていたら事故るので、最低限のガード
    if [ -f "${PROJECT_DIR}/build.gradle" ] || [ -f "${PROJECT_DIR}/settings.gradle" ]; then
      echo "[init] Found gradle files but no grails-app. Removing and recreating..."
      rm -rf "${PROJECT_DIR}"
    fi
  fi

  grails create-app "${PROJECT_DIR}"
fi

cd "${PROJECT_DIR}"

# 2) gradlew 実行準備
chmod +x gradlew 2>/dev/null || true

# 3) 依存解決を先に走らせて起動を安定化（失敗しても起動に回す）
./gradlew --no-daemon tasks >/dev/null 2>&1 || true

# 4) 起動（タスク差異を吸収）
echo "[backend] launching..."
./gradlew --no-daemon bootRun \
  || ./gradlew --no-daemon run \
  || ./gradlew --no-daemon run-app
