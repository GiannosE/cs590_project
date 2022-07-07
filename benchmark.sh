#!/bin/bash

start_time=`date +%s`
$@
end_time=`date +%s`
echo execution time was `expr $end_time - $start_time` s.
