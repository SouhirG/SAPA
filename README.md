SAPA 
====
Segmentor and Part-of-speech tagger for Arabic

Overview
========
This tool preprocess arabic texts : predict part-of-speech tags and splits off words to separe the basic form and proclitics. Details of this work are presented in: 

Souhir Gahbiche-Braham and Hélène Maynard and Thomas Lavergne and François Yvon, Joint Segmentation and POS Tagging for Arabic Using a CRF-based Classifier, In Proceedings of the Eight International Conference on Language Resources and Evaluation (LREC'12), Istanbul, Turkey. 2012 [www.lrec-conf.org/proceedings/lrec2012/pdf/855_Paper.pdf].

If you use SAPA for research purpose, please use the following citation:

    @inproceedings{gahbiche2012joint,
       	title={Joint Segmentation and POS Tagging for Arabic Using a CRF-based Classifier},
    	author={Gahbiche-Braham, Souhir and Bonneau-Maynard, H{\'e}lene and Lavergne, Thomas and Yvon, Fran{\c{c}}ois},
    	booktitle={Proc. of LREC’12},
    	address = {Istanbul, Turkey},
    	editor = {Nicoletta Calzolari (Conference Chair) and Khalid Choukri and Thierry Declerck and Mehmet Ugur Dogan and Bente Maegaard and Joseph Mariani and Jan Odijk and Stelios Piperidis},
    	publisher = {European Language Resources Association (ELRA)},
    	isbn = {978-2-9517408-7-7},
    	language = {english}
    	pages={2107--2113},
    	year={2012}
    }

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

If SAPA cannot run correctly or the loading of model does not succeeds, please unzip  the model modelPOS+SEG.light.crf.zip and replace "modelPOS+SEG-final-0.1.crf" by "modelPOS+SEG.light.crf" in the file "segment.sh"
 

Resulting files
===============
arabic_filename.bw              is the transliterated text using Buckwalter scheme.

arabic_filename.wap             contains the predictions for each word in the text

arabic_filename.norm.pos        contains the part-of-speech tags for each word in the resulting file.result

arabic_filename.result          is the resulting preprocessed file

[![Analytics](https://ga-beacon.appspot.com/UA-78344280-1/SouhirG/SAPA)](https://github.com/SouhirG/SAPA)

