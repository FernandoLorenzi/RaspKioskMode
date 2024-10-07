#!/bin/bash
 
# Impedir que o gerenciador de energia desligue ou apague a tela

xset s noblank
xset s off
xset -dpms
 

# Esconder o mouse da tela após 5 segundos de inatividade

unclutter -idle 5 -root &


# Limpar qualquer mensagem que aparecer na barra de aviso do Chromium

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences
 

# Executar o Chromium 

/usr/bin/chromium-browser --noerrdialogs --disable-infobars --disable-features=TranslateUI --kiosk http://www.google.com http://www.uol.com.br &
 

# Alternar as abas abertas do Chromium a cada 20 segundos

while true; do
# Alterna abas sem dar reload
xdotool keydown ctrl+Tab; xdotool keyup ctrl+Tab;
# Altera abas com reload
# xdotool keydown ctrl+Tab; xdotool keydown ctrl+r; xdotool keyup ctrl+Tab; xdotool keyup ctrl+r;
sleep 20
done
