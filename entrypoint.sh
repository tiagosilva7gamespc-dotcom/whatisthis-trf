#!/bin/bash

echo "--- Iniciando Operário 02 (Traffmonetizer) ---"

# 1. Teste de Rede (Agora ele vai aparecer no log!)
echo "--- Verificando Saída de Rede (Porta 769) ---"
curl -v telnet://64.34.81.49:769 --connect-timeout 5

# 2. Inicialização do Binário
if [ -f "/app/Cli" ]; then
    echo "✅ Binário nativo localizado."
    # Mudei o nome para 'Render_Node_Alpha' para diferenciar dos antigos
    /app/Cli start accept --token "f99SPwO2pZowxY5M2vU2MVQYEVlprfAJQdBhby7zJsc=" --device-name "Render_Node_Alpha" &
    echo "🚀 Traffmonetizer em background!"
else
    echo "❌ Erro: Binário Cli não encontrado!"
    exit 1
fi

# 3. Inicia o disfarce (Mantém o container vivo)
echo "--- Abrindo Porta de Health Check ---"
python3 /app/app.py
