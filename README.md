# MachineTrader-Community
This is a community repository for MachineTrader users who want to upload or share json files in their MachineTrader instances that can be used implement and execute algorithmic trading strategies. Before attempting to upload any of these json scripts, we highly recommend reviewing the MachineTrader "Intro to Nodes and Flows in the video training library." [url] 

Many of the procedures described below have corresponding instructional videos so if you prefer video learning, to to the MachineTrader YouTube channel.

# Adding Your Alpaca Keys to Your Instance

Download json file "Alpaca Account Management.json" and import to your instance.

When you first login into your trading instance, everything is ready to go except the flows that are powered by your Alpaca account keys which you will have to enter manually. To add your keys, click the customize button in the upper right which will bring you to your MachineTrader instance backend or admin. We will assume that you have retrieved your Alpaca keys from your Alpaca account and are ready to install. If you haven't done that yet, follow the instructions here: https://www.machinetrader.io/learn-articles/adding-alpaca-keys-to-your-machinetrader-instance.

Be careful when you're using the admin because any changes you make will affect the operation of your instance. Notice that the admin consists of a series of tabs each containing a grouping of flows. Go to the far right tab labeled "Add Alpaca Account Keys." 

Your secret key is encrypted once you enter it, so no one will be able to get access to your Alpaca account.  

<img width="1120" alt="Screen Shot 2022-10-12 at 7 34 19 AM" src="https://user-images.githubusercontent.com/79699033/195339369-afad32d3-64de-4dbb-829f-3b1297a263b5.png">

<img width="512" alt="Screen Shot 2022-10-12 at 7 54 21 AM" src="https://user-images.githubusercontent.com/79699033/195339499-edd469e4-360d-4b22-8d8b-77a6ec8193f2.png">

<img width="530" alt="Screen Shot 2022-10-12 at 7 54 29 AM" src="https://user-images.githubusercontent.com/79699033/195339513-38db9d28-0fe9-4d70-bb51-08a4df3bef30.png">

# Install a Utilities Flow that contains tables for storing sub portfolios, orders, and export to csv files

Download json file "Utilities.json" and import to your instance.

The "Utilities" flow contains flows that allow you to create and monitor "sub portfolios," to keep a record of orders, and to export the contents of sqlite tables to a browser, which can be stored on your local machine. 

Sub Portfolio Tables

The sub portfolio flows allow you to group your portfolio assets into groups based on the algo strategy. The "Create Sub Portfolio table" flow creates a sub_portfolio table in a sqlite "portfolios" database. Note that we have created fields for gain, pctgain, gain_today, and pctgain_today which will allow you to track the performance of the strategy daily (or more often if you wish). 

The "Drop Sub Portfolio table" simples deletes the table, allowing you to start again if the table is flawed in any way. "Create unique index" does what is states: it creates a unique index combining the ticker and the sub portfolio id assigned to the strategy so that you can't accidently duplicate holdings in the portfolio. The last three flows allow you to display the contents of the tables so that you can review the performance of your strategies.

Orders Tables

The orders tables allows to store and retrieve Alpaca order information. The raw orders table stores the information that Alpacas return whenever a trade is entered. This data is not necessary the same as as the data returned when a request is made for "Open Orders" or "Closed Orders." As you decide to more precisely monitor in the information you sent to the Alapaca and the information captured in their order system, this information will be useful.

The open orders can be used to store information about unfilled orders at the end of a time period, typically as the end of the day. 

The closed orders table can store close order information received from Alpaca. Alpaca's sytems returns a limit of 500 orders so if your trading strategy is performing several hundred trades a day or more, you'll want to store the closed order information for future reference. 

Export and save to a local csv file

This is a very useful routine for downloading data from your instance to be viewed, typically, in an Excel spreadsheet. The file is downloaded by entering the named file in the node "/api/download_subportfolio" [yourinstancename.machinetrader.io/api/download_subportfolio]. The file will appear in the bottom left corner of the browser. The file is actually a json file that contains rows of comma separated fields. Simply copy and paste into an Excel spreadsheet using "Data > Text to Columns" using the comman separator.

The flow can be modified to download the contents of any sqlite table in your instance.

<img width="968" alt="Screen Shot 2022-10-13 at 6 48 15 AM" src="https://user-images.githubusercontent.com/79699033/195577872-551575eb-03ed-4e99-93d5-c845defca704.png">



# Modifying your Default Market Indicators and Watchlist

Download json file "Customize Market Indicators.json" and import to your instance.

One of the first things you may decide to do once your personal MachineTrader instance is up and running is to modify the default tickers that are used in the Watchlist and as market Indicators. The "Customize Market Indicators" json allows you to do just that.  

<img width="1595" alt="Screen Shot 2022-09-23 at 8 03 22 AM" src="https://user-images.githubusercontent.com/79699033/191956976-be772e82-b8de-4082-a837-41e7ff0b634c.png">

Executing the "modify market indicators" node will start a flow that deletes the current sqlite table, where the indicators are stored, and creates a new one. The second flow will insert the tickers you'd like to use.  Simply paste a comma-separated list of tickers in the "Add Market Symbols" Node and once you've deployed, they will be your new Market Indicators.  One caveat for add crypto pairs: make sure you use the Polygon.io syntax for cryptos which start with an "X:" For example, Bitcoin uses the ticker "X:BTCUSD".  The full list of Polygon cryptos is shown in the file "crypto list.txt".  

