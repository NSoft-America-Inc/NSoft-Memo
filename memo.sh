#!/usr/bin/env bash
MEMO_FILE="$HOME/.memo.txt"
cmd="${1:-list}"

case "$cmd" in
  add)
    shift
    echo "[$(date '+%Y-%m-%d %H:%M')] $*" >> "$MEMO_FILE"
    echo "✅ 메모 저장됨"
    ;;
  list)
    if [ -f "$MEMO_FILE" ]; then
      cat "$MEMO_FILE"
    else
      echo "(메모 없음)"
    fi
    ;;
  *)
    echo "사용법: memo add <내용> | memo list"
    ;;
esac
