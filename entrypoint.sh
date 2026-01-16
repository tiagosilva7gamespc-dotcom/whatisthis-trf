#!/bin/bash

echo "--- Iniciando Operário 02 (Render Node) ---"

# 1. Inicia o Traffmonetizer em background
if [ -f "./Cli" ]; then
    echo "✅ Binário nativo detectado."
    ./Cli start accept --token "f99SPwO2pZowxY5M2vU2MVQYEVlprfAJQdBhby7zJsc=" --device-name "Render_Master_Node" &
    echo "🚀 Traffmonetizer disparado!"
else
    echo "❌ Erro: Binário Cli não encontrado!"
    exit 1
fi

# 2. Servidor de "Disfarce" Ultraleve
# Isso responde na porta 10000 para a Render saber que o app está vivo
echo "--- Iniciando Servidor de Health Check (Porta 10000) ---"
python3 -m http.server 10000
