wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
read -p "Paste authtoken here (Copy and Ctrl+V to paste then press Enter): " CRP
./ngrok authtoken $CRP 
nohup ./ngrok tcp 5900 &>/dev/null &
echo Please wait for installing new 10...
sudo apt update -y > /dev/null 2>&1
echo "Installing QEMU (2-3m)..."
sudo apt install qemu-system-x86 curl -y > /dev/null 2>&1
echo Downloading Windows Disk...
curl -L -o w10x64.img https://api.hashicorp.cloud/vagrant/2022-08-01/gusztavvargadr/boxes/windows-10-22h2-enterprise/versions/2202.0.2409/providers/virtualbox/amd64/vagrant.box
echo "Windows 10 x64 Lite On Google Colab"
echo Your VNC IP Address:
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
echo "Note: Use Right-Click Or Ctrl+C To Copy"
echo "Please Keep Colab Tab Open, Maximum Time 12h"
echo Script by fb.com/thuong.hai.581
echo Starting Windows xxxz...
sudo qemu-system-x86_64 -vnc :0 -hda w10x64.img -smp cores=2 -m 8096M -machine usb=on -device usb-tablet


