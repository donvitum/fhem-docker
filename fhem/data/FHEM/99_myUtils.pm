##############################################
# $Id: myUtilsTemplate.pm 7570 2015-01-14 18:31:44Z rudolfkoenig $
#
# Save this file as 99_myUtils.pm, and create your own functions in the new
# file. They are then available in every Perl expression.

package main;

use strict;
use warnings;
use POSIX;
use Time::Local;
use REST::Client;

sub myUtils_Initialize($$)
{
  my ($hash) = @_;
}

# Enter your functions below _this_ line.

########
# DebianMail Mail auf dem RPi versenden
#
sub DebianMail 
{ 
 my $rcpt = shift;
 my $subject = shift; 
 my $text = shift;
 my $attach = shift; 
 my $ret = "";
 my $sender = "<enter your email address here - remember to use \@ "; 
 my $konto = "<username>";
 my $passwrd = "<your password>";
 my $provider = "<email servers address>";
 Log 1, "sendEmail RCP: $rcpt";
 Log 1, "sendEmail Subject: $subject";
 Log 1, "sendEmail Text: $text";
 Log 1, "sendEmail Anhang: $attach";;
 
 $ret .= qx(sendEmail -f '$sender' -t '$rcpt' -u '$subject' -m '$text' -a '$attach' -s '$provider' -xu '$konto' -xp '$passwrd' -o tls=no -o message-charset=utf-8);
 $ret =~ s,[\r\n]*,,g;    # remove CR from return-string 
 Log 1, "sendEmail returned: $ret"; 
}
#
##########

##########
# Check FritzBox for MAC presence
#
sub checkFritzMACpresent($$) {
  # Benoeigt: Name der zu testenden Fritzbox ($Device),
  #           zu suchende MAC ($MAC), 
  # Ruekgabe: 1 = Geräaet gefunden
  #           0 = Gerae nicht gefunden
  my ($Device, $MAC) = @_;
  my $Status = 0;
  $MAC =~ tr/:/_/;
  $MAC = "mac_".uc($MAC);
  my $StatusFritz = ReadingsVal($Device, $MAC, "weg");
  if ($StatusFritz eq "weg") {
    Log 1, ("checkFritzMACpresent ($Device): $MAC nicht gefunden, abwesend.");
    $Status = 0;
  } elsif ($StatusFritz eq "inactive") {
    Log 1, ("checkFritzMACpresent ($Device): $MAC ist >inactive<, also abwesend.");
    $Status = 0;
  } else {
    # Reading existiert, Ruekgabewert ist nicht "inactive", also ist das Geraet per WLAN angemeldet.
    Log 1, ("checkFritzMACpresent ($Device): $MAC gefunden, Geraet heisst >$StatusFritz<.");
    $Status = 1;
  }
  return $Status;
}
#
#########

#########
# Diverse Hilfsfunktionen 
#
sub TestBlocking($)
  { BlockingCall("DoSleep", shift, "SleepDone", 5, "AbortFn", "AbortArg"); }

sub DoSleep($)     
  { sleep(shift); return "I'm done"; }

sub SleepDone($)
  { Log 1, "SleepDone: " . shift; }

sub AbortFn($)     
  { Log 1, "Aborted: " . shift; }
#
#########

#########
# Hilfsfunktion fuer Kalenderauswertungen
#
sub KalenderDatum($$)
{
 my ($KalenderName, $KalenderUid) = @_;
 my $dt = fhem("get $KalenderName start $KalenderUid");
 my @SplitDt = split(/ /,$dt);
 my @SplitDate = split(/\./,$SplitDt[0]);
 my $ret = timelocal(0,0,0,$SplitDate[0],$SplitDate[1]-1,$SplitDate[2]);
 
 return $ret;
}
#
#########

#########
# Get my own extern IP Address
#
sub getip()
{ 
   my $url = 'http://checkip.dyndns.org';

   use LWP::Simple;
   my $content = get $url;
   die "Couldn't get $url" unless defined $content;

   my $value = (split " " , $content)[5];
   my $value1 = (split "<" , $value)[0];

  return $value1;
}
#
#########


1;

