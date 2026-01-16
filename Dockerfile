# Base oficial nativa (Alpine)
FROM traffmonetizer/cli_v2:latest

# Permissão root para configurar o ambiente
USER root

# Instala apenas o Python básico (sem Gradio para economizar RAM)
RUN apk add --no-cache python3 bash

WORKDIR /app

# Copia o disparador
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# A Render exige que uma porta seja exposta (padrão 10000)
EXPOSE 10000

CMD ["/bin/bash", "/app/entrypoint.sh"]
