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
  clear)
    if [ -f "$MEMO_FILE" ]; then
      rm "$MEMO_FILE"
      echo "✅ 모든 메모 삭제됨"
    else
      echo "ℹ️ 삭제할 메모가 없습니다"
    fi
    ;;
  count)
    if [ -f "$MEMO_FILE" ]; then
      total_count=$(wc -l < "$MEMO_FILE" | tr -d ' ')
      echo "📊 총 메모 개수: ${total_count}개"
    else
      echo "📊 총 메모 개수: 0개"
    fi
    ;;
  delete)
    shift
    idx="$1"
    if [ -z "$idx" ]; then
      echo "⚠️ 삭제할 메모의 인덱스를 입력하세요 (예: memo delete 1)"
      exit 1
    fi
    if [ -f "$MEMO_FILE" ]; then
      total_count=$(wc -l < "$MEMO_FILE" | tr -d ' ')
      if [ "$idx" -gt 0 ] && [ "$idx" -le "$total_count" ]; then
        temp_file=$(mktemp)
        sed "${idx}d" "$MEMO_FILE" > "$temp_file"
        mv "$temp_file" "$MEMO_FILE"
        echo "✅ 메모 #${idx} 삭제됨"
      else
        echo "⚠️ 잘못된 인덱스입니다 (현재 범위: 1~${total_count})"
      fi
    else
      echo "ℹ️ 삭제할 메모가 없습니다"
    fi
    ;;
  *)
    echo "사용법: memo add <내용> | memo list | memo clear | memo count | memo delete <인덱스>"
    ;;
esac
