<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="/monitoring/monitoring.css" />
</head>
<title><?=$title?></title>
<center>
<h3 style="color: red">Nginx Status</h2>
<body>
<center style="color: red; font-weight: bold">
<?
$areas=array(
    'web1/nginx_status/'=>'web1',
    'web2/nginx_status/'=>'web2',
    'web3/nginx_status/'=>'web3',
    'web4/nginx_status/'=>'web4',
    'web5/nginx_status/'=>'web5',
    'web6/nginx_status/'=>'web6',
    'web7/nginx_status/'=>'web7',
    'web8/nginx_status/'=>'web8',
    'web9/nginx_status/'=>'web9',
    'web10/nginx_status/'=>'web10',
    'web11/nginx_status/'=>'web11',
    'web12/nginx_status/'=>'web12',
    'web13/nginx_status/'=>'web13',
    'web14/nginx_status/'=>'web14',
    'web15/nginx_status/'=>'web15',
    'web16/nginx_status/'=>'web16',
    'web17/nginx_status/'=>'web17',
    'web18/nginx_status/'=>'web18',
    'web19/nginx_status/'=>'web19',
    'web20/nginx_status/'=>'web20',
);

$parts = explode('/', $_SERVER['REQUEST_URI']);
if (isset($parts[3]) && isset($areas[$parts[2] . '/' . $parts[3]])) {
	$active_area = $parts[2] . '/' . $parts[3];
} else if(isset($parts[2]) && isset($areas[$parts[2]])){
    $active_area = $parts[2];
}else{
    $active_area='cpu';
}

$buffer='';
foreach(array_keys($areas) as $area){
    if($area==$active_area){
	$buffer.=($buffer!='' ? '&nbsp;|&nbsp;' : '') .  $areas[$area];
    }else{
	$buffer.=($buffer!='' ? '&nbsp;|&nbsp;' : '') .  '<a href="/'.($area=='cpu' ? '' : $area ).'">'.$areas[$area].'</a>';
    }
}

echo $buffer;

?>

<h3 style="color: red">PHP-FPM Status</h2>

<?
$areas1=array(
    'web1/status'=>'web1',
    'web2/status'=>'web2',
    'web3/status'=>'web3',
    'web4/status'=>'web4',
    'web5/status'=>'web5',
    'web6/status'=>'web6',
    'web7/status'=>'web7',
    'web8/status'=>'web8',
    'web9/status'=>'web9',
    'web10/status'=>'web10',
    'web11/status'=>'web11',
    'web12/status'=>'web12',
    'web13/status'=>'web13',
    'web14/status'=>'web14',
    'web15/status'=>'web15',
    'web16/status'=>'web16',
    'web17/status'=>'web17',
    'web18/status'=>'web18',
    'web19/status'=>'web19',
    'web20/status'=>'web20',
);

$parts = explode('/', $_SERVER['REQUEST_URI']);
if (isset($parts[3]) && isset($areas1[$parts[2] . '/' . $parts[3]])) {
	$active_area = $parts[2] . '/' . $parts[3];
} else if(isset($parts[2]) && isset($areas1[$parts[2]])){
    $active_area = $parts[2];
}else{
    $active_area='cpu';
}

$buffer='';
foreach(array_keys($areas1) as $area){
    if($area==$active_area){
	$buffer.=($buffer!='' ? '&nbsp;|&nbsp;' : '') .  $areas1[$area];
    }else{
	$buffer.=($buffer!='' ? '&nbsp;|&nbsp;' : '') .  '<a href="/'.($area=='cpu' ? '' : $area ).'">'.$areas1[$area].'</a>';
    }
}

echo $buffer;

?>

<h3 style="color: red">Nginx SLA Status</h2>

<?
$areas2=array(
    'web1/sla_status'=>'web1',
    'web2/sla_status'=>'web2',
    'web3/sla_status'=>'web3',
    'web4/sla_status/'=>'web4',
    'web5/sla_status'=>'web5',
    'web6/sla_status'=>'web6',
    'web7/sla_status'=>'web7',
    'web8/sla_status'=>'web8',
    'web9/sla_status'=>'web9',
    'web10/sla_status'=>'web10',
    'web11/sla_status'=>'web11',
    'web12/sla_status'=>'web12',
    'web13/sla_status'=>'web13',
    'web14/sla_status'=>'web14',
    'web15/sla_status'=>'web15',
    'web16/sla_status'=>'web16',
    'web17/sla_status'=>'web17',
    'web18/sla_status'=>'web18',
    'web19/sla_status'=>'web19',
    'web20/sla_status'=>'web20',
    'elastic/sla_status'=>'elastic',
);

$parts = explode('/', $_SERVER['REQUEST_URI']);
if (isset($parts[3]) && isset($areas2[$parts[2] . '/' . $parts[3]])) {
	$active_area = $parts[2] . '/' . $parts[3];
} else if(isset($parts[2]) && isset($areas2[$parts[2]])){
    $active_area = $parts[2];
}else{
    $active_area='cpu';
}

$buffer='';
foreach(array_keys($areas2) as $area){
    if($area==$active_area){
	$buffer.=($buffer!='' ? '&nbsp;|&nbsp;' : '') .  $areas2[$area];
    }else{
	$buffer.=($buffer!='' ? '&nbsp;|&nbsp;' : '') .  '<a href="/'.($area=='cpu' ? '' : $area ).'">'.$areas2[$area].'</a>';
    }
}

echo $buffer;

?>

<h3 style="color: red">Monit Stats</h3>
<a center href="/web1/monit_status/">web1</a> | <a center href="/web5/monit_status/">web5</a> | <a center href="/web14/monit_status/">web14</a> | <a center href="/balancer/monit_status/">db.balancer</a>

