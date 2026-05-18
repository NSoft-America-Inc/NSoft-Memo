---
project: memo
type: single
issue: https://github.com/NSoft-America-Inc/NSoft-Memo/issues/3
created: 2026-05-18 15:20:00
completed: "-"
llmwiki: "-"
---

**Issue:** [NSoft-Memo#3](https://github.com/NSoft-America-Inc/NSoft-Memo/issues/3)
**Order:** [memo-i3-single-clear.md](tasks/orders/2026-05/18/memo-i3-single-clear.md)
**Report:** [memo-i3-single-clear.md](tasks/reports/2026-05/18/memo-i3-single-clear.md)

# Task: Implement memo clear command <br> 작업: memo clear 기능 추가

**Agent (담당):** developer-a
**Created At (생성일시):** 2026-05-18 15:20:00 (Local Time)

---

## (1) Git Setup (Git 작업)

```bash
git checkout main && git pull
git checkout -b feat/3-clear
```

---

## (2) Context & Goal (배경 및 목표)

Currently, the `memo.sh` script only supports adding and listing memos. In order to make it easier to start fresh or remove obsolete memos, we need a way to clear the entire memo file.
현재 `memo.sh` 스크립트는 메모 추가(add) 및 조회(list) 기능만 지원합니다. 불필요한 메모를 모두 비우고 새로 시작하기 쉽게 하기 위해 전체 메모를 초기화하는 clear 명령어를 추가합니다.

---

## (3) Implementation Detail (구현 상세)

### (A) Clear Command Case
**Problem**: There is no command to delete all stored memos in `$MEMO_FILE`.
**Solution**: Add a `clear` case to the script that removes the memo file if it exists, and displays a success message.

```bash
# Before (변경 전)
  *)
    echo "사용법: memo add <내용> | memo list"
    ;;

# After (변경 후)
  clear)
    if [ -f "$MEMO_FILE" ]; then
      rm "$MEMO_FILE"
      echo "✅ 모든 메모 삭제됨"
    else
      echo "ℹ️ 삭제할 메모가 없습니다"
    fi
    ;;
  *)
    echo "사용법: memo add <내용> | memo list | memo clear"
    ;;
```

---

## (4) Completion Criteria (완료 조건)

- [ ] Static Analysis (정적 분석) 0 errors
- [ ] Running `memo clear` deletes `$MEMO_FILE` and shows confirmation message. / `memo clear` 실행 시 메모 파일이 삭제되고 완료 메시지가 표시된다.

---

## (5) Report Template (보고 형식)

Report file: `tasks/reports/2026-05/18/memo-i3-single-clear.md`

```markdown
# Report: Implement memo clear command <br> 보고: memo clear 기능 추가

## Completed Tasks (완료된 작업)
- [x] Add clear command to case statement / clear 명령어 case 추가
- [x] Verify delete behavior and messages / 삭제 동작 및 메시지 검증

## Changes (생성/수정된 파일)
| File | Symbol | Range |
|---|---|---|
| memo.sh | clear | L18-28 |

## Static Analysis (정적 분석 결과)
N/A

## LLMWiki 지식 자산화 / Knowledge Assetization
- [ ] 문서 작성 완료 (경로: `content/01-Logs/archive/memo/{GIT_USERNAME}/{slug}/order.md` 및 `report.md`)
- [ ] 사용자 Skip 승인 획득 (사유: "-")
```
