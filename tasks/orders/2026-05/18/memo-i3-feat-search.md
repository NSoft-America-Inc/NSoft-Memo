---
project: memo
type: feat
issue: https://github.com/NSoft-America-Inc/NSoft-Memo/issues/3
created: 2026-05-18
completed: "-"
llmwiki: "-"
---

**Issue:** [NSoft-Memo#3](https://github.com/NSoft-America-Inc/NSoft-Memo/issues/3)

# feat: 메모 검색 기능 구현

**담당:** developer-b
**리뷰:** Claude

---

## 사전 LLMWiki 쿼리 결과

작업 시작 전 `swarmvault query "메모 삭제"` 실행 →
- developer-a의 `memo-i2-feat-delete` 발견 → delete 기능은 이미 구현됨
- 중복 없이 `search` 기능 진행

## 구현 파일

- `memo.sh` — search 명령 추가

## Fix 1. memo.sh — search 명령 추가

```bash
search)
  shift
  KEYWORD="${1:-}"
  if [ -z "$KEYWORD" ]; then
    echo "사용법: memo search <키워드>"
    exit 1
  fi
  if [ -f "$MEMO_FILE" ]; then
    grep -i "$KEYWORD" "$MEMO_FILE" || echo "(검색 결과 없음)"
  else
    echo "(메모 없음)"
  fi
  ;;
```

## 완료 조건

- [ ] `bash memo.sh search <키워드>` — 키워드 포함 메모 출력
- [ ] 결과 없을 때 `(검색 결과 없음)` 출력
