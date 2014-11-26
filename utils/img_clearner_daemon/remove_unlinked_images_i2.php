#!/usr/local/bin/php
<?php

/**
 * Delete images from storage which haven't got links to ads.
 */

/**
 * Remove img from storage
 * @param string $img - pathname
 */
function removeImg($img, $is_dbg)
{
	if (file_exists($img)) {
		if ($is_dbg) {
			echo PHP_EOL, $img, PHP_EOL;
		} else {
			unlink($img);
		}
	}
}

//require dirname(__FILE__) . "/../../../../config/rc.conf.php";
require dirname(__FILE__) . "/usr/home/mephius/irr.ru/config/rc.conf.php";

ini_set("memory_limit", "1024M");
ini_set('display_errors', true);

//define("IMG_PATH", __DIR__ . '/../../../../html/img/catalog');
define("IMG_PATH", __DIR__ . '/usr/home/mephius/irr.ru/html/img/catalog');

$is = array(/*'i0', 'i1',*/ 'i2');

$unlinked_img_ids = array();
$checked_img_ids = array();

$opts = getopt('d:c:');

$is_dbg = !empty($opts['d']) ? true : false;
$removed_counts = !empty($opts['c']) ? $opts['c'] : 3000000;

$table = IRR_Db_Table_Factory::factory(IRR_Db_Table_Schema::TABLE_ADS);
$ads_archive_img_table = IRR_Db_Table_Factory::factory(IRR_Db_Table_Schema::TABLE_ADS_ARCHIVE_IMAGES);

$removed = 0;
$processed = 0;

$file = fopen('/usr/home/script/img_clean/logs_i2/file0.txt', "r");

while(!feof($file)) {
	$filename = IMG_PATH . trim(fgets($file));
	if (is_dir($filename) || !file_exists($filename)) {
		continue;
	}

	$cur = new SplFileInfo($filename);
	$processed++;
	//new img name format
	$pathes = explode('./', $filename);
	echo "\rRemoved: ", $removed, " processed: ", $processed, " memory usage: ", round(memory_get_usage() / 1000000), " latest: ", end($pathes), PHP_EOL;

	//avoid problems with replication
	if (strtotime("-1 day") < $cur->getCTime()) {
		continue;
	}

	preg_match_all("/^.+?\-.+?\-([0-9]+?)\-.+?(jpg|jpeg|gif|png)/i", $filename, $matches);
	if (empty($matches[1][0])) {
		//old img name format
		preg_match_all("/^.+?\-([0-9]+?)\-(small|orig)\.(jpg|jpeg|gif|png)/i", $filename, $matches_old);
		if (isset($matches_old[1][0]) && $matches_old[1][0] === '0') {
			echo "Zero ID - $filename. Remove him" . PHP_EOL;
			$removed++;
			removeImg($filename, $is_dbg);
			continue;
		}
		
		if (empty($matches_old[1][0])) {
			continue;
		}
		$checked_id = $matches_old[1][0];
	} else {
		$checked_id = $matches[1][0];
	}

	if (in_array($checked_id, $checked_img_ids)) {
		continue;
	}

	if (in_array($checked_id, $unlinked_img_ids)) {
		$removed++;
		removeImg($filename, $is_dbg);
		continue;
	}

	//$result = $table->fetchColumn('id', array('id' => $checked_id));
	$result = $table->executeReadableQuery('select id, images from ads where id=' . (int)$checked_id)->fetch(PDO::FETCH_ASSOC);
	if (!empty($result)) {
	    if (!empty($result['id']) && !empty($result['images'])) {
		$current_img = '/img/catalog' . str_replace(IMG_PATH, '', $filename);
		$current_img_small = str_replace('-orig', '-small', $current_img);
		$ads_images = array_filter(explode(',', $result['images']));
		if (in_array($current_img_small, $ads_images) || in_array($current_img, $ads_images)) {
			continue;
		} else {
			echo "File: $current_img is NOT set in advert $checked_id" . PHP_EOL;
			echo "Remove $filename" . PHP_EOL;
			$removed++;
			removeImg($filename, $is_dbg);
			if ($removed > $removed_counts) {
				break;
			}
			continue;
		}
	    }
	}
	
	$result_img = $ads_archive_img_table->fetchColumn('ad_id', array('ad_id' => $checked_id));

	if (!empty($result_img)) {
		$checked_img_ids[] = $checked_id;
    		continue;
    	}

	$removed++;
	$unlinked_img_ids[] = $checked_id;
	removeImg($filename, $is_dbg);
	if ($removed > $removed_counts) {
		break;
	}
	
}

echo PHP_EOL;
