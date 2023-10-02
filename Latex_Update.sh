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
