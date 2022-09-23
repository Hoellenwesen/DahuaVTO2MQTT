FROM python:3.10-alpine
LABEL maintainer="Hoellenwesen"

WORKDIR /app

COPY . ./

RUN apk update && \
    apk upgrade && \
    pip install paho-mqtt requests

ENV DAHUA_VTO_HOST=vto-host
ENV DAHUA_VTO_SSL=False
ENV DAHUA_VTO_USERNAME=Username
ENV DAHUA_VTO_PASSWORD=Password
ENV MQTT_BROKER_HOST=mqtt-host
ENV MQTT_BROKER_PORT=1883
ENV MQTT_BROKER_USERNAME=Username
ENV MQTT_BROKER_PASSWORD=Password
ENV MQTT_BROKER_TOPIC_PREFIX=DahuaVTO
ENV MQTT_BROKER_CLIENT_ID=DahuaVTO2MQTT
ENV DEBUG=False
ENV PYTHONWARNINGS="ignore:Unverified HTTPS request"

RUN chmod +x /app/DahuaVTO.py

ENTRYPOINT ["python3", "/app/DahuaVTO.py"]