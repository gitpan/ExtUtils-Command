
use strict;
use warnings;

use 5.005030;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "utilities to replace common UNIX commands in Makefiles etc.",
  "AUTHOR" => "Nick Ing-Simmons <ni-s\@cpan.org>, Michael G Schwern <schwern\@pobox.com>, Randy Kobes <r.kobes\@uwinnipeg.ca>, The Perl 5 Porters",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "ExtUtils-Command",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "ExtUtils::Command",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Exporter" => 0,
    "File::Basename" => 0,
    "File::Compare" => 0,
    "File::Copy" => 0,
    "File::Path" => 0,
    "vars" => 0
  },
  "TEST_REQUIRES" => {},
  "VERSION" => "1.18",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

$WriteMakefileArgs{INSTALLDIRS} = 'perl'
    if $] >= 5.009005 && $] <= 5.011000;

WriteMakefile(%WriteMakefileArgs);



