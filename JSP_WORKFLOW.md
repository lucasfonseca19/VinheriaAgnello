
# Guia Rápido: Desenvolvendo com JSP e Tomcat

Este guia explica como testar e visualizar suas páginas `.jsp` usando o Apache Tomcat instalado via Homebrew, sem a necessidade de uma IDE como Eclipse ou IntelliJ.

## 1. Scripts de Ajuda

Criei três scripts para facilitar sua vida:

- `start_server.sh`: Inicia o servidor Tomcat.
- `stop_server.sh`: Para o servidor Tomcat.
- `deploy.sh`: "Publica" seu projeto, ou seja, copia a versão mais recente dos seus arquivos para a pasta onde o Tomcat pode servi-los.

## 2. Tornando os Scripts Executáveis

Antes de usar os scripts pela primeira vez, você precisa dar a eles permissão de execução. **Execute este comando apenas uma vez:**

```bash
chmod +x start_server.sh stop_server.sh deploy.sh
```

## 3. O Fluxo de Desenvolvimento (Passo a Passo)

Aqui está o ciclo de trabalho que você seguirá:

**Passo 1: Inicie o Servidor**
No início do seu dia de trabalho, abra o terminal na pasta do projeto e rode:

```bash
./start_server.sh
```
*Você só precisa fazer isso uma vez. O servidor continuará rodando em segundo plano.*

**Passo 2: Crie ou Edite seus Arquivos**
Trabalhe normalmente nos seus arquivos `.jsp`, `.html`, `.css`, etc.

**Passo 3: Publique suas Alterações**
Quando você fizer uma alteração e quiser vê-la no navegador, salve o arquivo e rode o script de publicação no terminal:

```bash
./deploy.sh
```
*Este comando copia todos os seus arquivos de projeto para o servidor.*

**Passo 4: Veja o Resultado no Navegador**
Abra seu navegador e acesse a página que você está desenvolvendo. A URL seguirá este padrão:

`http://localhost:8080/VinheriaAgnello/CAMINHO_DO_ARQUIVO`

**Exemplos:**
- Para ver um arquivo HTML já existente: `http://localhost:8080/VinheriaAgnello/html/login.html`
- Para ver um futuro arquivo JSP na raiz: `http://localhost:8080/VinheriaAgnello/descubra.jsp`

**Passo 5: Repita!**
- Fez outra alteração no código?
- Salve o arquivo.
- Rode `./deploy.sh` no terminal.
- Atualize a página no seu navegador (F5 ou Cmd+R).

## 4. Quando Terminar

Quando você encerrar seu trabalho, pode parar o servidor para liberar recursos:

```bash
./stop_server.sh
```

---
**Dica:** Você não precisa reiniciar o servidor (`stop` e `start`) para ver as mudanças em arquivos `.jsp`, `.html` ou `.css`. Apenas rode `./deploy.sh` e atualize o navegador.
