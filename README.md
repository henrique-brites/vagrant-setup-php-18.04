Vagrant-Setup Henrique Brites
===========

Servidor LAMP (Linux, Apache, MySQL, PHP)

Configuração do Vagrant (com provisionamento em Shell Script) para criar uma máquina virtual (Ubuntu Server 18.04 64 Bits) de desenvolvimento em PHP - Pronto para o desenvolvimento com Laravel.

### Pacotes Inclusos:

- PHP 7.3
- MySQL 5.7
- Git
- PhpMyAdmin 
- Composer
- cURL
- Vim
(Para mais detalhes consulte arquivo setup.sh)


Você vai precisar: 
==============

- Virtualbox - https://www.virtualbox.org/
- Vagrant - http://www.vagrantup.com/
- Git - http://git-scm.com ( Opicional )
- Acesso Internet


-> Instale o Virtualbox e o Vagrant de acordo com seu sistema operacional. ( A instalação é bem simples e pode ser feita sem muitas dificuldades... )


Modo de Uso
===========

A instalação inicial pode ser feita de duas formas, sendo:

1º -> Caso tenha o Git instaldo em sua máquina, proceda da seguinte forma:



* Clone esse repositório para sua máquina do pelo:

- git clone https://github.com/henrique-brites/vagrant-setup-php-18.04.git ( Execute o comando no seu Prompt/Terminal )

* Ainda no Prompt de comando/Terminal Entre no diretório vagrant-setup-php  ( Ou o que você definir na hora da clonagem )

* Inicie a máquina virtual pelo Vagrant com o comando:

- vagrant up 




2º -> Caso não tenha o Git instalado em sua máquina, acesse https://github.com/henrique-brites/vagrant-setup-php-18.04.git baixe o arquivo do projeto no formato .zip e descompacte-o onde desejar.

* Abra seu Prompt/Terminal , acesse o diretorio que acabou de descompactar e rode o comando:

- vagrant up




Após este comando 'vagrant up', o Vagrant ficará responsavel por baixar o sistema operacional ( neste caso Ubuntu Server 64 ), configurar a máquina virtual no VirtualBox e posteriormente baixar, instalar e configurar todos os pacotes do script 'setup.sh' (Sim! A primeira vez realmente é um pouco mais demorado).

Quando tudo estiver pronto, um servidor web estará disponível no endereço http://localhost:8080, e a instalação do PHPMyAdmin está em http://localhost:8080/phpmyadmin, para acessar utilize:

- Login: root
- Senha: vagrant

obs:(A senha padrão para todos os serviços é vagrant).


Coloque seu código no diretório "www". Todo o conteúdo dele estará disponível via http://localhost:8080. (Como teste, já existe um arquivo index.php que chama a função phpinfo() ).

Para desligar a máquina virtual utilize o comando:

- vagrant halt

Para religar novamente utilize:

- vagrant up

Caso queira destruir a máquina virtual (o conteúdo do www não será excluido):

- vagrant destroy

SSH na máquina virtual

- vagrant ssh

Recarregue a máquina virtual. Útil quando você precisa alterar as configurações de rede ou pasta sincronizada.

- vagrant reload

Reconfigure a máquina virtual após uma alteração no código-fonte.

vagrant provision

Compartilhe sua máquina virtual com o mundo por meio de um URL temporário e exclusivo.

- vagrant share

Por fim deixo um video para for usar o Putty para fazer a conexão ssh, tem o passo a passo de como conectar.
 * https://www.youtube.com/watch?v=MlACzrm0SCw 
 
 Corrigindo o problema dos Warning do phpMyAdmin
 *https://devanswers.co/problem-php-7-2-phpmyadmin-warning-in-librariessql-count/
 
 Composer 
* https://gist.github.com/vinnizworld/6896317