#!/bin/bash
# Remove a versão antiga e copia a pasta atual do projeto para o diretório webapps do Tomcat.

PROJECT_NAME="VinheriaAgnello"
TOMCAT_WEBAPPS_DIR="/opt/homebrew/opt/tomcat/libexec/webapps"

echo "Iniciando a publicação do projeto para o Tomcat..."

# Remove o diretório antigo, se existir
if [ -d "$TOMCAT_WEBAPPS_DIR/$PROJECT_NAME" ]; then
    echo "Removendo versão antiga..."
    rm -rf "$TOMCAT_WEBAPPS_DIR/$PROJECT_NAME"
fi

# Copia o projeto (a partir do diretório pai para pegar a pasta VinheriaAgnello)
echo "Copiando novos arquivos..."
cp -r "/Users/lucas/Documents/VinheriaAgnello" "$TOMCAT_WEBAPPS_DIR/"

echo "Publicação concluída!"
echo "Acesse: http://localhost:8080/$PROJECT_NAME/"
