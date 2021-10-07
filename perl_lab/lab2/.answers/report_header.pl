
#creating report header
open (File, "timing_report/timing_report.rpt"); 
#Changing separator from new line to blank line as delimiters.
undef $/;
my $file = <File>;
close File;
my @header = $file =~ m/Report : timing.*?Date.*?$/gsm;

foreach my $line (@header) {
  print "$line\n";
}

