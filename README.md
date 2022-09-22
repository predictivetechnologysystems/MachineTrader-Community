# MachineTrader-Community
This is a community repository for MachineTrader users who want to share json files that can be uploaded in the MachineTrader instances and used to execute algorithmic trading strategies. 

"SPY 1 second to sqlite.json" - This json script connects with the Polygon.io data engine and downloads the last trade for the ticker SPY each second. Like most MachineTrader scripts, this file is entirely customizable a MachineTrader low-code, no-code instance. The script will download any equity ticker or crypto pair. It also calculates the moving average based on the last 100 trades. Prices and moving averages are stored  in a sqlite table. The rate of downloads and the length of ht emoving average are customizable as well. 

