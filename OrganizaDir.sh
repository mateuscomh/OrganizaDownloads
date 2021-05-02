#!/usr/bin/env bash

#-----------HEAD-------------------------------------------------------------->
# AUTOR             : Matheus Martins 3mhenrique@gmail.com
# HOMEPAGE          : https://github.com/mateuscomh 
# DATA CRIAÇÃO      : 30/04/2021
# PROGRAMA          : Organiza Diretório
# VERSÃO            : 1.0.0
# LICENÇA           : GPL3
# PEQUENA-DESCRIÇÃO : Script para organizar pasta (Downloads em especial) 
#                     categorizando os arquivos para suas respectivas pastas.
#
# CHANGELOG         : 30/04/2021 12:00 - Criado script sob demanda de organizar
#                     01/05/2021 21:00 - Envio para repo no github
#                     - Adicionados comentários e identação
#                     - Reduzidas condicoes de validação de pastas
#-----------END-HEAD-----------------------------------------------------------<

#-----------VAR---------------------------------------------------------------->
caminho="/home/salaam/Downloads"
#----------END-VAR-------------------------------------------------------------<

#-----------FUNC--------------------------------------------------------------->
#-----------END-FUNC-----------------------------------------------------------<

#Validar a entrada para o caminho a ser organizado.
[[ -z $caminho ]] && echo "Caminho vazio" && exit 1

#Forca o shell a ir até a pasta informada em $caminho
#Valida se caminho é acessivel
cd "$caminho"
[[ $? == 1  ]] && echo "Caminho inexistente" && exit 1

#Condicoes para validar existencia das pastas de organizar
[[ -d $caminho/Audio ]] || mkdir $$caminho/Audio
[[ -d $caminho/Variados ]] || mkdir $caminho/Variados 
[[ -d $caminho/Imagens ]] || mkdir $caminho/Imagens
[[ -d $caminho/Video ]] || mkdir $caminho/Video 
[[ -d $caminho/Docs ]] || mkdir $caminho/Docs 

#Movimentacoes dos arquivos para suas respectivas pastas
  for file in *; do
    if [[ $file == *.png || $file == *.jpg || $file == *.jpeg ]]; then
      mv "$file" "$caminho/Imagens"

    elif [[ $file == *.mp4 ]]; then
      mv "$file" "$caminho/Video"

    elif [[ $file == *.mp3 || $file == *.ogg ]]; then
      mv "$file" "$caminho/Audio"

    elif [[ $file == *.mobi || $file == *.pdf || $file == *.srt ]];then
      mv "$file" "$caminho/Docs"

    elif [[ $file == *.* ]];then
      mv "$file" "$caminho/Variados"
   fi
  done
exit 0
