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
#   11/10/2021 22:00 - Alterado bloco de condicoes ( melhoria de codigo)
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
[[ -d $caminho/Variados ]] || mkdir -v "$caminho/Variados"

#Movimentacoes dos arquivos para suas respectivas pastas
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
