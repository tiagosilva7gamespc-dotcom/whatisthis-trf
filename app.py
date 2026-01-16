import gradio as gr
import os

# Pega a porta da variável 'PORT' da Render ou usa 7860 como padrão
port = int(os.environ.get("PORT", 7860))

def monitor(message, history):
    return "Nó Render Ativo. Monitorando tráfego..."

demo = gr.ChatInterface(fn=monitor, title="Network Quality Monitor")
# O bind em 0.0.0.0 e a porta dinâmica são cruciais na Render
demo.launch(server_name="0.0.0.0", server_port=port)
