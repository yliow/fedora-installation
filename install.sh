#!/bin/bash


#################################################################
###  BASIC SOFTWARE FOR F31-BASIC DISTRIBUTED TO ALL STUDENTS ###
#################################################################

#emacs
yum -y install emacs 
	
# gcc and gcc-c++ 
yum -y install gcc gcc-c++

# PAE 
yum -y install kernel-devel kernel-headers patch make binutils 
yum -y install wget 

# Development tools 
yum -y install autoconf automake libtool python-devel zlib 
yum -y install autoconf automake libtool python3-devel zlib 
yum -y install gdb ddd meld


# CISS145
yum -y install pygame

# CISS245
yum -y install SDL SDL-devel 
yum -y install SDL_gfx-devel SDL_net-devel
yum -y install SDL-static SDL_sound-devel
yum -y install SDL_image-devel SDL_ttf-devel SDL_mixer-devel

# Latex(also the yliow folder)(We will talk about “yliow” later in the doc.)
yum -y install texlive texlive-latex texlive-import
yum -y install texlive-lipsum texlive-lastpage texlive-upquote
yum -y install texlive-boxedminipage texlive-ulem texlive-cancel

# Miscellaneous software that should be installed:
# pluma, tar, gzip, bzip2, rsync, firefox, caja, Atril
yum -y install tar gzip bzip2 rsync firefox
yum install pluma caja atril

# Bloatware to remove
yum -y remove vinagre tigervnc simple-scan
dnf -y remove hexchat thunderbird

#################################################################
### EXTRA SOFTWARE FOR F31 DISTRIBUTED TO SENIORS AND LAB PCs ###
#################################################################

# CISS445
yum -y install pl ocaml

# CISS380 (+ SDL)
yum -y install freeglut freeglut-devel glew glew-devel

# Software Development tools
yum -y install git-core
yum -y install httpd mysql mysql-server mysql-devel phpmyadmin
yum -y install MySQL-python python-sqlalchemy
yum -y install mod_wsgi
