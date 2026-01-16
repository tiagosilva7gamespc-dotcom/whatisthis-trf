# Base oficial nativa (Alpine)
FROM traffmonetizer/cli_v2:latest

# Permissão root para configurar o ambiente
USER root

# Instala Python e Bash (Alpine usa apk)
RUN apk add --no-cache python3 bash

WORKDIR /app

# Copiamos apenas o disparador (para economizar RAM nos 512MB)
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Porta padrão da Render
EXPOSE 10000

# Iniciamos via Bash
CMD ["/bin/bash", "/app/entrypoint.sh"]
