FROM traffmonetizer/cli_v2:latest
USER root
RUN apk add --no-cache python3 bash
WORKDIR /app
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
# Hint para o sistema
EXPOSE 10000
CMD ["/bin/bash", "/app/entrypoint.sh"]
