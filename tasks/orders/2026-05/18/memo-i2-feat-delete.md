---
project: memo
type: feat
issue: https://github.com/NSoft-America-Inc/NSoft-Memo/issues/2
created: 2026-05-18
completed: "-"
llmwiki: "-"
---

**Issue:** [NSoft-Memo#2](https://github.com/NSoft-America-Inc/NSoft-Memo/issues/2)

# feat: 메모 삭제 기능 구현

**담당:** developer-a
**리뷰:** Claude

---

## 구현 파일

- `memo.sh` — delete 명령 추가

## Fix 1. memo.sh — delete 명령 추가

```bash
delete)
  shift
  LINE="${1:-}"
  if [ -z "$LINE" ]; then
    echo "사용법: memo delete <줄번호>"
    exit 1
  fi
  sed -i "" "${LINE}d" "$MEMO_FILE" 2>/dev/null && echo "✅ ${LINE}번째 메모 삭제됨" || echo "⚠️ 삭제 실패"
  ;;
```

## 완료 조건

- [ ] `bash memo.sh delete 1` — 첫 번째 메모 삭제
- [ ] 잘못된 줄번호 입력 시 에러 처리
