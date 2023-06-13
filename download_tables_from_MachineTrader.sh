#!/bin/bash
# Bash script for downloading tables from MachineTrader

SNAPSHOT=`date +%Y%m%d-%H%M%S`
filename_trade=trades_$SNAPSHOT.csv
filename_spy=SPY_second_$SNAPSHOT.csv

curl --silent "https://jpawlowski051823a.machinetrader.io/api/download_spy_ticks" \
     -H 'Content-Type: application/csv' \
     -u 'jpawlowski051823a:testing' \
     -o $filename_spy

curl --silent "https://jpawlowski051823a.machinetrader.io/api/download_trades" \
     -H 'Content-Type: application/csv' \
     -u 'jpawlowski051823a:testing' \
     -o $filename_trade
