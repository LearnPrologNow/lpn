#!/usr/bin/perl -w

open(MAININDEX, ">text/tmplpn.idx");
open(PROLOGINDEX, ">text/prolog.idx");
open(FILE, "<text/lpn.idx");

   while (<FILE>) {
      if ($_ =~ /indexentry\{PROLOG (.*)\}\{(.*)\}/) {
          $PROLOG = $1;
          $PAGE = $2;
          $PROLOG =~ s/ +/ /g;
          $PROLOG =~ s/^ //g;
          print PROLOGINDEX "\\indexentry{$PROLOG}{$PAGE}\n";
      } elsif ($_ =~ /indexentry\{CITATION (.*)\}\{(.*)\}/) {
          my $CITE = $1;
          my $PAGE = $2;
          my $FoundAuthor = 0;
          my $FoundEditor = 0;
          my $AUTHOR  = "";
          my $EDITOR  = "";

	  open(BIB, "<lpn.bib"); 
          my $LookForAuthor = 0;
          my $LookForEditor = 0;
          while (<BIB>) {
	      if ($_ =~ /@/ && $LookForAuthor eq 1) {
		  $LookForAuthor = 0;
		  $LookForEditor = 0;
	      }
	      if ($_ =~ /$CITE,/) {
		  $LookForAuthor = 1;
		  $LookForEditor = 1;
	      }
	      if ($_ =~ /author\s*=(.*\w.*)/ && $LookForAuthor eq 1) {
                  $AUTHOR = $1;
                  $AUTHOR =~ s/\\\"/QUOTE/g;
                  $AUTHOR =~ s/\{\\o\}/OOOOO/g;
                  $AUTHOR =~ s/\{\\aa\}/AAAAA/g;
                  $AUTHOR =~ s/\"//g;
                  $AUTHOR =~ s/,\s*$//g;
                  $AUTHOR =~ s/\{//g;
                  $AUTHOR =~ s/\}//g;
                  $AUTHOR =~ s/^\s*//g;
                  $AUTHOR =~ s/QUOTE/\\\"/g;
                  $AUTHOR =~ s/OOOOO/\{\\o\}/g;
                  $AUTHOR =~ s/AAAAA/\{\\aa\}/g;
		  $LookForAuthor = 0;
                  $FoundAuthor = 1;
	      }
	      if ($_ =~ /editor\s*=(.*\w.*)/ && $LookForAuthor eq 1 && $LookForEditor eq 1) {
                  $EDITOR  = $1;
                  $EDITOR  =~ s/\\\"/QUOTE/g;
                  $EDITOR  =~ s/\{\\o\}/OOOOO/g;
                  $EDITOR  =~ s/\{\\aa\}/AAAAA/g;
                  $EDITOR  =~ s/\"//g;
                  $EDITOR  =~ s/,\s*$//g;
                  $EDITOR  =~ s/\{//g;
                  $EDITOR  =~ s/\}//g;
                  $EDITOR  =~ s/^\s*//g;
                  $EDITOR  =~ s/QUOTE/\\\"/g;
                  $EDITOR  =~ s/OOOOO/\{\\o\}/g;
                  $EDITOR  =~ s/AAAAA/\{\\aa\}/g;
		  $LookForEditor = 0;
                  $FoundEditor = 1;
	      }
	  }
          close(BIB);
      } else { 
          s/ +/ /g;
          print MAININDEX $_;
            
      }
  }

close(FILE);
close(PROLOGINDEX);
close(MAININDEX);

system("mv text/tmplpn.idx text/lpn.idx");
