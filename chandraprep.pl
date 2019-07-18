#!/usr/bin/perl

# please call ciao from command line before using the script

use strict;
use warnings;
use diagnostics;
use Cwd;

my $ciaodownload = "download_chandra_obsid";
my $ciaorepro = "chandra_repro";

my $sourceid ="m82";
my $datadir = "/userdata/data/chandra2";

my $workingdir;
my $ii;

my @obsids=(
'16580',
'15616',
'13796',
'10545',
'11800',
'11104',
'10544',
'10925',
'10543',
'10542',
'10026',
'10025',
'10027',
'8190',
'8505',
'8189',
'6361',
'5644',
'6097',
'2933',
'380',
'379',
'378',
'1302',
'361',
);

my $sourcedir = "$datadir/$sourceid";


for($ii=0; $ii<@obsids; $ii++){
    chdir($sourcedir);
    print "downloading obsid ${obsids[$ii]}...\n";
    system($ciaodownload,
	   "${obsids[$ii]}"
	);
    my $obsdir = "$sourcedir/${obsids[$ii]}";
    chdir($obsdir);
    print "now working in $obsdir...\n";
    system($ciaorepro,
	   ".",
	   "repro/",
	);
}


