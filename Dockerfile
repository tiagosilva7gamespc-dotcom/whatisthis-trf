FROM traffmonetizer/cli_v2:latest
USER root

# Adicionado 'curl' e 'ca-certificates' para garantir a conexão
RUN apk add --no-cache python3 py3-pip bash g++ make python3-dev curl ca-certificates

RUN pip3 install --no-cache-dir gradio --break-system-packages

WORKDIR /app
COPY app.py /app/app.py
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh && chmod -R 777 /app

EXPOSE 7860
ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]
