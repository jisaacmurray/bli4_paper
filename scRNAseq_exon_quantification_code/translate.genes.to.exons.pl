#!/usr/bin/perl -w
use strict;

my %spans;
foreach(<>){
    chomp;
    ##e.g.
    ##V       WormBase        exon    7158    7393    .       -       .       gene_id "WBGene00002061"; transcript_id "B0348.6b.2"; exon_number "3"; gene_source "WormBase"; gene_biotype "protein_coding"; transcript_source "WormBase"; transcript_biotype "protein_coding"; exon_id "B0348.6b.2.e3";
    my ($chr, $wb, $type, $start, $end, $etc1, $etc2, $etc3, $details) = split(/\t/);
    my $span = "$chr" . "_" . $start . "_" . $end;
    
    if($type eq "exon"){
	if($details=~/exon_id \"(.+)\";/ & !exists($spans{$span})){
	    my $exon_id = $1;
	    if($details=~/(gene_id \")\w+(\"; transcript_id \")[\w\.]+(\".+)/){
		my $newDetails = $1 . $exon_id . $2 . $exon_id . $3;
		print join("\t", $chr, $wb, $type, $start, $end, $etc1, $etc2, $etc3, $newDetails) . "\n";
		$spans{$span} = 1;
	    }else{
		print STDERR "$details doesn't match RE\n";
	    }
	}
    }
}

