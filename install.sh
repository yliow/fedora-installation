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
dnf -y python3-devel zlib 
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
dnf -y install ocaml

# CISS380 (+ SDL)
dnf -y install freeglut freeglut-devel glew glew-devel

# Software Development tools
dnf -y install git-core
dnf -y install httpd mysql mysql-server mysql-devel phpmyadmin
dnf -y install python3-PyMySQL python3-sqlalchemy
dnf -y install mod_wsgi

# cp files
cp -r site-packages/* 
