#!/bin/bash

# Create and move to backup directory
cd ~/workspace/openscience/pad-github-collaboration
curl -o input.md http://pad.okfn.org/p/pad-github-collaboration/export/txt

pandoc -s -S --toc --number-section -H /home/aurelius/workspace/web/css/rmarkdown.css input.md -o paper.html
pandoc --toc input.md -o paper.docx
pandoc --toc input.md -o paper.odt
pandoc --toc --number-section --latex-engine=xelatex -V lang=english -V papersize:a4paper -V documentclass=scrartcl input.md -o paper.pdf
pandoc -s -S -H /home/aurelius/workspace/web/css/rmarkdown.css index.md -o index.html

git commit -am "paper updated"
git push
