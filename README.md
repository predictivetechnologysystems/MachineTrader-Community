# MachineTrader-Community
This is a community repository for MachineTrader users who want to share json files that can be uploaded in the MachineTrader instances and used to execute algorithmic trading strategies. 

"SPY 1 second to sqlite.json" - This json script connects with the Polygon.io data engine and downloads the last trade for the ticker SPY each second to a local sqlite table. Like most MachineTrader scripts, this file is entirely customizable a MachineTrader low-code, no-code instance. The script will download any equity ticker or crypto pair. It also calculates the moving average based on the last 100 trades. Prices and moving averages are stored  in a sqlite table. The rate of downloads and the length of the moving average are customizable as well. 

<img width="1477" alt="Screen Shot 2022-09-22 at 11 03 13 AM" src="https://user-images.githubusercontent.com/79699033/191783019-4555a9d2-0f79-4008-aa70-8a06bfaee634.png">


"SPY One Second Trades to Data Center.json" - This script is similar to the SPY 1 second to sqlite.json script except it downlaods and stores the data in the MachineTrader data center rather than locally, placing less demand on the local instance.   

<img width="1572" alt="Screen Shot 2022-09-22 at 10 58 55 AM" src="https://user-images.githubusercontent.com/79699033/191783046-6117d23d-6992-45d0-826a-e8752ea61a5c.png">
