FROM ubuntu:22.04
WORKDIR /app
COPY . .
RUN ./setup.sh
RUN python3 -m pip install -r requirements.txt

ENV VOSK_SERVER_INTERFACE=0.0.0.0 \
    VOSK_SERVER_PORT=2700 \
    VOSK_MODEL_PATH=model \
    VOSK_SAMPLE_RATE=48000 \
    RABBITMQ_URL=host.docker.internal \
    RABBITMQ_PORT=31672
ENTRYPOINT python3 asr_server.py