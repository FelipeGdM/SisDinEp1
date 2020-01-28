# Primeiros passos

### Instalar o Git

Para embarcar nessa jornada, é necessário antes de mais nada um bom editor de texto (além, obviamente, do próprio MatLab).  

- Visual Studio Code, querido [vscode](https://code.visualstudio.com/)
- [Notepad++](https://notepad-plus-plus.org/download/v7.6.6.html)

Mecatrônicos costumam gostar do Notepad++ pras tarefas do dia a dia, ele é melhor pra fazer coisas simples do que o vscode (escrever a mensagem de um commit, por exemplo), recomendo a experiência.  

Em segundo lugar, é necessário instalar a ferramenta do Git

- [Git](https://git-scm.com/downloads) 

Um passo opcional, existem duas ferramentas com interface gráfica que ajudam (bastante) o uso do Git, de modo que você não precise se aventurar com a linha de comando. Eu prefiro executar os comandos na mão, vou deixar anotado aqui caso você queira usar. (Pessoalmente, eu recomendo o GitKraken):

- [GitKraken](https://www.gitkraken.com/) 
- [GitHub Desktop](https://desktop.github.com/)

### Baixar os arquivos

Para contribuir com o projeto, é necessário _clonar_ o repositório (no dialeto computeiro, isso significa baixar o projeto localmente). Caso você prefira usar um programa com interface gráfica, o processo é todo auto explicativo. Vou documentar aqui a série de comandos necessários para fazer tudo pela linha de comando

Para começar, navegue até a pasta em que você deseja salvar os arquivos:

```bash
dir                # lista as pastas e arquivos do diretório atual
cd <nome da pasta> # entra na pasta 
```

Dentro da pasta desejada, execute:

```bash
git clone https://github.com/FelipeGdM/SisDinEp1.git
```

Pronto!  
Esse comando irá criar uma pasta chamada SisDinEp1 no diretório atual e irá fazer o download de todos os arquivos do projeto.

### Baixar alterações

É um bom hábito sempre checar se há algo novo no repositório antes de começar a trabalhar. Para atualizar os arquivos locais, digite:

```bash
git pull
```

### Registrar alterações

Após alguma alteração no projeto, basta digitar:

```bash
git add *
git commit
```

O comando ```git add *``` adiciona todos os arquivos ("*" é um [metacaracter](https://www.ibm.com/support/knowledgecenter/pt-br/SSSHTQ_7.4.0/com.ibm.netcool_OMNIbus.doc_7.4.0/omnibus/wip/common/reference/omn_ref_re_metacharacters.html), ou caracter curinga) Sozinho, ele se traduz como "todos os arquivos"

Um editor de texto será aberto para que você escreva a mensagem de commit. Quando o editor for fechado, o commit será salvo (para cancelar o commit, basta fechar o editor com uma mensagem em branco).

### Enviar alterações

Após a criação do commit, é necessário enviar as alterações para o servidor. Para fazer isso, digite:

```bash
git push
```


