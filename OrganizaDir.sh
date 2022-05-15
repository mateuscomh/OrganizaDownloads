#!/usr/bin/env bash

#-----------HEADER-------------------------------------------------------------|
# AUTOR             : Matheus Martins <3mhenrique@gmail.com>
#                     https://github.com/mateuscomh
# DATA/VER.         : 29/08/2020 1.2
# LICENSE           : GPL3
# DESCRIPTION       : Folder organization across shell script (Downlonad Folder)
# REQUIREMENTS      :

#----------FIM-HEADER----------------------------------------------------------|
#
#-----------VAR---------------------------------------------------------------->
caminho="$(pwd)"
#----------END-VAR-------------------------------------------------------------<
#-----------FUNC--------------------------------------------------------------->
CHECK_PATH(){
# Check path folder to be organized
  [[ -z $caminho ]] && echo "Caminho vazio" && exit 1
  
  cd "$caminho" || exit

  [[ $? == 1 ]] && echo "Caminho inexistente" && exit 1
 }
#-----------END-FUNC-----------------------------------------------------------<

while true; do
    read -r -p "Pasta a ser organizada sera $caminho ? [Y/N]"  YN; echo
    case $YN in
      [Yy]* ) break;;
      [Nn]* ) echo "Informe a pasta a ser organizada: "; read -r caminho
              CHECK_PATH            
              ;;
      *     ) echo "Por favor confirme com Y ou N";;
    esac
  done

# Validate if the folder exist [[ -d $caminho/Audio ]] || mkdir "$caminx"/Audio
[[ -d $caminho/Audio ]] || mkdir -v "$caminho/Audio"
[[ -d $caminho/Imagens ]] || mkdir -v "$caminho/Imagens"
[[ -d $caminho/Video ]] || mkdir -v "$caminho/Video"
[[ -d $caminho/Docs ]] || mkdir -v "$caminho/Docs"
[[ -d $caminho/Variados ]] || mkdir -v "$caminho/Variados"

# Moving files to destination folder
  for file in *; do
    case $file in
	  	*.png|*.jpg|*.jpeg|*.tiff|*.gif)
      		mv -i -v "$file" "$caminho/Imagens" ;; 
		*.mp4|*.mov|*.avi|*.srt|*.mpeg|*.mkv|*.mpg)
      		mv -i -v "$file" "$caminho/Video" ;;
		*.mp3|*.ogg|*.aac|*.wav|*.wma) 
      		mv -i -v "$file" "$caminho/Audio" ;;
		*.pdf|*.txt|*.py|*.doc*|*.txt|*.epub|*.sh|*.xls*|*.ppt*) 
      		mv -i -v "$file" "$caminho/Docs" ;;
		*.*)
      		mv -i -v "$file" "$caminho/Variados" ;;
	esac
  done
exit 0