The steps for changing the Watchlist tickers are similar. 
 
<img width="791" alt="Screen Shot 2022-09-23 at 8 03 47 AM" src="https://user-images.githubusercontent.com/79699033/191956901-aded4117-61cb-4a0b-8a35-6fb76d1e91ef.png">

# Simple Interday Trade - Trade and Hold SPY Overnight

Download json file "Trade and hold SPY overnight.json" and import to your instance.

Interday trades are the easiest algorithms to write since they often use and process very little timeseries data. Academic reseach of past performance for broadly held ETFs like SPY has shown that, historically speaking, holding SPY overnight and selling at the market open produces a slightly higher return than simply holding the asset. Following that logic, we have constructed a trading flow that buys SPY at 3:55 pm  EST(shortly before close), holds it overnight, and sells it just after the market opening bell at 9:31 AM EST.

<img width="1111" alt="Trade and Hold SPY Overnight" src="https://user-images.githubusercontent.com/79699033/195580563-8205de40-906d-4b51-ba5a-9f7e9a5ac38f.png">

This strategy begins (Flow #1) with an inject node set to fire at 9 AM each day. The purpose of the first flow is to create flow variables for the ticker and the number of shares we want to trade. The values are stored in flow variables: flow.ticker and flow.qty.  We have set the ticker value to "SPY" and the qty value to "100". As a general rule we like to use flow variables rather than hard code the ticker and quanties since it will be much easier to update this flow to trade another ticker or quantity since you'll only have to modify this one flow.

Flow #2 is used to buy the 100 shares of SPY at 3:55 PM EST (remember you'll have to change your close setting in the inject node adjusting to EST if your working from a different time zone). The function node "Alpaca market order" contains the instructions we need to send to Alpaca to make the trade. We are using a market order here for simplicity. To use limit orders, stop limits, or other order types require additional data flows which will be demonstrated in later documents and videos.

<img width="412" alt="alpaca market order" src="https://user-images.githubusercontent.com/79699033/195585413-75c63feb-fcfd-4db2-9d62-58b4f2e87c54.png">

The function node "market order" contains the information Alpaca requires to execute an order which for market orders require a ticker, qty, side (buy or sell), type (market, limit, stop limit, etc.), and time_in_force (day, gtc (good until cancelled), ioc (immediate or cancel), fok (Fill or Kill).  We're using market order shere for simplicity. Later documentw will show you how to implement advance order types. Note that crypto orders are limited to time-in_force types "gtc" or "ioc".

The ticker and qty are set from the flow variables. The side, type, and time_in_force are hard coded.
 
The order is passed to Alpaca in the "Alpaca Order" node. Alpaca responds with information that the order is "in process" and that information is processed on your end in the "store raw orders" function node and then stored. Alpaca returns quite a bit of information about the order which is processed and stored by the function node "store raw orders" and sent to the sqlite raw_orders table.

<img width="767" alt="store raw orders" src="https://user-images.githubusercontent.com/79699033/195587787-3cf60624-339f-4a47-b909-2212e6cfa339.png">

We also connected the Alpaca market order node to another function node "insert in sub_portfolio id = 2" which allow us to store the order information in the sub_portfolio table to thta we can track the performance of this strategy.

Flow #3 covers the position we took the previous day by selling whatever quantity of SPY is being held (as of 6 am in the morning.

<img width="435" alt="market sell order" src="https://user-images.githubusercontent.com/79699033/195588432-1be1b1e6-1720-409e-9cd2-1be6e7553a5d.png">

Here we are using a market order similar to the buy order in Fow #2. However, instead of hard coding it to sell a specific qty -- which would cause us to take a short position if for some reason the buy order on the previous day failed - we take the qty to be sold from a the flow variable flow.postion. The variable is assigned at 6 am in the morning based on running the Alpaca Positions query.  In this case we use the "update positions" function to retrieve information that is specific to the ticker we are buying and the specific sub portfolio.  

This is the sql query used in the alpaca positions query: sql = "update sub_portfolio set gain_today = " +unrealized_intraday_pl+ ", pctgain_today = " +unrealized_intraday_plpc +", gain = " +unrealized_pl+ ", pctgain = " +unrealized_plpc+ " where ticker = '" +symbol+ "' and id = " +portfolio_id+ ";\n" 

Flow #4 is set to fire at 6 AM on trading days and gathers the information required by the sell order in Flow 3 while also update the sub_portfolio table to track performance.

  <img width="747" alt="alpaca positions query" src="https://user-images.githubusercontent.com/79699033/195590153-74687a72-8851-4f44-9264-efb12c41b649.png">


# Build Your Own no load, commission-free ETFF - Create a dividend stock portfolio

Download json file "Build a portfoliio.json" and import to your instance.

<img width="1065" alt="Screen Shot 2022-10-12 at 7 35 06 AM" src="https://user-images.githubusercontent.com/79699033/195361029-c9a5d9ae-5888-4673-8afc-f25787406719.png">

# Download Realtime Tick Data
<img width="975" alt="Screen Shot 2022-10-12 at 7 35 38 AM" src="https://user-images.githubusercontent.com/79699033/195361332-d67d2914-3dd1-49ee-8cbd-c9fb2b62bda2.png">



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
