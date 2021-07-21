#!/usr/bin/env bash

#-----------HEAD-------------------------------------------------------------->
# AUTOR             : Matheus Martins 3mhenrique@gmail.com
# HOMEPAGE          : https://github.com/mateuscomh 
# DATA CRIA��O      : 30/04/2021
# PROGRAMA          : Organiza Diret�rio
# VERS�O            : 1.0.0
# LICEN�A           : GPL3
# PEQUENA-DESCRI��O : Script para organizar pasta (Downloads em especial) 
#                     categorizando os arquivos para suas respectivas pastas.
#
# CHANGELOG         : 30/04/2021 12:00 - Criado script sob demanda de organizar.
#                     01/05/2021 21:00 - Envio para repo no github;
#                     - Adicionados coment�rios e identa��o;
#                     - Reduzidas condicoes de valida��o de pastas.
#                     16/07/2021 11:00 - Adicionadas mais extens�es de arquivos;
#                     - Adicionada condi��o de checagem na pasta;
#                     - Segregada valida��o como fun��o.
#                     19/07/2021 10:00 - Aprimorada a chegagem do caminho e 
# ajustada a alternativa "n�o"
#                     21/07/2021 11:00 - Ajustado caminho para ser aplicado em 
# v�rios usuarios
#-----------END-HEAD-----------------------------------------------------------<

#-----------VAR---------------------------------------------------------------->
caminho="/home/$USER/Downloads"
#----------END-VAR-------------------------------------------------------------<

#-----------FUNC--------------------------------------------------------------->
valida_caminho(){
#Confirmar caminho da pasta a ser organizada
  #Validar a entrada para o caminho a ser organizado.
  [[ -z $caminho ]] && echo "Caminho vazio" && exit 1
  
#Forca o shell a ir at� a pasta informada em $caminho
  cd "$caminho"

#Valida se caminho � acessivel
  [[ $? == 1 ]] && echo "Caminho inexistente" && exit 1
 }
#-----------END-FUNC-----------------------------------------------------------<
while true; do
    read -p "Confirme o caminho: $caminho "  YN; echo
    case $YN in
      [Yy]* ) break;;
      [Nn]* ) echo "Informe a pasta a ser organizada: "; read caminho
              valida_caminho            
              break;;
      *     ) echo "Por favor confirme com Y ou N";;
    esac
  done

#Condicoes para validar existencia das pastas de organizar
[[ -d $caminho/Audio ]] || mkdir $$caminho/Audio
[[ -d $caminho/Variados ]] || mkdir $caminho/Variados 
[[ -d $caminho/Imagens ]] || mkdir $caminho/Imagens
[[ -d $caminho/Video ]] || mkdir $caminho/Video 
[[ -d $caminho/Docs ]] || mkdir $caminho/Docs 

#Movimentacoes dos arquivos para suas respectivas pastas
  for file in *; do
    if [[ $file == *.png || $file == *.jpg || $file == *.jpeg || $file == *.tif || $file == *.tiff || $file == *.gif ]]; then
      mv "$file" "$caminho/Imagens"

    elif [[ $file == *.mp4 || $file == *.mov || $file == *.avi || $file == *.srt || $file == *.mpeg || $file == *.mkv || $file == *.mpg ]]; then
      mv "$file" "$caminho/Video"

    elif [[ $file == *.mp3 || $file == *.ogg || $file == *.aac || $file == *.wav ]]; then
      mv "$file" "$caminho/Audio"

    elif [[ $file == *.mobi || $file == *.pdf || $file == *.txt || $file == *.py
      || $file == *.sh || $file == *.xls || $file == *.doc || $file == *.ppt || $file == *.epub  ]]; then
      mv "$file" "$caminho/Docs"

    elif [[ $file == *.* ]];then
      mv "$file" "$caminho/Variados"
   fi
  done
exit 0
