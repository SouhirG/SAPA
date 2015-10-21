#########################################################################################
# SAPA : Segmentor and Part-of-speech tagger for Arabic					# 
#											# 
#     Copyright (c) 2013  CNRS								# 
#     All rights reserved.								# 
# 											# 
#     Redistribution and use in source and binary forms, with or without		# 
#     modification, are permitted provided that the following conditions are met:	# 
#         * Redistributions of source code must retain the above copyright		# 
#           notice, this list of conditions and the following disclaimer.		# 
#         * Redistributions in binary form must reproduce the above copyright		# 
#           notice, this list of conditions and the following disclaimer in the		# 
#           documentation and/or other materials provided with the distribution.	# 
# 											# 
#     THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"	# 
#     AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE		# 
#     IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE	# 
#     ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE		# 
#     LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR		# 
#     CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF		# 
#     SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS		# 	
#     INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN		# 
#     CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)		# 	
#     ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE	# 
#     POSSIBILITY OF SUCH DAMAGE.							# #########################################################################################

#!/bin/bash
#
#######################################################################################################################
# Author: Souhir GAHBICHE
# Description : Arabic Splitter with Wapiti
#               Splits off prefixes : conjunctions w+ and f+, prepositions: b+, k+, l+ (also sub) and future mark: s+
#######################################################################################################################

rep_courant=`pwd`

filetosplit=$1

myscript=$rep_courant

if [[ ${#@} != 1 ]]
then
  echo "Error ($(readlink -f $0)): Wrong number of arguments (${#@})"
  echo "Usage: segment.sh file-to-preprocess "
  exit 1
fi

#translittérer un fichier arabe en buckwalter
echo "Translitteration..."
$myscript/convertUTF8toBW.pl $filetosplit $filetosplit.bw


#séparer la ponctuation 
#et préparer le fichier d'entrée pour wapiti, un mot par ligne, et chaque phrase est séparée par une ligne vide
echo "Tokenization..."
$myscript/separatepunc.pl $filetosplit.bw > $filetosplit.txt

#echo "Wapiti..."

#étiqueter chaque mot avec un label de la forme pos+pr1+pr2+pr3 en appelant wapiti
cd ..
repp=`pwd`
cd $rep_courant
$repp/wapiti label -m $myscript/modelPOS+SEG.light.crf $filetosplit.txt -p -s > $filetosplit.wap

echo "Normalization..."
#normalize ALEF, YAA, HAMZA, TAMARBUTA
$myscript/normalize.pl $filetosplit.wap | grep -v "^#" > $filetosplit.norm

echo "Segmentation..."
#segmenter les mots selon les étiquettes qui lui sont attribuées
$myscript/split.pl $filetosplit.norm > $filetosplit.tok

#supprimer les espaces en fin de ligne 
$myscript/clean_after_split.pl $filetosplit.tok > $filetosplit.result

rm $filetosplit.bw.punc
rm $filetosplit.txt
rm $filetosplit.norm
rm $filetosplit.tok

echo "Processing Done"

