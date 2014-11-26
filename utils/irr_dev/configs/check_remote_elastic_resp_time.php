<?php
#
# Copyright (c) 2006-2010 Joerg Linge (http://www.pnp4nagios.org)
# Plugin: check_load
#
$opt[1] = "--vertical-label % -l0  --title \"Web1 Nginx Req Times\" --height 300 --upper-limit 100 --rigid";
$def[1]  = rrd::def("resp_0", $RRDFILE[1], $DS[1], "AVERAGE");
$def[1] .= rrd::def("resp_1", $RRDFILE[1], $DS[2], "AVERAGE");
$def[1] .= rrd::def("resp_2", $RRDFILE[1], $DS[3], "AVERAGE");
$def[1] .= rrd::def("resp_3", $RRDFILE[1], $DS[4], "AVERAGE");
$def[1] .= rrd::def("resp_4", $RRDFILE[1], $DS[5], "AVERAGE");
$def[1] .= rrd::def("resp_5", $RRDFILE[1], $DS[6], "AVERAGE");
$def[1] .= rrd::def("resp_6", $RRDFILE[1], $DS[7], "AVERAGE");
$def[1] .= rrd::def("resp_7", $RRDFILE[1], $DS[8], "AVERAGE");
$def[1] .= rrd::def("resp_8", $RRDFILE[1], $DS[9], "AVERAGE");
$def[1] .= rrd::def("resp_9", $RRDFILE[1], $DS[10], "AVERAGE");
$def[1] .= rrd::def("resp_10_20", $RRDFILE[1], $DS[11], "AVERAGE");
$def[1] .= rrd::def("resp_21_30", $RRDFILE[1], $DS[12], "AVERAGE");
$def[1] .= rrd::def("resp_31", $RRDFILE[1], $DS[13], "AVERAGE");
$def[1] .= rrd::def("served", $RRDFILE[1], $DS[14], "AVERAGE");
$def[1] .= rrd::def("banned", $RRDFILE[1], $DS[15], "AVERAGE");

$def[1] .= rrd::cdef('resp_0_p', 'resp_0,served,/,100,*');
$def[1] .= rrd::cdef('resp_1_p', 'resp_1,served,/,100,*');
$def[1] .= rrd::cdef('resp_2_p', 'resp_2,served,/,100,*');
$def[1] .= rrd::cdef('resp_3_p', 'resp_3,served,/,100,*');
$def[1] .= rrd::cdef('resp_4_p', 'resp_4,served,/,100,*');
$def[1] .= rrd::cdef('resp_5_p', 'resp_5,served,/,100,*');
$def[1] .= rrd::cdef('resp_6_p', 'resp_6,served,/,100,*');
$def[1] .= rrd::cdef('resp_7_p', 'resp_7,served,/,100,*');
$def[1] .= rrd::cdef('resp_8_p', 'resp_8,served,/,100,*');
$def[1] .= rrd::cdef('resp_9_p', 'resp_9,served,/,100,*');
$def[1] .= rrd::cdef('resp_10_20_p', 'resp_10_20,served,/,100,*');
$def[1] .= rrd::cdef('resp_21_30_p', 'resp_21_30,served,/,100,*');
$def[1] .= rrd::cdef('resp_31_p', 'resp_31,served,/,100,*');

$def[1] .= rrd::area("resp_0_p", "#006B04",	"x = 0s       ") ;
$def[1] .= rrd::gprint("resp_0_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_1_p", "#006B04",	"x = 1s       ") ;
$def[1] .= rrd::gprint("resp_1_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_2_p", "#006B04",	"x = 2s       ") ;
$def[1] .= rrd::gprint("resp_2_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_3_p", "#006B04",	"x = 3s       ") ;
$def[1] .= rrd::gprint("resp_3_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_4_p", "#006B04",	"x = 4s       ") ;
$def[1] .= rrd::gprint("resp_4_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_5_p", "#006B04",	"x = 5s       ") ;
$def[1] .= rrd::gprint("resp_5_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_6_p", "#006B04",	"x = 6s       ") ;
$def[1] .= rrd::gprint("resp_6_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_7_p", "#006B04",	"x = 7s       ") ;
$def[1] .= rrd::gprint("resp_7_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_8_p", "#006B04",	"x = 8s       ") ;
$def[1] .= rrd::gprint("resp_8_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_9_p", "#006B04",	"x = 9s       ") ;
$def[1] .= rrd::gprint("resp_9_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_10_20_p", "#0000FF",	"10s > x > 20s  ", "STACK") ;
$def[1] .= rrd::gprint("resp_10_20_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_21_30_p", "#0000FF",	"21s > x > 30s  ", "STACK") ;
$def[1] .= rrd::gprint("resp_21_30_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_31_p", "#006B04",	"x > 31s       ") ;
$def[1] .= rrd::gprint("resp_31_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");

$def[1] .= rrd::area("resp_1_p", "#FFFFFF",	"x = 1s       ", "STACK") ;
$def[1] .= rrd::gprint("resp_1_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_2_4_p", "#0000FF",	"2s > x > 4s  ", "STACK") ;
$def[1] .= rrd::gprint("resp_2_4_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_5_10_p", "#FFFF00",	"5s > x > 10s ", "STACK") ;
$def[1] .= rrd::gprint("resp_5_10_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_11_20_p", "#3C42FA",	"11s > x > 20s", "STACK") ;
$def[1] .= rrd::gprint("resp_11_20_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");
$def[1] .= rrd::area("resp_21_p", "#FF0000",	"21s < x      ", "STACK") ;
$def[1] .= rrd::gprint("resp_21_p", array("LAST", "AVERAGE", "MAX"), "%6.2lf $UNIT[1]");

$opt[2] = "--vertical-label Request_times -l0  --title \"Elastic Balanser Req Per Sec\" --lower-limit 0 --rigid ";
#$def[2]  = rrd::def("rps", $RRDFILE[1], $DS[7], "AVERAGE");

$def[2]  = rrd::def("resp_0", $RRDFILE[1], $DS[1], "AVERAGE");
$def[2] .= rrd::def("resp_1", $RRDFILE[1], $DS[2], "AVERAGE");
$def[2] .= rrd::def("resp_2_4", $RRDFILE[1], $DS[3], "AVERAGE");
$def[2] .= rrd::def("resp_5_10", $RRDFILE[1], $DS[4], "AVERAGE");
$def[2] .= rrd::def("resp_11_20", $RRDFILE[1], $DS[5], "AVERAGE");
$def[2] .= rrd::def("resp_21", $RRDFILE[1], $DS[6], "AVERAGE");
$def[2] .= rrd::cdef('total', 'resp_0,resp_1,+,resp_2_4,+,resp_5_10,+,resp_11_20,+,resp_21,+');
$def[2] .= rrd::cdef('rps', 'total,60,/');

$def[2] .= rrd::gradient("rps", "ff5c00", "ffdc00", "count", 20) ;
$def[2] .= rrd::gprint("rps", array("LAST", "MAX", "AVERAGE"), "%6.2lf $UNIT[1]") ;
$def[2] .= rrd::line1("rps", "#0F0091") ;
?>
