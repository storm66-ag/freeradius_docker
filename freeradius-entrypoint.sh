#!/bin/bash
set -e


echo "Starting freeradius..."

exec service freeradius start  1
