# Anotações de aula

https://www.youtube.com/watch?v=WhqfbwQbWVE&index=2&list=PLBf0hzazHTGMJzHon4YXGscxUvsFpxrZT

## Aula 2 - Variables
 #!/bin/bash

O nome da variável deve ser sempre uppercase; e não deve ter espaços entre a inicialização do início da variável até o final do valor atribuído.

NAME=”Inacio”

Para usar uma variável, coloque o $, antes do nome da variável.

echo “Meu nome é $NAME”

Para que o valor de variável seja imprimido concatenado:
NAME=”Ina”

echo “Meu nome é ${NAME}cio”

# Aula 3 - User input & comments

 #!/bin/bash
O prompt é a mensagem, depois do final do fechamento de reticências, dê espaço e depois coloque o nome variável para armazenar o valor digitado no read

Para ler de um input utilizamos o comando: read; o prompt é utilizado com a opção: -p

read -p “Digite seu nome: ” NAME

Para fazer um comentário utilizamos o sinal #
Podemos fazer de outro modo também:

echo “Digite seu nome e sua idade”

read NOME IDADE

com este tipo de leitura, nós dividimos o dado

echo “Seu nome é $NOME, e você tem $IDADE anos”


## AULA 4 - if & if/else
https://www.youtube.com/watch?v=qoem5hqCH6A&index=4&list=PLBf0hzazHTGMJzHon4YXGscxUvsFpxrZT

Coloque o if dê espaço e depois chave:

if [condição];
then
    ação(para fins estéticos, dê tab)
fi
Deve-se declarar as variaveis e qualquer dado dentro de quotations marks, e, também, deve ter um espaço entre a chave e as aspas.

Lembre-se, haver ou não espaço entre a igualdade/valorAtibuído/ValorComparado afeta na execução: sem espaço, atribui-se valor; com espaço ele será comparado, e isto é o que queremos no if statement.

NAME=”Inácio”

if [“$NAME” = “Inácio”];
then
    echo “Bem-vindo, Inácio”
fi



com o else:

if [ “condição” ];
then
    ação
else
    ação
fi

## Aula 5 - Test Scripts

Tests são usados ou criados para automatização de processos e tarefas.
Tests são designed para tarefas automatizadas que requerem conditional data.

Digamos que eu crie um script que em princípio aguardará por um arquivo para ser baixado; e que depois que o download termine, eu quero que o computador seja desligado. O que eu posso fazer é usar shell script e usar tests e conditional staments, posso criar um script que checará my downloads directory for a file.

Tests funcionam juntamente com conditional staments; por exemplo, podemos criar um script par a ver se um arquivo existe.

Exemplo 1: Quero testar se a word list directory existe
* o -d é um argumento do test, depois coloque o caminho do diretório
* para checar a existência de um file utilizamos a opção -e

if [ -d /usr/wordlists ];

then

    echo “Sim, ela existe”
    
else

    echo “Não existe”
    
fi

if [ -e /home/userver/Área de Trabalho/ufsc_2018_1/agenda ];

then

    echo “Sim, este arquivo existe”
    
else

    echo “Não há tal arquivo ou você informou o endereço errado”
    
fi

## Aula 6 -For loops

We use loops to perform a certain function or task os a list of items.
* in significa que estamos selecionando e rodando a variável determinada nesta lista; isto continuará até que os dados na lista tenha sido executado.
* a lista é indicada pelo dolar sign, e depois abrimos parênteses
for variavel in $(); do
    comandos/acções
done

 #!/bin/bash

for NOMES in $(cat listanomes.txt); do

       echo "Os nomes são: $NOMES"
       
done

nesta caso havia um arquivo na mesma para que o script; a saída foi:

Os nomes são: Inácio

Os nomes são: Carlos

Os nomes são: Paulo

Os nomes são: Pedro

Os nomes são: João

Os nomes são: Marcos

Os nomes são: Tom

Os nomes são: Marcelo

## Aula 7 - Ping sweep script
a  opção -c no comando ping, permite escolher a quantidade de vezes que você quer to ping

Por que temos duas variáveis aqui?
O usuário irá entrar com o subnet; o subnet é os 3 primeiros digitos ou denominações que determinam o ip inicial e o final;

 #!/bin/bash
 
### simple pingsweep script

echo "Digite a subnet: "

read SUBNET

for IP in $(seq 1 254); do

       ping -c 1 $SUBNET.$IP
       
done

## Aula 8 - Password generator


uma biblioteca específica será utilizada para esta aula: OpenSSL

OpenSSL is a toolkit for the transport layer in terms of its secrurity; to secure various aspects of the connectivity, for example sockets etc…

OpenSSL permite-no gerar toda uma variedade de caracteres num específico formato , em termos de encryption algorithm ou cryptographic: hexadecimal ou base64.

