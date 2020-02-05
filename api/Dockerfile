FROM python:3.7-alpine
WORKDIR /code
COPY requirements.txt requirements.txt
RUN apk update && \
    apk add --virtual build-deps gcc python-dev musl-dev && \
    apk add postgresql-dev

RUN pip install -r requirements.txt
EXPOSE 5002
