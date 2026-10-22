# 3주차 - 셸 스크립팅

## 배운 내용
- 자동화가 필요한 이유
- Ollama로 내 컴퓨터에서 Qwen 모델 실행
- 파이썬으로 만든 간단한 웹 채팅 (chat.py)
- start.sh 작성하고 한 줄씩 분석 (#!, $0, dirname, $( ), ||, exec)
- 실행 권한, 환경 변수(export), if, 리다이렉션 (>/dev/null, 2>&1)

## 실습 파일 (qwen-web/)
| 파일 | 설명 |
|---|---|
| chat.py | 질문을 Ollama에 보내고 답변을 웹 페이지로 보여주는 채팅 서버 |
| start.sh | chat.py가 있는 폴더로 이동해서 실행 |
| start_with_export.sh | MODEL 환경 변수로 모델을 바꿔서 실행 |
| start_with_export_2.sh | WEB_PORT 환경 변수로 포트를 바꿔서 실행 |

## start.sh
```bash
#!/bin/bash
cd "$(dirname "$0")" || exit 1
exec python3 chat.py
```
- `#!/bin/bash` bash로 실행한다
- `cd "$(dirname "$0")"` 스크립트가 있는 폴더로 이동해서 다른 위치에서 실행해도 된다
- `|| exit 1` cd가 실패하면 바로 종료한다
- `exec` 셸 대신 python3이 그 자리에서 실행된다

## 실행
```bash
chmod +x qwen-web/*.sh
./qwen-web/start.sh                 # http://localhost:8000
./qwen-web/start_with_export_2.sh   # http://localhost:8080
```

## 배운 점
- 코드를 안 고치고 환경 변수만 바꿔서 모델이나 포트를 바꿀 수 있다
- dirname "$0"을 쓰면 어디서 실행해도 스크립트 위치 기준으로 동작한다
# 3주차 - 셸 스크립팅

## 배운 내용
- 자동화가 필요한 이유
- Ollama로 내 컴퓨터에서 Qwen 모델 실행
- 파이썬으로 만든 간단한 웹 채팅 (chat.py)
- start.sh 작성하고 한 줄씩 분석 (#!, $0, dirname, $( ), ||, exec)
- 실행 권한, 환경 변수(export), if, 리다이렉션 (>/dev/null, 2>&1)

## 실습 파일 (qwen-web/)
| 파일 | 설명 |
|---|---|
| chat.py | 질문을 Ollama에 보내고 답변을 웹 페이지로 보여주는 채팅 서버 |
| start.sh | chat.py가 있는 폴더로 이동해서 실행 |
| start_with_export.sh | MODEL 환경 변수로 모델을 바꿔서 실행 |
| start_with_export_2.sh | WEB_PORT 환경 변수로 포트를 바꿔서 실행 |

## start.sh
```bash
#!/bin/bash
cd "$(dirname "$0")" || exit 1
exec python3 chat.py
```
- `#!/bin/bash` bash로 실행한다
- `cd "$(dirname "$0")"` 스크립트가 있는 폴더로 이동해서 다른 위치에서 실행해도 된다
- `|| exit 1` cd가 실패하면 바로 종료한다
- `exec` 셸 대신 python3이 그 자리에서 실행된다

## 실행
```bash
chmod +x qwen-web/*.sh
./qwen-web/start.sh                 # http://localhost:8000
./qwen-web/start_with_export_2.sh   # http://localhost:8080
```

## 배운 점
- 코드를 안 고치고 환경 변수만 바꿔서 모델이나 포트를 바꿀 수 있다
- dirname "$0"을 쓰면 어디서 실행해도 스크립트 위치 기준으로 동작한다
