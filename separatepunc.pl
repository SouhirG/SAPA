#!/usr/bin/perl

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

#
#######################################################################################################################
# Description : Separe punctuation 
#######################################################################################################################

my $filetosep=$ARGV[0];
my $punc=$filetosep.".punc";
my @allline;

binmode STDIN, ':encoding(UTF-8)';
binmode STDOUT, ':encoding(UTF-8)';
binmode STDERR, ':encoding(UTF-8)';

open(TOSEP, "<:encoding(UTF-8)", "$filetosep");# or die "$filetosep does not exist";
open PUNC, "> $punc" or die "$punc does not exist";
while ($line = <TOSEP>){
	$line =~ s/(\s+)(\.)(\d)/$1SEPPUNCTMARKDECIMAL$3/g;
	$line =~ s/(\s+)(\,)(\d)/$1SEPPUNCTMARKCOMMA$3/g;
	$line =~ s/^(\.)(\d)/SEPPUNCTMARKDECIMAL$2/g;
	$line =~ s/^(\,)(\d)/SEPPUNCTMARKCOMMA$2/g;
	$line =~ s/([\-\=\"\_\:\#\@\!\?\^\/\(\)\[\]\%\;\\\+\.\,])/ $1 /g;
	
	## Fix decimal points
	$line =~ s/(\d)\s+([\,\.])\s+(\d)/$1$2$3/g;
	$line =~ s/SEPPUNCTMARKDECIMAL/\./g;
	$line =~ s/SEPPUNCTMARKCOMMA/\,/g;
	    
	## Separate numbers
	$line =~ s/\ \ */\ /g;
	$line =~ s/\.\ \.\ \./\.\.\./g;
	print PUNC "$line";
}
close PUNC;
close TOSEP;

open(PUNC, "<:encoding(UTF-8)", "$punc");# or die "$file does not exist";
while ($line = <PUNC>){
    $line=~s/ +/ /g;
    if ($line =~m/^$/){
	print "emptyline\n";
    }elsif ($line =~m/^ $/){
	print "emptyline\n";
    }
      @allline=(split(/\s/,$line));
      foreach my $m (@allline){
	if ($m eq ""){
	    next;
	}else{
		print "$m\n";
	}
      }
      print "\n";
}
close PUNC;

