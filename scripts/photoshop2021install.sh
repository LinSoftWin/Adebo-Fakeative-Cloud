
mkdir $1/Adobe-Photoshop

wget  https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks

WINEPREFIX=$1/Adobe-Photoshop wineboot

rm -rf $1/progress.mimifile
touch $1/progress.mimifile
echo "10" >> $1/progress.mimifile

WINEPREFIX=$1/Adobe-Photoshop ./winetricks win10

curl -L "https://drive.google.com/uc?export=download&id=1qcmyHzWerZ39OhW0y4VQ-hOy7639bJPO" > allredist.tar.xz
mkdir allredist

rm -rf $1/progress.mimifile
touch $1/progress.mimifile
echo "20" >> $1/progress.mimifile

tar -xf allredist.tar.xz
rm -rf allredist.tar.xz

rm -rf $1/progress.mimifile
touch $1/progress.mimifile
echo "25" >> $1/progress.mimifile

curl -L "https://lulucloud.mywire.org/FileHosting/GithubProjects/AdobePhotoshop2021.tar.xz" > AdobePhotoshop2021.tar.xz

rm -rf $1/progress.mimifile
touch $1/progress.mimifile
echo "50" >> $1/progress.mimifile

tar -xf AdobePhotoshop2021.tar.xz
rm -rf AdobePhotoshop2021.tar.xz


rm -rf $1/progress.mimifile
touch $1/progress.mimifile
echo "70" >> $1/progress.mimifile


WINEPREFIX=$1/Adobe-Photoshop ./winetricks fontsmooth=rgb gdiplus msxml3 msxml6 atmlib corefonts dxvk

rm -rf $1/progress.mimifile
touch $1/progress.mimifile
echo "80" >> $1/progress.mimifile


WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2010/vcredist_x64.exe /q /norestart
WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2010/vcredist_x86.exe /q /norestart

WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2012/vcredist_x86.exe /install /quiet /norestart
WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2012/vcredist_x64.exe /install /quiet /norestart

WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2013/vcredist_x86.exe /install /quiet /norestart
WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2013/vcredist_x64.exe /install /quiet /norestart

WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2019/VC_redist.x64.exe /install /quiet /norestart
WINEPREFIX=$1/Adobe-Photoshop wine allredist/redist/2019/VC_redist.x86.exe /install /quiet /norestart


rm -rf $1/progress.mimifile
touch $1/progress.mimifile
echo "90" >> $1/progress.mimifile

WINEPREFIX=$1/Adobe-Photoshop sh allredist/setup_vkd3d_proton.sh install


mkdir $1/Adobe-Photoshop/drive_c/Program\ Files/Adobe
mv Adobe\ Photoshop\ 2021 $1/Adobe-Photoshop/drive_c/Program\ Files/Adobe/Adobe\ Photoshop\ 2021
mv allredist/launcher.sh $1/Adobe-Photoshop/drive_c
mv allredist/photoshop.png ~/.local/share/icons
mv allredist/photoshop.desktop ~/.local/share/applications

rm -rf allredist
rm -rf winetricks

rm -rf $1/progress.mimifile
touch $1/progress.mimifile
echo "100" >> $1/progress.mimifile
