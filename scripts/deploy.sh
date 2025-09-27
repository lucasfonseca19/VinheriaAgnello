#!/bin/bash

echo "🚀 Deploy automático - Vinheria Agnello"

# Verificar se o Ant está disponível
if ! command -v ant &> /dev/null; then
    echo "❌ Apache Ant não encontrado. Instalando via Homebrew..."
    brew install ant
fi

# Build e deploy usando Ant
echo "🔨 Fazendo build da aplicação..."
ant clean deploy

# Verificar se o deploy foi bem-sucedido
if [ $? -eq 0 ]; then
    echo "✅ Deploy realizado com sucesso!"

    # Verificar se o Tomcat está rodando
    if ! pgrep -f "catalina" > /dev/null; then
        echo "🚀 Iniciando Tomcat..."
        ./start_server.sh
    else
        echo "🔄 Tomcat já está rodando"
        echo "🌐 Acesse: http://localhost:8080/vinheria"
    fi
else
    echo "❌ Erro no deploy!"
    exit 1
fi