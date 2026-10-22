# 2주차 - 실습 환경 구축과 버전 관리 기초

## 배운 내용
- 서버와 가상화 (베어메탈, 하이퍼바이저, 컨테이너 비교)
- WSL2 + Ubuntu 설치
- 리눅스 기본 명령어 (pwd, ls, cd, mkdir, cat, echo)
- 파일 권한 (chmod)
- Git 기초 (init, add, commit, push), gh로 GitHub 리포지터리 만들기

## 실습
- `hello.txt`, `text.txt`를 만들고 커밋해서 GitHub에 올렸다

```bash
echo "hello" > hello.txt
git add .
git commit -m "first commit"
git push
```

## 새로 배운 명령어
```bash
!!      # 바로 전 명령어 다시 실행
!ls     # ls로 시작하는 마지막 명령어 다시 실행
```

## 배운 점
- 컨테이너는 커널을 같이 써서 가상머신보다 가볍다
- 커밋은 내 컴퓨터에 기록만 남기는 거고 push를 해야 GitHub에 올라간다
