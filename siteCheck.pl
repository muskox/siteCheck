###############################
# Site Checker by Scott Pustay
# Version 1 - April 21, 2011
#
# inputs:	website URL
#
# example perl siteChck.pl scottpustay.com
#
# Will return if the site is up or down.
#
###############################


my $siteToCheck = $ARGV[$0];

use LWP 5.64; # Loads all important LWP classes, and makes
              #  sure your version is reasonably recent.				
my $browser = LWP::UserAgent->new;  
  
my $url = 'http://www.checksite.us/?url='.$siteToCheck;
  
my @ns_headers = (
   'User-Agent' => 'Mozilla/4.76 [en] (Win98; U)',
   'Accept' => 'image/gif, image/x-xbitmap, image/jpeg, 
        image/pjpeg, image/png, */*',
   'Accept-Charset' => 'iso-8859-1,*,utf-8',
   'Accept-Language' => 'en-US',
  );				
		      
my $response = $browser->get( $url, @ns_headers );
  die "Can't get $url -- ", $response->status_line
   unless $response->is_success;

  die "Hey, I was expecting HTML, not ", $response->content_type
   unless $response->content_type eq 'text/html';
     # or whatever content-type you're equipped to deal with
  
  if($response->content =~ /We can access/) {
    print "$siteToCheck is fine\n";
  } else {
    print "NOOOOOOOO $url is down. Not responding, AAAAAAAAAAAAAAAAAAAA, Down Down Down, No0000\n";
  }