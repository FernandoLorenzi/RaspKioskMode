#!/bin/sh
# This script will install RASPKIOSKMODE on a fresh Raspberry Pi OS
# This script is experimental and does not ensure any security.
# sudo wget -qO - https://github.com/FernandoLorenzi/RaspKioskMode/install.sh | bash


# REMOVENDO PACOTES DESNECESSÁRIOS
sudo apt-get purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 smartsim java-common minecraft-pi libreoffice* -y

# LIMPANDO ARQUIVOS RESIDUAIS
sudo apt-get clean && sudo apt-get autoremove -y

# ATUALIZANDO O SISTEMA
sudo apt-get update && sudo apt-get upgrade -y

# INSTALANDO PACOTES NECESSÁRIOS PARA O KIOSK MODE
sudo apt-get -y install xdotool unclutter sed wget

# CRIANDO O SCRIPT RESPONSÁVEL POR INICIAR O KIOSK MODE
wget -P /home/pi https://github.com/FernandoLorenzi/RaspKioskMode/kiosk.sh
#chown pi:pi /home/pi/kiosk.sh

# CRIANDO O SERVIÇO PARA INICIAR O SCRIPT NO BOOT
sudo wget -P /lib/systemd/system https://github.com/FernandoLorenzi/RaspKioskMode/kiosk.service

# HABILITANDO O SCRIPT NA INICIALIZAÇÃO
sudo systemctl enable kiosk.service

	echo
	echo
	echo
	echo
	echo
	echo
	echo
	echo " ** Script RASPKIOSK instalado com sucesso **"
	echo "Edite o arquivo /home/pi/kiosk.sh para alterar as URLs que serão exibidas em sequência pelo navegador de internet"
	echo
	echo "Comando para iniciar manualmente o Kiosk Mode:"
	echo "  sudo systemctl start kiosk.service"
	echo 
  	echo "Comando para finalizar manualmente o Kiosk Mode:"
	echo "  sudo systemctl stop kiosk.service"
	echo
	echo "Por padrão, o script será iniciado sempre ao iniciar o sistema operacional"
	echo "Para desabilitar o início automático, executar a seguinte linha de comando:"
	echo "  sudo systemctl disable kiosk.service"
	echo 
