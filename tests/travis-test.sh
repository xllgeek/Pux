#!/bin/bash
echo "Basic testing..."
phpunit --debug

echo "Stress testing..."
phpunit --repeat 1000

echo "Testing pux extension..."
if [[ $(phpenv version-name) =~ "5.[345]" ]] ; then
    cd ext
    extunit --phpunit --debug MuxTest.php
    extunit --phpunit --debug ControllerTest.php

    echo "Stress testing..."
    extunit --phpunit --repeat 1000 MuxTest.php
    extunit --phpunit --repeat 1000 ControllerTest.php
    cd ..
fi
