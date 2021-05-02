#!/usr/bin/env bash

#-----------HEAD-------------------------------------------------------------->
# AUTOR             : Matheus Martins 3mhenrique@gmail.com
# HOMEPAGE          : https://github.com/mateuscomh 
# DATA CRIA��O      : 
# PROGRAMA          : Shell-Base
# VERS�O            : 1.0.0
# LICEN�A           : GPL3
# PEQUENA-DESCRI��O : Template padr�o/base para aplica��es pessoais.
#
# CHANGELOG         : 30/04/2021 12:00 - Criado script sob demanda de organizar
#                     01/05/2021 21:00 - Envio para repo no github
#                     - Adicionados coment�rios e identa��o
#-----------END-HEAD-----------------------------------------------------------<

#-----------VAR---------------------------------------------------------------->
caminho="~/Downloads"
#----------END-VAR-------------------------------------------------------------<

#----------FUNC---------------------------------------------------------------->
#----------END-FUNC------------------------------------------------------------<

#Validar a entrada para o caminho a ser organizado.
[[ -z $caminho ]] && echo "Caminho vazio" && exit 1

#Forca o shell a ir at� a pasta informada em $caminho
cd "$caminho"

#Condicoes para validar existencia das pastas de organizar
#Caso n�o tenha, ser� criada, caso tenha return 0
if [ -d $caminho/Audio ];then
  return 0
else
 mkdir $caminho/Audio
fi
if [ -d $caminho/Variados ];then
  echo exite > /dev/null
else
 mkdir $caminho/Variados 
fi
if [ -d $caminho/Imagens ];then
  echo exite > /dev/null
else
 mkdir $caminho/Imagens
fi
if [ -d $caminho/Video ];then
  echo exite > /dev/null
else
 mkdir $caminho/Video 
fi
if [ -d $caminho/Docs ];then
  echo exite > /dev/null
else
 mkdir $caminho/Docs 
fi

for file in *; do
  if [[ $file == *.png || $file == *.jpg || $file == *.jpeg ]]; then
    mv "$file" "$caminho/Imagens"

  elif [[ $file == *.mp4 ]]; then
    mv "$file" "$caminho/Imagens"

  elif [[ $file == *.mp3 || $file == *.ogg ]]; then
    mv "$file" "$caminho/Audio"

  elif [[ $file == *.mobi || $file == *.pdf || $file == *.srt ]];then
    mv "$file" "$caminho/Docs"

  elif [[ $file == *.* ]];then
    mv "$file" "$caminho/Variados"
  fi

done
exit 0
