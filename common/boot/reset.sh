#!/bin/bash

echo 511 > /sys/class/gpio/export
echo out > /sys/class/gpio511/direction
echo 1 > /sys/class/gpio511/value
sleep 0.1
echo 0 > /sys/class/gpio511/value
