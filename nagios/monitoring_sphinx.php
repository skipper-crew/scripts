#!/usr/local/bin/php
<?php
/* vim: set encoding=utf-8: */
/*
*  Nagios plugin to check Sphinx search engine status.
*  Copyright (C) 2010  Elan Ruusamäe <g...@delfi.ee>
*
*  This program is free software: you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation, either version 2 of the License, or
*  (at your option) any later version.
*
*  This program is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*
*  You should have received a copy of the GNU General Public License
*  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*
* @(#) $Id$
*
*	usage:
*	./monitoring_sphinx.php -H 192.168.1.69 -p 3313 -i irrru_adverts_other_seg_2_index
*	./monitoring_sphinx.php -H 192.168.1.9 -p 3313 -i irrru_adverts_spb_index
*	./monitoring_sphinx.php -H 192.168.1.14 -p 3313 -i irrru_adverts_other_seg_1_index
*	./monitoring_sphinx.php -H 192.168.1.14 -p 3313 -i irrru_adverts_other_seg_2_index
*	./monitoring_sphinx.php -H 192.168.1.164 -p 3313 -i irrru_adverts_moscow_index
*	./monitoring_sphinx.php -H 192.168.1.61 -p 3313 -i irrru_adverts_moscow_index
*	./monitoring_sphinx.php -H 192.168.1.61 -p 3313 -i irrru_adverts_other_seg_0_index
*	./monitoring_sphinx.php -H 192.168.1.63 -p 3313 -i irrru_adverts_other_seg_1_index
*	./monitoring_sphinx.php -H 192.168.1.63 -p 3313 -i irrru_adverts_other_seg_2_index
*	./monitoring_sphinx.php -H 192.168.1.63 -p 3313 -i irrru_adverts_spb_index
*
*	svn export svn://svn.prontosoft.by/irr.ru.config/production/sphinx/monitoring_sphinx.php
*/

define('PROGRAM', basename(array_shift($argv)));
define('STATE_OK', 0);
define('STATE_CRITICAL', 2);
define('STATE_WARNING', 1);
define('STATE_UNKNOWN', 3);

// No pecl class, try php version
if (!class_exists('SphinxClient')) {
	// loads from php include_path
	require_once 'sphinxapi.php';
}

function usage() {
	echo PROGRAM,
	" [-H HOSTNAME] [-p PORT] [-s SEARCHSTRING] [-i INDEXNAME] [-t TIMEOUT]
";
	exit(STATE_UNKNOWN);
}

$default_opt = array(
'H' => 'localhost',
'p' => 3312,
'i' => '*',
't' => 10,
'd' => null,
);
$opt = array_merge($default_opt, getopt("H:p:s:i:t:d"));

if (empty($opt['H'])) {
	usage();
}

$sphinx = new SphinxClient();
$sphinx->SetServer($opt['H'], intval($opt['p']));
#$sphinx->setMatchMode(SPH_MATCH_ANY);
$sphinx->SetConnectTimeout($opt['t']);
$sphinx->setMaxQueryTime($opt['t']);
$sphinx->SetSortMode(SPH_SORT_ATTR_DESC, 'date_modify');
$res = $sphinx->Query(isset($opt['s']) ? $opt['s'] : '', $opt['i']);

if ($msg = $sphinx->GetLastWarning()) {
	echo "WARNING: ", $msg, "\n";
	exit(STATE_WARNING);
}
if ($msg = $sphinx->GetLastError()) {
	echo "ERROR: ", $msg, "\n";
	exit(STATE_CRITICAL);
}

if (isset($opt['d'])) {
	print_r($res);
}

if ($res['total'] && ! empty($res['matches'])) {
	$row = array_shift($res['matches']);
	if (empty($row['attrs']['date_modify'])) {
		$row['attrs']['date_modify'] = 0;
	}
	if((time() - $row['attrs']['date_modify']) > 3600 * 6 + 10) {
		printf("WARNING: Found %d documents in %.3f secs. Last modify_time is %s\n", $res['total'],
	$res['time'], date('Y-m-d H:i:s', $row['attrs']['date_modify']));
//		exit(STATE_OK);	
	exit(STATE_WARNING);
	} else {
		printf("OK: Found %d documents in %.3f secs. Last modify_time is %s\n", $res['total'],
		$res['time'], date('Y-m-d H:i:s', $row['attrs']['date_modify']));
		exit(STATE_OK);
	}
} else {
	printf("WARNING: Found %d documents in %.3f secs\n", $res['total'],
	$res['time']);
	exit(STATE_WARNING);
}
