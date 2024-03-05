# fedora-installation

run the executables in the directory like so:

[student@localhost fedora-installation]$ su
Password: root
[WARNING] Running as root is not recommended
[root@localhost fedora-installation]# bash install.sh
[root@localhost fedora-installation]# bash Latex_Update.sh

# 3.6.2024
I updated the install.sh file with extra latex packages, not sure how to
implement 'pip install --user pygments' in the .sh file when this command
should be out of superuser mode ...
