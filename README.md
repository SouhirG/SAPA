SAPA 
====

Segmentor and Part-of-speech tagger for Arabic

LICENSE 
#########################################################################################
# SAPA is licensed under the term of the two-clause BSD Licence:			# 
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


Overview
========
This tool preprocess arabic texts : predict part-of-speech tags and splits off words to separe the basic form and proclitics. Details of this work are presented in:

@InProceedings{GAHBICHEBRAHAM12.855,
  	author = {Souhir Gahbiche-Braham and H{\'e}l{\`e}ne Maynard and Thomas Lavergne and Fran{\c c}ois Yvon},
  	title = {Joint Segmentation and POS Tagging for Arabic Using a CRF-based Classifier},
  	booktitle = {Proceedings of the Eight International Conference on Language Resources and Evaluation (LREC'12)},
  	year = {2012},
  	month = {may},
  	date = {23-25},
  	address = {Istanbul, Turkey},
  	editor = {Nicoletta Calzolari (Conference Chair) and Khalid Choukri and Thierry Declerck and Mehmet Ugur Dogan and Bente Maegaard and Joseph Mariani and Jan Odijk and Stelios Piperidis},
  	publisher = {European Language Resources Association (ELRA)},
  	isbn = {978-2-9517408-7-7},
  	language = {english}
 }


For any information, bug reports or comments, contact:
	souhir.gahbiche[at]limsi.fr or souhir.gahbiche[at]gmail.com

Requirements
============
To use SAPA:

1- Please install the Wapiti toolkit http://wapiti.limsi.fr/

2- Place the ArabicSplit directory in the Wapiti directory.

