#!/bin/bash

echo "--- Iniciando Operário 02 (Traffmonetizer) ---"

# Caminho nativo da imagem oficial
if [ -f "/app/Cli" ]; then
    echo "✅ Binário nativo localizado."
    # Comando 'accept' conforme a documentação que você enviou
    /app/Cli start accept --token "f99SPwO2pZowxY5M2vU2MVQYEVlprfAJQdBhby7zJsc=" --device-name "HF_Master_Node" &
    echo "🚀 Traffmonetizer em background!"
else
    echo "❌ Erro: Binário Cli não encontrado!"
    exit 1
fi

# Inicia o disfarce IMEDIATAMENTE. O Hugging Face precisa disso na porta 7860.
echo "--- Abrindo Porta 7860 (Gradio) ---"
python3 /app/app.py

echo "--- Teste de Conectividade ---"
# Tenta ver se a porta 769 está aberta no servidor deles
curl -v telnet://64.34.81.49:769 --connect-timeout 5
