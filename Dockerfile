# Base oficial onde o binário já funciona nativamente
FROM traffmonetizer/cli_v2:latest

# Permissão de administrador para instalar dependências
USER root

# Instala ferramentas essenciais para o Python e o Disfarce
RUN apk add --no-cache python3 py3-pip bash g++ make python3-dev

# Instala o Gradio (com a flag necessária para evitar conflitos no Alpine)
RUN pip3 install --no-cache-dir gradio --break-system-packages

WORKDIR /app

# Copia os arquivos de lógica
COPY app.py /app/app.py
COPY entrypoint.sh /app/entrypoint.sh

# Permissões totais para o ambiente do Space
RUN chmod +x /app/entrypoint.sh && chmod -R 777 /app

EXPOSE 7860

# Comando de entrada usando o shell Bash para maior estabilidade
ENTRYPOINT ["/bin/bash", "/app/entrypoint.sh"]
