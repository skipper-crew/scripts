#!/usr/local/bin/php
<?php
    $subject = 'helper';
    $message = 'trololo';
    $from_name = 'Ded Moroz';
    $from_mail = 'gis.skipper@gmail.com';
    $to = 'skipper@prontosoft.by';
//                    $to = 'gis.skippper@gmail.com';
    $priority = 1;
    $body = "$message\n"; 
    $from = "$from_name <$from_mail>"; 
    $headers = "Content-Type: text/html; charset=windows-1251\n"; 
    $headers .= "From: $from_mail\n"; 
    $headers .= "X-Mailer: The Bat! 2005\n"; 
    $headers .= "X-Priority: $priority\n"; 
    mail($to,$subject,$body,$headers); 
?>
