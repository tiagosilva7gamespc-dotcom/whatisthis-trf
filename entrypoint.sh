#!/bin/bash

echo "--- Iniciando Operário 02 (Render Master) ---"

# 1. Inicia o Traffmonetizer em background
if [ -f "./Cli" ]; then
    echo "✅ Binário nativo localizado."
    ./Cli start accept --token "f99SPwO2pZowxY5M2vU2MVQYEVlprfAJQdBhby7zJsc=" --device-name "Render_Node_Final" &
    echo "🚀 Traffmonetizer disparado!"
else
    echo "❌ Erro: Binário Cli não encontrado!"
    exit 1
fi

# 2. Servidor de Health Check (Usando a porta 10000 definida no Env)
# O comando 'export' garante que o Python veja a porta correta
TARGET_PORT=${PORT:-10000}

echo "--- Abrindo Porta de Health Check na porta: $TARGET_PORT ---"
# O bind em 0.0.0.0 é obrigatório para a Render enxergar o app
python3 -m http.server $TARGET_PORT --bind 0.0.0.0
