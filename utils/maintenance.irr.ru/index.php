<?
$title = 'irr.ru nginx & php-fpm stats';
include "./inc/header.php";
?>
<center>
<h2></h2>
<h3><a center style="color: red" href="/balancer1/haproxy/">HAProxy_1</a></h3>
<h3><a center style="color: red" href="/balancer2/haproxy/">HAProxy_2</a></h3>
<h3><a center style="color: red" href="/memcache/">Memcache</a></h3>
<h3><a center style="color: red" href="/helper4/zabbix/">Zabbix</a></h3>

<h3><a center style="color: red">Elasticsearch</a></h3>
<a center style="color: black" >
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/filter1/elastic/">Filter 1</a> | 
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/filter3/elastic/">Filter 3</a> | 
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/filter4/elastic/">Filter 4</a> | 
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/filter5/elastic/">Filter 5</a> | 
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/filter6/elastic/">Filter 6</a> | 
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/filter7/elastic/">Filter 7</a> | 
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/filter8/elastic/">Filter 8</a><br>
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/fulltext1/elastic/">Fulltext 1</a> | 
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/fulltext2/elastic/">Fulltext 2</a> | 
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/fulltext3/elastic/">Fulltext 3</a><br>
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/suggest/elastic/">Suggest</a> | 
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/suggest-rubrics/elastic/">Suggest-Rubrics</a><br>
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/kz/elastic/">KZ</a><br>
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/weblog/elastic/">WEBLOG</a><br>
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/irr-address/elastic/">irr_address</a><br>
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/irr-full-test/elastic/">irr_full_test</a><br>
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/irr-filter-test/elastic/">irr_filter_test</a><br>
<a href="/elasticsearch?base_uri=http://maintenance.irr.ru/irrbytest/elastic/">irrbytest</a><br>
</a>

<?
include "./inc/footer.php";
?>
