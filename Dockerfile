FROM alpine:3.15.9

RUN apk add --no-cache git redis python3 py3-pip

WORKDIR /app

RUN git clone https://github.com/badtuxx/giropops-senhas.git

WORKDIR /app/giropops-senhas

RUN pip install --no-cache-dir -r requirements.txt

ENV REDIS_HOST=127.0.0.1

EXPOSE 5000

CMD ["sh", "-c", "redis-server --daemonize yes && flask run --host=0.0.0.0"]