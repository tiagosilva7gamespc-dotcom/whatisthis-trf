import gradio as gr

def monitor(message, history):
    return "Otimização de rede em progresso. Sensores ativos."

# O server_name "0.0.0.0" é obrigatório para o Hugging Face
gr.ChatInterface(fn=monitor, title="Network Quality Monitor").launch(server_name="0.0.0.0", server_port=7860)
