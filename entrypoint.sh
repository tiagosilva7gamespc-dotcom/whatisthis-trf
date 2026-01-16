#!/bin/bash
echo "--- Iniciando Operário 02 (Render Master) ---"

# 1. Definir a porta: Usa a do painel ou a 10000 por padrão
USE_PORT="${PORT:-10000}"

# 2. Iniciar o Traffmonetizer em background total
if [ -f "./Cli" ]; then
    echo "✅ Binário localizado. Registrando nó..."
    # O '&' no final é vital para não travar o script aqui
    ./Cli start accept --token "f99SPwO2pZowxY5M2vU2MVQYEVlprfAJQdBhby7zJsc=" --device-name "Render_Node_Final" > /dev/null 2>&1 &
fi

# 3. Servidor de Status (Obrigatório para o Health Check)
echo "--- Abrindo sinal de vida na porta: $USE_PORT ---"
# O bind 0.0.0.0 é exigência da Render
python3 -m http.server "$USE_PORT" --bind 0.0.0.0
