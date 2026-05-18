---
project: memo
type: single
issue: https://github.com/NSoft-America-Inc/NSoft-Memo/issues/4
created: 2026-05-18 15:30:00
completed: "-"
llmwiki: "-"
---

**Issue:** [NSoft-Memo#4](https://github.com/NSoft-America-Inc/NSoft-Memo/issues/4)
**Order:** [memo-i4-single-count.md](tasks/orders/2026-05/18/memo-i4-single-count.md)
**Report:** [memo-i4-single-count.md](tasks/reports/2026-05/18/memo-i4-single-count.md)

# Task: Implement memo count command <br> 작업: memo count 기능 추가

**Agent (담당):** developer-b
**Created At (생성일시):** 2026-05-18 15:30:00 (Local Time)

---

## (1) Git Setup (Git 작업)

```bash
git checkout main && git pull
git checkout -b feat/4-count
```

---

## (2) Context & Goal (배경 및 목표)

Currently, the `memo.sh` script supports add, list, and clear. To help users quickly see how many memos they have saved, we need a `count` command that displays the total number of items stored.
현재 `memo.sh` 스크립트는 추가(add), 목록 조회(list), 초기화(clear)를 지원합니다. 저장된 전체 메모가 몇 개인지 빠르게 파악할 수 있도록, 저장된 메모의 총 개수를 세어 출력하는 count 명령어를 추가합니다.

---

## (3) Implementation Detail (구현 상세)

### (A) Count Command Case
**Problem**: There is no command to count the number of stored memos in `$MEMO_FILE`.
**Solution**: Add a `count` case to the script that counts the number of lines in the memo file, and displays the total count.

```bash
# Before (변경 전)
  *)
    echo "사용법: memo add <내용> | memo list | memo clear"
    ;;

# After (변경 후)
  count)
    if [ -f "$MEMO_FILE" ]; then
      total_count=$(wc -l < "$MEMO_FILE" | tr -d ' ')
      echo "📊 총 메모 개수: ${total_count}개"
    else
      echo "📊 총 메모 개수: 0개"
    fi
    ;;
  *)
    echo "사용법: memo add <내용> | memo list | memo clear | memo count"
    ;;
```

---

## (4) Completion Criteria (완료 조건)

- [ ] Static Analysis (정적 분석) 0 errors
- [ ] Running `memo count` prints the correct number of memos saved in `$MEMO_FILE`. / `memo count` 실행 시 저장된 메모의 총 개수가 정확히 출력된다.

---

## (5) Report Template (보고 형식)

Report file: `tasks/reports/2026-05/18/memo-i4-single-count.md`

```markdown
# Report: Implement memo count command <br> 보고: memo count 기능 추가

## Completed Tasks (완료된 작업)
- [x] Add count command to case statement / count 명령어 case 추가
- [x] Verify counting behavior with different numbers of memos / 다양한 메모 개수 상황에서 카운트 동작 검증

## Changes (생성/수정된 파일)
| File | Symbol | Range |
|---|---|---|
| memo.sh | count | L26-34 |

## Static Analysis (정적 분석 결과)
N/A

## LLMWiki 지식 자산화 / Knowledge Assetization
- [ ] 문서 작성 완료 (경로: `content/01-Logs/archive/memo/{GIT_USERNAME}/{slug}/order.md` 및 `report.md`)
- [ ] 사용자 Skip 승인 획득 (사유: "-")
```
