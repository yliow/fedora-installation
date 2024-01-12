#!/bin/bash

#################################################################
###  BASIC SOFTWARE FOR F31-BASIC DISTRIBUTED TO ALL STUDENTS ###
#################################################################

#emacs
dnf -y install emacs 
	
# gcc and gcc-c++ 
dnf -y install gcc gcc-c++

# PAE 
dnf -y install kernel-devel kernel-headers patch make binutils 
dnf -y install wget 

# Development tools 
dnf -y install autoconf automake libtool python-devel zlib 
dnf -y python3-devel zlib #############################ERROR???
dnf -y install gdb ddd meld

# CISS145
dnf -y install python3-pygame

# CISS245
dnf -y install SDL SDL-devel 
dnf -y install SDL_gfx-devel SDL_net-devel
dnf -y install SDL-static SDL_sound-devel
dnf -y install SDL_image-devel SDL_ttf-devel SDL_mixer-devel

# Latex(also the yliow folder)(We will talk about “yliow” later in the doc.)
dnf -y install texlive texlive-latex texlive-import
dnf -y install texlive-lipsum texlive-lastpage texlive-upquote
dnf -y install texlive-boxedminipage texlive-ulem texlive-cancel

# Miscellaneous software that should be installed:
# pluma, tar, gzip, bzip2, rsync, firefox, caja, Atril
dnf -y install tar gzip bzip2 rsync firefox
dnf install pluma caja atril

# Bloatware to remove
dnf -y remove vinagre tigervnc simple-scan
dnf -y remove hexchat thunderbird

#################################################################
### EXTRA SOFTWARE FOR F31 DISTRIBUTED TO SENIORS AND LAB PCs ###
#################################################################

# CISS445
dnf -y install opam
opam init
eval `opam config env`
opam install -y core ocaml utop

# CISS380 (+ SDL)
dnf -y install freeglut freeglut-devel glew glew-devel
# NEED TO CHECK IF I NEED TO ADD ANYTHING

# Software Development tools
dnf -y install git-core
dnf -y install httpd mysql mysql-server mysql-devel phpmyadmin
dnf -y install python3-PyMySQL python3-sqlalchemy
dnf -y install mod_wsgi


# installing files where they need to be
cp .bashrc ~/.bashrc
cp -r .emacs ~/.emacs 

#NEED TO CHECK F31 for what files need rwx access and optimize this part
if [ -d "/usr/share/texlive/texmf-local/tex/latex" ]; then 
    # It's a directory!
    # Directory command goes here.
    cp -r latex  /usr/share/texlive/texmf-local/tex/latex/yliow
    chmod +rwx /usr/share/texlive/texmf-local/tex/latex/yliow
else
    echo "FAILED... NO TEX(latex) DETECTED"
fi

cp -r ./python/* /usr/lib/python*.*/site-packages/
chmod +rwx /usr/lib/python*.*/site-packages/
cp -r ./python/* /usr/lib64/python*.*/site-packages/
chmod +rwx /usr/lib64/python*.*/site-packages/
#NEED TO ADD ALEX

python3 -c 'import py_compile; py_compile.compile("alex.py");'

cp -r alexrunner.py /home/student/.alex/alexrunner.py
chmod +rwx /home/student/.alex/alexrunner.py
cp -r alex.pyc /home/student/.alex/alex.pyc
chmod +rwx /home/student/.alex/alex.pyc
