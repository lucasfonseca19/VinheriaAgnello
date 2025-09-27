# Vinheria Agnello

Este é um projeto acadêmico de e-commerce para a Vinheria Agnello, uma loja de vinhos fictícia focada em replicar a experiência de uma consultoria personalizada no ambiente digital.

## Tecnologias Utilizadas

*   **Linguagem**: Java 11+
*   **Servidor de Aplicação**: Apache Tomcat 9+
*   **Frontend**: JSP (JavaServer Pages) com Bootstrap
*   **Build e Dependências**: Apache Maven

## Pré-requisitos

Antes de começar, garanta que você tenha os seguintes softwares instalados em sua máquina:

1.  **JDK (Java Development Kit)**: Versão 11 ou superior.
2.  **Apache Maven**: Para compilação do projeto e gerenciamento de dependências.
3.  **Apache Tomcat**: Versão 9 ou superior, para deploy da aplicação.

## Como Executar o Projeto

Siga os passos abaixo para configurar e executar a aplicação localmente.

### 1. Clone o Repositório

```bash
git clone <url-do-repositorio>
cd VinheriaAgnello
```

### 2. Compile o Projeto com Maven

Este comando irá compilar o código-fonte, resolver as dependências e empacotar a aplicação em um arquivo `.war` dentro do diretório `target/`.

```bash
mvn clean install
```
Ao final do processo, você encontrará o arquivo `vinheria.war` no diretório `target/`.

### 3. Configure o Apache Tomcat

Se você ainda não tem o Tomcat, baixe-o no [site oficial do Apache Tomcat](https://tomcat.apache.org/download-90.cgi) e descompacte-o em um local de sua preferência.

### 4. Faça o Deploy da Aplicação

Copie o arquivo `vinheria.war` gerado pelo Maven para o diretório `webapps` da sua instalação do Tomcat.

```bash
# Exemplo de comando (substitua pelo caminho correto da sua instalação)
cp target/vinheria.war /seu/caminho/para/apache-tomcat-9.x.xx/webapps/
```

### 5. Inicie o Servidor Tomcat

Navegue até o diretório `bin` da sua instalação do Tomcat e execute o script de inicialização.

**No macOS ou Linux:**
```bash
sh startup.sh
```

**No Windows:**
```bash
startup.bat
```

O Tomcat irá iniciar e fazer o deploy automático da aplicação a partir do arquivo `.war`.

### 6. Acesse a Aplicação

Abra seu navegador e acesse a URL:

[http://localhost:8080/vinheria/](http://localhost:8080/vinheria/)

A aplicação estará pronta para uso.
