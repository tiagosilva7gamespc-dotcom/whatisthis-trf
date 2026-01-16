#!/bin/bash

echo "--- Iniciando Operário 02 (Render Node) ---"

# 1. Inicia o Traffmonetizer com o seu Token
# Usamos o comando 'accept' validado anteriormente
if [ -f "./Cli" ]; then
    echo "✅ Binário nativo localizado. Iniciando compartilhamento..."
    ./Cli start accept --token "f99SPwO2pZowxY5M2vU2MVQYEVlprfAJQdBhby7zJsc=" --device-name "Render_Master_Node" &
    echo "🚀 Traffmonetizer disparado em background!"
else
    echo "❌ Erro: Binário Cli não encontrado!"
    exit 1
fi

# 2. Servidor de Health Check (Ultraleve)
# Binda explicitamente em 0.0.0.0 na porta 10000
echo "--- Iniciando Servidor de Status (Porta 10000) ---"
python3 -m http.server 10000 --bind 0.0.0.0
