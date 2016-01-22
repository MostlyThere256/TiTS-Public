<?php

$latest_time = 0;
$latest_filename = '';

$d = dir(".");
while (false !== ($entry = $d->read()))
{
	if (is_file($entry) && strcasecmp($entry, "TiTS_Preloader.swf") != 0 && strpos($entry, "TiTS_") !== false && strpos($entry, ".swf") !== false && filemtime($entry) > $latest_time)
	{
		$latest_time = filemtime($entry);
		$latest_filename = $entry;
	}
}

if (is_file($latest_filename))
{
	header($_SERVER["SERVER_PROTOCOL"] . " 200 OK");
	header("Cache-Control: public");
	header("Content-Type: application/x-shockwave-flash", true);
	header("Accept-Ranges: bytes", true);
	header("Content-Length: " . filesize($latest_filename), true);
	header("Connection: keep-alive", true);
	header("Content-Disposition: inline; filename=$latest_filename");
	readfile($latest_filename);
}

?>