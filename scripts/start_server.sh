#!/bin/bash

echo "🚀 Iniciando servidor Tomcat para Vinheria Agnello..."

# Caminho do Tomcat via Homebrew
CATALINA_HOME="/opt/homebrew/opt/tomcat/libexec"
export CATALINA_HOME

# Verificar se o Tomcat está rodando
if pgrep -f "catalina" > /dev/null; then
    echo "⚠️  Tomcat já está rodando. Parando primeiro..."
    $CATALINA_HOME/bin/shutdown.sh
    sleep 3
fi

# Iniciar Tomcat
echo "🔄 Iniciando Tomcat..."
$CATALINA_HOME/bin/startup.sh

# Aguardar inicialização
sleep 5

# Verificar se está rodando
if pgrep -f "catalina" > /dev/null; then
    echo "✅ Tomcat iniciado com sucesso!"
    echo "🌐 Acesse: http://localhost:8080/vinheria"
    echo "📊 Manager: http://localhost:8080/manager"
    echo "📝 Logs: tail -f $CATALINA_HOME/logs/catalina.out"
else
    echo "❌ Erro ao iniciar Tomcat"
    exit 1
fi