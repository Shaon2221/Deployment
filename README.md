# Deployment
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
CMD ["python", "application.py"]


### Commands
docker build -t pred-model:1.0 .
docker run -d -p 5010:5010 --name pred pred-model:1.0
docker ps
docker logs -f pred
docker stop pred-model1.0
docker rm pred-model1.0
docker prune

docker tag <imageID> shaon2221/name&version:1.0
docker push shaon2221/opus-face:1.0

https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install-windows.html
aws configure
eb init
eb create
