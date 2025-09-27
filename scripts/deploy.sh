#!/bin/bash

echo "🚀 Deploy automático com Maven - Vinheria Agnello"

# 1. Fazer o build da aplicação com Maven
echo "🔨 Fazendo build da aplicação com Maven..."
mvn clean install

# Verificar se o build foi bem-sucedido
if [ $? -ne 0 ]; then
    echo "❌ Erro no build do Maven! Abortando deploy."
    exit 1
fi

# 2. Definir caminhos
TOMCAT_WEBAPPS="/opt/homebrew/opt/tomcat/libexec/webapps"
WAR_FILE="target/vinheria.war"

# Verificar se o arquivo .war existe
if [ ! -f "$WAR_FILE" ]; then
    echo "❌ Arquivo .war não encontrado em '$WAR_FILE'! Abortando deploy."
    exit 1
fi

# 3. Parar o servidor Tomcat para garantir um deploy limpo
echo "🛑 Parando o Tomcat para um deploy limpo..."
./scripts/stop_server.sh
sleep 2 # Dar um tempo para o servidor parar completamente

# 4. Remover a versão antiga e fazer o deploy da nova
echo "🚚 Removendo versão antiga e fazendo deploy..."
rm -rf "$TOMCAT_WEBAPPS/vinheria"
rm -f "$TOMCAT_WEBAPPS/vinheria.war"
cp "$WAR_FILE" "$TOMCAT_WEBAPPS/"

# 5. Iniciar o servidor Tomcat
echo "🚀 Iniciando o Tomcat..."
./scripts/start_server.sh

echo "✅ Deploy concluído com sucesso!"
