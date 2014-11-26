#!/usr/bin/php
<?

$o = getopt('p:');
//echo $o['p'];
//echo "\n---\n";

$stdin=(file("php://stdin"));
//$fp = fopen(dirname(__FILE__) . '/sms.log', 'a');
//fwrite($fp, print_r($stdin[0] . PHP_EOL . $stdin[1], 1) . PHP_EOL . print_r($o, 1) . PHP_EOL . $res);

if(!isset($o['p']) || trim($o['p'])==''){
    die('bad options');
}

//$url='http://www.smstraffic.ru/multi.php?login=pronto-moscow&password=nobyrydi&originator=nagios&phones=375298617796&message=fdgerte&max_parts=1&rus=0';

//RABOCHIJ URL - http://www.smstraffic.ru/multi.php?login=pronto-moscow&password=nobyrydi&want_sms_ids=1&phones=375298617796&message=fdgerte&max_parts=1&rus=0&originator=nagios

$url='http://www.smstraffic.ru/multi.php?login=pronto-moscow&password=nobyrydi&originator=nagios&phones=' . $o['p'] . '&start_date=&rus=0';

//echo $url;
//echo "\n---\n";

$postfields = '&message='.urlencode(substr($stdin[0] . PHP_EOL . $stdin[1], 0, 159));
//echo $postfields;
//echo "\n---\n";

$curl = curl_init();
curl_setopt($curl, CURLOPT_URL, $url);
curl_setopt($curl, CURLOPT_POST, 1);
curl_setopt($curl, CURLOPT_POSTFIELDS, $postfields);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
$res=curl_exec($curl);

//echo $res;
//echo "\n---\n";
//echo $curl;
//echo "\n";

//$log=`date`;
//$fp = fopen(dirname(__FILE__) . '/sms.log', 'a');
//fwrite($fp, PHP_EOL . $log);
//fclose($fp);

//fwrite($fp, PHP_EOL . $res);
//fclose($fp);
/*
$fp = fopen(dirname(__FILE__) . '/sms.log', 'a');
fwrite($fp, PHP_EOL . $res);
fclose($fp);
*/
?>