<?php 

  setlocale(LC_CTYPE, "en_US.UTF-8");

  if ($argc != 2) {

    echo "You must supply the text 'git commit -m <text> '";
    return;
  }


$cmd = "git add . -A && git commit -m " . argv[1] . " && git push -u origin master "

exec( $cmd );
