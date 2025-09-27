#!/bin/bash

echo "🛑 Parando servidor Tomcat..."

# Caminho do Tomcat via Homebrew
CATALINA_HOME="/opt/homebrew/opt/tomcat/libexec"
export CATALINA_HOME

# Verificar se está rodando
if pgrep -f "catalina" > /dev/null; then
    echo "🔄 Parando Tomcat..."
    $CATALINA_HOME/bin/shutdown.sh

    # Aguardar 5 segundos
    sleep 5

    # Verificar se parou
    if pgrep -f "catalina" > /dev/null; then
        echo "⚠️  Forçando parada do Tomcat..."
        pkill -f "catalina"
        sleep 2
    fi

    if ! pgrep -f "catalina" > /dev/null; then
        echo "✅ Tomcat parado com sucesso!"
    else
        echo "❌ Erro ao parar Tomcat"
        exit 1
    fi
else
    echo "ℹ️  Tomcat não está rodando"
fi