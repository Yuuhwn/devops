# 4주차 - 자동화와 협업, 네트워크

## 배운 내용
- 리눅스 디렉터리 구조와 경로, find, grep, 파이프(|)
- 스크립트에서 변수, 인자, 조건, 반복
- 프로세스와 PID, kill
- tar로 백업하는 스크립트 (backup.sh), .gitignore
- Git 협업: 브랜치, PR, Merge, Conflict 해결, main 브랜치 보호
- 네트워크: IP, 포트, localhost, curl, 내 웹 서버 띄우기

## 실습 파일
| 파일 | 설명 |
|---|---|
| test/var.sh | 변수와 $(date) 사용 |
| test/greet.sh | 인자 개수($#) 확인 |
| test/check.sh | 파일인지 디렉터리인지 확인 (-f, -d) |
| backup.sh | 폴더를 tar.gz로 백업하고 backup.log에 기록 |
| site/index.html | 웹 서버 실습용 페이지 |

## backup.sh
```bash
./backup.sh          # test 폴더 백업
./backup.sh site     # 다른 폴더 백업
cat backups/backup.log
```
- `${1:-test}` 인자가 없으면 test 폴더를 백업한다
- `$?`로 tar가 성공했는지 확인한다
- backups/는 .gitignore에 넣어서 GitHub에 안 올린다

## Git 협업
- feature/backup-log 브랜치에서 로그 기능을 추가하고 PR #1로 squash merge 했다
- main과 fix 브랜치에서 backup.sh의 같은 줄을 다르게 고쳐서 Conflict가 났고, 로컬에서 해결한 뒤 PR #2를 merge 했다
- main 브랜치에 Ruleset을 걸어서 PR 없이는 push가 안 되게 했다

## 웹 서버
```bash
cd site
python3 -m http.server 8080
curl http://localhost:8080
```
- 8080 포트를 이미 쓰고 있으면 에러가 나는데, 그럴 때는 8000 같은 다른 포트로 실행하면 된다

## 배운 점
- 자주 하는 작업은 스크립트로 만들어 두면 같은 결과를 반복해서 얻을 수 있다
- 충돌은 Git이 고장 난 게 아니라 사람이 어떤 내용을 남길지 정하라는 뜻이다
