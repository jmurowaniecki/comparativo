#!/usr/bin/env php
<?php

$fail = [];

foreach(file($argv[1]) as $line) {
    list($data, $hash) = explode(' ', $line);
    $check = md5($data);
    if ($check !== $hash) {
        $fail []= "$data $check";
    }
}

echo implode("\n", $fail);
