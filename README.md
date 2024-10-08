# RaspKioskMode
Utilizar o  Raspberry Pi OS no modo Kiosk exibindo URLs com o Chromium e alternando entre e/ou URL única

***Kiosk Mode no Raspberry Pi usando a distribuição Raspbian***

O *Kiosk Mode* (ou Modo Quiosque) é um recurso utilizado em totens de auto atendimento e painéis informativos, onde há a necessidade de disponibilizar ao usuário somente um navegador de internet com uma ou mais páginas específicas, ocultando todos os outros atalhos disponíveis do sistema operacional.

- **Distribuição utilizada:** Raspberry Pi OS Lite (64-bit) - Release date: Octuber 04th 2024
- **Download:** [https://www.raspberrypi.org/software/operating-systems/](https://www.raspberrypi.org/software/operating-systems/ "https://www.raspberrypi.org/software/operating-systems/")

Aqui vamos explanar e coletando ajuda da comunidade para que o script fique cada vez mais robusto e focado em melhorar também a segurança, pois muitas vezes é utilizado em projetos de IoT mantendo esses equipamentos em locais distantes e sem supervisão.

## Instalação Automatizada

Executar em um terminal a seguinte linha de comando (requer conexão à internet):


	$ sudo wget -O - https://raw.githubusercontent.com/FernandoLorenzi/RaspKioskMode/master/install.sh | bash

------------

## Instalação Manual


#### 1. REMOVER PACOTES DESNECESSÁRIOS


	$ sudo apt-get purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
	$ sudo apt-get purge smartsim java-common minecraft-pi libreoffice* -y


#### 2. LIMPAR ARQUIVOS RESIDUAIS

	$ sudo apt-get clean
	$ sudo apt-get autoremove -y


#### 3. ATUALIZAR O SISTEMA

	$ sudo apt-get update
	$ sudo apt-get upgrade


#### 4. INSTALAR PACOTES NECESSÁRIOS PARA O *KIOSK MODE*

	$ sudo apt-get install xdotool unclutter sed


#### 5. HABILITAR O LOGIN AUTOMÁTICO

	$ sudo raspi-config

1. Opcao 1 - System Options
2. Opcao S5 - Boot/Autologin
3. Opção B4 - Desktop Autologin


#### 6. CRIAR O SCRIPT RESPONSÁVEL POR INICIAR O *KIOSK MODE*

Criar o arquivo para o script

	$ nano /home/pi/kiosk.sh

Copiar o conteúdo do arquivo *kiosk.sh* disponível neste repositório

#### 7. CRIANDO O SERVIÇO PARA INICIAR O SCRIPT NO BOOT

Criar o arquivo para o script

	$ sudo nano /lib/systemd/system/kiosk.service

Copiar o conteúdo do arquivo *kiosk.service* disponível neste repositório

#### 8. HABILITAR O SCRIPT NA INICIALIZAÇÃO

	$ sudo systemctl enable kiosk.service


------------
#### 9. USO

Seguindo os passos anteriores, o script já fica habilitado para iniciar no *Kiosk Mode* sempre que o sistema for iniciado. Para efetuar qualquer interação manualmente, utilize os seguintes comandos:


##### 9.1 Comando para iniciar manualmente o Kiosk Mode

	$ sudo systemctl start kiosk.service

##### 9.2 Comando para finalizar manualmente o Kiosk Mode

	$ sudo systemctl stop kiosk.service