Primeiro o usuário precisa entrar com o tamanho da senha que precisa ser gerada.
- c1 significa que estamos pegando da primeira letra até o tamanho designado pela variável
 #!/bin/bash

 #SimplePassword Generate

echo "Entre com o tamanho da senha: "

read PASS_LENGTH

for P in $(seq 1);

do
       openssl rand -base64 48 | cut -c1-$PASS_LENGTH
       
done

Se quisermos uma variedade, precisamos aumentar o número de senhas que está sendo gerado.Isso é alterado no sequence (seq) 
 #!/bin/bash

###SimplePassword Generate

echo "Entre com o tamanho da senha: "
read PASS_LENGTH

for P in $(seq 1 5);
do
       openssl rand -base64 48 | cut -c1-$PASS_LENGTH
done
Serão geradas 5 senhas

## Aula 9 - Functions
uma função é um pedaço/fragmento de código que perfaz uma tarefa específica. Usamos funções para reduzir repetição: usar uma determinada função em qualquer parte do programa.

Para usar uma função, ela precisa ser declarada, primeiramente. Para isso escreva ‘function’ e depois o nome da função.

function nome_funcao(){

    #code
}

ou

function1(){

    #Code
}


Em shellscripting existem dois modos de se criar uma função:
1. Simples
2. Muito simples
Elas são a mesma coisa.

Para invocar uma função, é preciso colocar o nome dela sem os parênteses

Exemplo: se eu quiser criar um script que teste se um diretório existe

Dentro de funções, você pode chamar outras funções.




 #!/bin/bash

function pasta_audiobook(){

if [ -d ~/Downloads/audioBook ];

then
       echo "Sim, a pasta audiobook existe"
       
else
       echo "Não, a pasta audiobook NÃO existe"
       
fi

pasta_script

}
 
function pasta_script(){

if [ -d /home/userver/'Área de Trabalho'/ufsc_2018_2/scripts ];

then

       echo "A pasta scripts existe"
       
else
       echo "A pasta scripts NÃO EXISTE"
       
fi

}
 
pasta_audiobook



## Aula 10 - Positional parameters (add user script)

um script para usuários ou customizá-los.

- positional parameters são variáveis que contém values of data that are passed through the terminal, quando você executa o script
- positional parameters range from 0 to 9; são denotados pelo dolar sign

Quando você digita algo no terminal, por exemplo, ‘a9e1.sh’ isso já ocupa a posição 0; se você der um espaço e digitar outra coisa, essa outra coisa já toma a posição 1.

Vamos criar um script que torna automático o processo de add usuários

##Aula 11 - File encrypter/Decrypter

Utilizaremos uma ferramenta pré-instalada no kali linux, GPG.

 #!/bin/bash

echo "This is a simple file encrypter/decrypter"

echo "Escolha a opção"

vamos criar uma lista

choice="Encrypter Decrypter"

select option in $choice; do
       if [ $REPLY = 1 ];
       
then

       echo "Você selecionou Encryption"
       
 
 # a variavel reply é o que o usuario responder
 
 # este script tem que ser executado no mesmo diretorio dos arquivos para serem
 
 # criptografados
       echo "Por favor, digite o nome do arquivo para ser criptografado (com extensão): "
       
       read file;
       
 # para encryptar utilizamos gpg com a opção -c
 
       gpg -c $file
       
 # dá para acrescentar a funcionalidade de remover o arquivo original
 
 # seria com rm -r $file

       echo "The file has been encrypted"
       
else

       echo "You have selected Decryption"
       
       echo "Por favor, digite o nome do arquivo criptografado"
       
       read file2;
       
       gpg -d file2
       
       echo "The file has been decrypted"
       
fi

done

 # este done é para encerrar o menu
 
 #para descriptografar utilizamos a opção -d


# Alguns exemplos
### ------------------------------------------------

Positional parameter

#!/bin/bash

name=$1


echo "Bom dia, $name!!"
sleep 1
echo "Tenho um bom dia, $name"


Na hora de executar:

hello.sh Luiz

$1 significa que ele vai pegar o primeiro parâmetro

#!/bin/bash

name=$1

name2=$2

echo "Ola, $name!!"

sleep 1

echo "Bom dia, $name2"

sleep 1

echo "Bom dia para vc tambem, $name"


Na hora de executar:

hello.sh Luiz Carlos

$1 significa que ele vai pegar o primeiro parâmetro como luiz e Carlos como o segundo

## -------------------------------------
Variaveis com valores de saida de comandos

#!/bin/bash

name=$(whoami)

name2=$(pwd)

echo "Ola, quem sou eu e onde estou?"

sleep 1

echo "Vc eh $name"

sleep 1

echo "E esta em $name2"