if [ -d "/usr/share/texlive/texmf-local/tex/latex" ]; then
    #updates yliow latex folder
    cp -r latex  /usr/share/texlive/texmf-local/tex/latex/yliow
    chmod +rwx /usr/share/texlive/texmf-local/tex/latex/yliow
else
    echo "FAILED... NO TEX(latex) DETECTED"
fi

#updates python operations for latex
cp -r ./python/* /usr/lib/python*.*/site-packages/
chmod +rwx /usr/lib/python*.*/site-packages/
cp -r ./python/* /usr/lib64/python*.*/site-packages/
chmod +rwx /usr/lib64/python*.*/site-packages/
