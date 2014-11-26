#!/usr/bin/php
<?php
    //�а�аме��� пи��ма
    $subject = 'R: MINSK';
    $message = '<p>Dear Mr. Sergey.<br />Tomorrow in first half of day your order will be coordinated.<br />Best regards.<br />Romolo</p>';
    $from_name = '123';
    $from_mail = 'skipper@prontosoft.by';
    $to = 'gis.skipper@gmail.com';
    $priority = 1; //п�ио�и�е�, о� 1 до 3
    //�аголовки пи��ма 
    $body = "$message\n"; 
    $from = "$from_name <$from_mail>"; 
    $headers = "Content-Type: text/html; charset=windows-1251\n"; 
    $headers .= "From: $from_mail\n"; 
    $headers .= "X-Mailer: The Bat! 2005\n"; 
    $headers .= "X-Priority: $priority\n"; 
    //��п�авка пи��ма
    mail($to,$subject,$body,$headers); 
?>