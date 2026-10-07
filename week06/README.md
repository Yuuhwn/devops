# Week 06: Dockerfile & ghcr.io

## 1. 내 이미지 주소
ghcr.io/yuuhwn/guestbook:v2

## 2. 친구 이미지 실행
img

## 3. Dockerfile의 각 줄이 하는 역
FROM python:3.12-slim — Python이 포함된 기본 이미지를 사용합니다.
WORKDIR /app — 컨테이너 내부의 작업 디렉터리를 /app으로 설정합니다.
COPY requirements.txt . — 라이브러리 목록을 별도로 복사하여 다음 단계가 캐시되도록 합니다.
RUN pip install ... — 이미지를 빌드할 때 필요한 라이브러리를 설치합니다.
COPY . . — 나머지 프로젝트 코드를 복사합니다.
RUN useradd -m appuser / USER appuser — root가 아닌 일반 사용자로 실행되도록 설정합니다.
ENV APP_TITLE / THEME_COLOR — 이미지에 기본 설정값을 지정합니다.
EXPOSE 5000 — 애플리케이션이 5000번 포트를 사용한다는 것을 문서화합니다. (포트를 실제로 외부에 개방하는 것은 아닙니다.)
CMD ["python", "app.py"] — 컨테이너가 시작될 때 실행할 명령어를 지정합니다.

## 4. 캐시 로그
log

## 5. 설정값을 지정하는 세 가지 방법
app.py — 코드에 기본값을 지정합니다. 값을 변경하려면 코드를 수정하고 이미지를 다시 빌드해야 합니다.
ENV in Dockerfile — 이미지를 빌드할 때 설정값이 이미지에 지정됩니다. 값을 변경하려면 이미지를 다시 빌드해야 합니다.
docker run -e — 컨테이너를 실행할 때 설정값을 지정합니다. 값을 변경할 때는 이미지를 다시 빌드할 필요 없이 컨테이너를 다시 실행하면 됩니다.
우선순위: app.py < ENV < docker run -e
