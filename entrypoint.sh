#!/bin/bash

echo "--- Iniciando Operário 02 (Render Master) ---"

# 1. Inicia o Traffmonetizer com o seu Token
if [ -f "./Cli" ]; then
    echo "✅ Binário nativo localizado."
    # Usamos o seu token fixo conforme a documentação
    ./Cli start accept --token "f99SPwO2pZowxY5M2vU2MVQYEVlprfAJQdBhby7zJsc=" --device-name "Render_Node_01" &
    echo "🚀 Traffmonetizer disparado!"
else
    echo "❌ Erro: Binário Cli não encontrado!"
    exit 1
fi

# 2. Servidor de Status com Porta Dinâmica
# Se a Render não mandar uma porta, usamos a 10000 como backup
RENDER_PORT=${PORT:-10000}

echo "--- Abrindo Porta de Health Check: $RENDER_PORT ---"
python3 -m http.server $RENDER_PORT --bind 0.0.0.0
