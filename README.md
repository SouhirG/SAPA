SAPA 
====
Segmentor and Part-of-speech tagger for Arabic

Overview
========
This tool preprocess arabic texts : predict part-of-speech tags and splits off words to separe the basic form and proclitics. Details of this work are presented in: 

Souhir Gahbiche-Braham and Hélène Maynard and Thomas Lavergne and François Yvon, Joint Segmentation and POS Tagging for Arabic Using a CRF-based Classifier, In Proceedings of the Eight International Conference on Language Resources and Evaluation (LREC'12), Istanbul, Turkey. 2012 [www.lrec-conf.org/proceedings/lrec2012/pdf/855_Paper.pdf].


For any information, bug reports or comments, contact:
	souhir.gahbiche[at]limsi.fr or souhir.gahbiche[at]gmail.com

Requirements
============
To use SAPA:

1- Please install the Wapiti toolkit http://wapiti.limsi.fr/

2- Place the ArabicSplit directory in the Wapiti directory.

3- Uncompress the modelPOS+SEG-final-0.1.crf.zip file.


Run SAPA
========
1- cd ~/wapiti/SAPA

2- ./segment arabic_filename

Resulting files
===============
arabic_filename.bw              is the transliterated text using Buckwalter scheme.

arabic_filename.wap             contains the predictions for each word in the text

arabic_filename.norm.pos        contains the part-of-speech tags for each word in the resulting file.result

arabic_filename.result          is the resulting preprocessed file
