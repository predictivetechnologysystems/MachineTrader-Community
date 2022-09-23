# MachineTrader-Community
This is a community repository for MachineTrader users who want to share json files that can be uploaded in the MachineTrader instances and used to execute algorithmic trading strategies. 

# One Second Trades to sqlite
This json script connects with the Polygon.io data engine and downloads the last trade for the ticker SPY each second to a local sqlite table. Like most MachineTrader scripts, this file is entirely customizable using a MachineTrader low-code, no-code instance. The script will download any equity ticker or crypto pair. It also calculates the moving average based on the last 100 trades. Prices and moving averages are stored  in a sqlite table. The rate of downloads and the length of the moving average are customizable as well. 

<img width="1477" alt="Screen Shot 2022-09-22 at 11 03 13 AM" src="https://user-images.githubusercontent.com/79699033/191783019-4555a9d2-0f79-4008-aa70-8a06bfaee634.png">


# One Second Trades to Data Center
This script is similar to the SPY 1 second to sqlite.json script except it downlaods and stores the data in the MachineTrader data center rather than locally, placing less demand on the local instance.   

<img width="1572" alt="Screen Shot 2022-09-22 at 10 58 55 AM" src="https://user-images.githubusercontent.com/79699033/191783046-6117d23d-6992-45d0-826a-e8752ea61a5c.png">

# Download Alpaca Orders to csv file
This MachineTrader flow will allow you to download orders (open or closed) from Alpaca to a csv file on your local device.  Edit the "get Orders" function node to select either open or closed orders and to set the number of orders to download (the default is set to 10). Alpaca limit the maximum number of orders in the download to 500. To download the file, append the url string in the /api/download_orders to your instance name: yourinstance,machinetrader.io/api/download_orders and the file will download.

<img width="1105" alt="Screen Shot 2022-09-23 at 6 50 06 AM" src="https://user-images.githubusercontent.com/79699033/191946830-9c4e79d8-735d-45ef-af22-481ca4e582f1.png">

# Trade Alpaca Long 
This script is an excellent template for any mean reversion startegy you might want to employ and is set up to do intraday trading every second of the trading day. It relies on the global variables (ticker and average price) that are assigned and calculated in the One Second Trades scripts above (you'll need to have one of those flows installed and running)  and creates and executes trades according to the logic defined in the function node "Trading algo - long only." As the name suggests, the node only creates long trades. The script uses limit trades as the default which complicates things since we need to pass a limit price (by default we use the price of the last trade), we need to know who the current position is, and if there are any outstanding orders.  The top script gets the position for the ticker we are trading (substituting zero for null so we can use it in an if clause) and any open orders.  The results are stored as flow variables. The "display variables" flow allows you to check that the values that will be used in the trading script look right.

<img width="1289" alt="Screen Shot 2022-09-23 at 7 01 42 AM" src="https://user-images.githubusercontent.com/79699033/191953996-74c429d0-5723-4339-86fc-ab6a63d65984.png">

<img width="424" alt="Screen Shot 2022-09-23 at 7 47 26 AM" src="https://user-images.githubusercontent.com/79699033/191954044-866ef826-35ea-4ce5-bbec-eb7ef03f7ca2.png">


The most important node in this flow is the "Trading algo - long only" which is shown and annotated below.


let pos = flow.get("position") // the is the value of any current positions for the ticker

let orders = flow.get("orders") // this is the value of any open orders for the ticker

let ux = (Date.now()) / 1000 // we like to use unixtime in seconds so we divided the default ms by 1000

ux = Math.trunc(ux) // make sure we have a whole integer after the division

let ticker = global.get("ticker") // this is the ticker we are trading (set in the "One Second Trades" flow)

let results = "results_" + ticker // this is the name created for a sqlite table for results if you decided to add a results flow 

let avg = global.get("average_price") // this is the moving average value for the ticker (set in the "One Second Trades" flow). The default is 100 trades

let current_price = global.get("price") // value of the last trade 

let d = (current_price - avg) // "d" is the difference between the current price and the average price 

let buytarget = (20 * -1) // the is the 'trigger' price for the trade. Typically it's at least a standard deviation of the price differences. 

    // The price is current set at $20. The lower the target, the more trades will occur but the profit per trade will likely be lower

let cvrtarget = (0.01) // this is a second 'trigger' which is the price we the position will be closed. 

    // The default "0.01" means thta as sooon as the current price crossed the average price, the position will be closed  


let type = "market" // this can be either market or limit (stop limit or trailing limits not required since the trading logic controls the exits 

let tif = "gtc" // gtc or "good until cancelled" seems to work best although this could be "day" or "ioc"

let side = "buy" // we're only doing long trades here.


// Alpaca requires limit price > 0.10 (Alpaca required the limit price to be set slightly higher than the current price for Cryptos) 

// These are turned off. This can be turned back on if required.

//let newprice = parseFloat(current_price);

//node.warn("Current Price: " +current_price+ " New Price: " +newprice)

//current_price = (newprice + .11)

//current_price = current_price.toFixed(2);




let buyqty = 50 // this can be changed

let sellqty = -50 // should match the buyqty

The rest of the logic should be self explanatory.
