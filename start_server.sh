#!/bin/bash
# Inicia o serviço do Tomcat usando o Homebrew.
echo "Iniciando o servidor Tomcat..."
brew services start tomcat
echo "Servidor iniciado. Acesse http://localhost:8080"
