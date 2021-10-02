#!/usr/bin/env bash

#-----------HEAD-------------------------------------------------------------->
# AUTOR             : Matheus Martins 3mhenrique@gmail.com
# HOMEPAGE          : https://github.com/mateuscomh 
# DATA CRIAÇÃO      : 30/04/2021
# PROGRAMA          : Organiza Diretório
# VERSÃO            : 1.1
# LICENÇA           : GPL3
# PEQUENA-DESCRIÇÃO : Script para organizar pasta (Downloads em especial) 
#                     categorizando os arquivos para suas respectivas pastas.
#
# CHANGELOG         :
#   30/04/2021 12:00 - Criado script sob demanda de organizar.
#   01/05/2021 21:00 - Envio para repo no github;
#     - Adicionados comentários e identação;
#     - Reduzidas condicoes de validação de pastas.
#   16/07/2021 11:00 - Adicionadas mais extensões de arquivos;
#     - Adicionada condição de checagem na pasta;
#     - Segregada validação como função.
#   19/07/2021 10:00 - Aprimorada a chegagem do caminho e ajustada multi escolha
#   21/07/2021 11:00 - Ajustado caminho para ser aplicado em vários usuarios
#   15/08/2021 19:20 - Script com função de organizar a pasta de execução no momento
#   01/10/2021 21:00 - Realizados ajustes de sintaxe padrão shell
#     - Adicionado modo verboso para criação de pastas e mv de arquivos 
#
#-----------END-HEAD-----------------------------------------------------------<

#-----------VAR---------------------------------------------------------------->
caminho="$(pwd)"
#----------END-VAR-------------------------------------------------------------<

#-----------FUNC--------------------------------------------------------------->
valida_caminho(){
#Confirmar caminho da pasta a ser organizada
  #Validar a entrada para o caminho a ser organizado.
  [[ -z $caminho ]] && echo "Caminho vazio" && exit 1
  
#Forca o shell a ir até a pasta informada em $caminho
  cd "$caminho" || exit

#Valida se caminho é acessivel
  [[ $? == 1 ]] && echo "Caminho inexistente" && exit 1
 }
#-----------END-FUNC-----------------------------------------------------------<
while true; do
    read -r -p "Pasta a ser organizada sera $caminho ? [Y/N]"  YN; echo
    case $YN in
      [Yy]* ) break;;
      [Nn]* ) echo "Informe a pasta a ser organizada: "; read -r caminho
              valida_caminho            
              break;;
      *     ) echo "Por favor confirme com Y ou N";;
    esac
  done

#Condicoes para validar existencia das pastas de organizar[[ -d $caminho/Audio ]] || mkdir "$caminx"/Audio
[[ -d $caminho/Audio ]] || mkdir -v "$caminho/Audio"
[[ -d $caminho/Imagens ]] || mkdir -v "$caminho/Imagens"
[[ -d $caminho/Video ]] || mkdir -v "$caminho/Video"
[[ -d $caminho/Docs ]] || mkdir -v "$caminho/Docs"

#Movimentacoes dos arquivos para suas respectivas pastas
  for file in *; do
    if [[ $file == *.png || $file == *.jpg || $file == *.jpeg || $file == *.tif || $file == *.tiff || $file == *.gif ]]; then
      mv -i -v "$file" "$caminho/Imagens"

    elif [[ $file == *.mp4 || $file == *.mov || $file == *.avi || $file == *.srt || $file == *.mpeg || $file == *.mkv || $file == *.mpg ]]; then
      mv  -i -v "$file" "$caminho/Video"

    elif [[ $file == *.mp3 || $file == *.ogg || $file == *.aac || $file == *.wav ]]; then
      mv  -i -v "$file" "$caminho/Audio"

    elif [[ $file == *.mobi || $file == *.pdf || $file == *.txt || $file == *.py || $file == *.sh || $file == *.xls || $file == *.doc || $file == *.ppt || $file == *.epub  ]]; then
      mv  -i -v "$file" "$caminho/Docs"

    elif [[ $file == *.* ]];then
      mv  -i -v "$file" "$caminho/Variados"
   fi
  done
exit 0
