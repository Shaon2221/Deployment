FROM python:3.7-slim

RUN mkdir /app

ADD . /app

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN apt-get install g++ gcc git -y

RUN python -m pip install --upgrade pip

RUN pip install -r requirements.txt

COPY . /app

EXPOSE 5010
CMD ["python", "main.py"]
