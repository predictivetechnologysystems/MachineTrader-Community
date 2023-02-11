# MachineTrader-Community
This is a community repository for MachineTrader users who want to upload or share json files to be used in MachineTrader instances.  Json files can be used to implement and execute algorithmic trading strategies. The easiest method for downloading the json files you'll need is to click the green "Code"  button to the right, and then download zip files. You'll then be able to "Import" the json files into your instance as you need them.

Before attempting to upload any of these json scripts, we highly recommend reviewing the MachineTrader "Intro to Nodes and Flows" video in the video training library by clicking here: https://drive.google.com/file/d/1sZTaXBhRjyAKSIIaxdYJ8Lh2xVoUtV_8/view?usp=sharing

Many of the procedures described below have corresponding instructional videos, so if you prefer video learning, go to the MachineTrader YouTube channel.

# Adding Your Alpaca Keys to Your Instance

Download json file "Alpaca Keys.json" and import to your instance. To view the instructional video, click here: https://drive.google.com/file/d/1Kz-h77E0QO-SEA_qbdGFgaBQUwJ2V1mk/view?usp=sharing

When you first log in to your trading instance, everything is ready to go except for the flows which are powered by your Alpaca account keys, which you will have to enter manually. To add your keys, click the "Customize View" button on the upper right corner of the home page, which will bring you to your MachineTrader instance backend or "admin". We will assume that you have retrieved your Alpaca keys from your Alpaca account (it is a good practice to save them to a note or document on your computer for future reference), and are ready to install. If you haven't done that yet, follow the instructions here: https://www.machinetrader.io/learn-articles/adding-alpaca-keys-to-your-machinetrader-instance.

Be careful when you're using the admin because any changes you make will affect the operation of your instance. Notice that the admin consists of a series of tabs, each containing a grouping of flows. Go to the tab labeled "Alpaca Keys." 

Your secret key is encrypted once you enter it, so no one will be able to get access to your Alpaca account.  

<img width="1120" alt="Screen Shot 2022-10-12 at 7 34 19 AM" src="https://user-images.githubusercontent.com/79699033/195339369-afad32d3-64de-4dbb-829f-3b1297a263b5.png">

<img width="512" alt="Screen Shot 2022-10-12 at 7 54 21 AM" src="https://user-images.githubusercontent.com/79699033/195339499-edd469e4-360d-4b22-8d8b-77a6ec8193f2.png">

<img width="530" alt="Screen Shot 2022-10-12 at 7 54 29 AM" src="https://user-images.githubusercontent.com/79699033/195339513-38db9d28-0fe9-4d70-bb51-08a4df3bef30.png">



# Modifying Your Default Market Indicators and Watchlist

Download json file "Customize Market Indicators.json" and import to your instance. To view the instructional video, click here: https://drive.google.com/file/d/1Kz-h77E0QO-SEA_qbdGFgaBQUwJ2V1mk/view?usp=sharing

One of the first things you may decide to do once your personal MachineTrader instance is up and running, is to modify the default tickers that are used in the Watchlist and as Market Indicators. The "Customize Market Indicators" json allows you to do just that.  

<img width="1595" alt="Screen Shot 2022-09-23 at 8 03 22 AM" src="https://user-images.githubusercontent.com/79699033/191956976-be772e82-b8de-4082-a837-41e7ff0b634c.png">

Executing the "modify market indicators" node will start a flow that deletes the current sqlite table, where the indicators are stored, and creates a new one. The second flow will insert the tickers you'd like to use.  Simply paste a comma-separated list of tickers in the "Add Market Symbols" Node, and once you've deployed, they will be your new Market Indicators.  One caveat for adding crypto pairs: make sure you use the Polygon.io syntax for cryptos, which start with an "X:" For example, Bitcoin uses the ticker "X:BTCUSD".  The full list of Polygon cryptos is shown in the file "crypto list.txt".  

The steps for changing the Watchlist tickers are similar. 
 
<img width="791" alt="Screen Shot 2022-09-23 at 8 03 47 AM" src="https://user-images.githubusercontent.com/79699033/191956901-aded4117-61cb-4a0b-8a35-6fb76d1e91ef.png">

Once you have changed the Market Indicators and/or the Watchlist, you'll need to kick start the flows that update the prices and changes. Click the three "Update" inject nodes under Watchlist, and the three "Update" nodes under Markets to activate the scripts.

<img width="1333" alt="Screen Shot 2022-10-14 at 3 42 34 PM" src="https://user-images.githubusercontent.com/79699033/195928988-0068ead4-4839-4098-88d6-78a19a7ac247.png">

# Buy Crypto Portfolio

This strategy creates a portfolio of a set dollar amount, gets a list of crypto symbols, and then purchases the cryptos so that the portfolio contains a balance of cryptos all held inh a simlar dollar amount. Before using this strategy, check your account details screen in the front end to make sure your account has been approved for tarding crypto.

<img width="975" alt="Screenshot 2023-02-04 at 7 14 40 AM" src="https://user-images.githubusercontent.com/79699033/216764979-03d3123e-085c-453e-8c6f-85f7549b1010.png">


Flow #1: Identify list of crypto symbols, create a strategy ID, 


<img width="641" <img width="641" alt="Screenshot 2023-02-04 at 7 24 14 AM" src="https://user-images.githubusercontent.com/79699033/216764937-eaf520b5-4a5c-4162-9660-18cf13203a9a.png">


alt="Screenshot 2023-02-04 at 7 24 14 AM" src="https://user-images.githubusercontent.com/79699033/216764926-e735943f-76bb-45eb-83a4-1a3087240c95.png">


<img width="847" alt="Screenshot 2023-02-04 at 7 24 32 AM" src="https://user-images.githubusercontent.com/79699033/216764923-3d703240-ad81-47fb-a8c2-8b5034f3b69c.png">


 and store 



# Simple Interday Trade - Trade and Hold SPY Overnight

Download json file "Trade and hold SPY overnight.json" and import to your instance. To view the instructional video, click here: https://drive.google.com/file/d/1QdPHE3HiGdpuGrlmGD9ZlY0gZ_phy2GC/view?usp=sharing

Interday trades are the easiest algorithms to write since they often use and process very little timeseries data. Academic reseach of past performance for broadly held ETFs like SPY has shown that, historically speaking, holding SPY overnight and selling at the market open produces a slightly higher return than simply holding the asset. Following that logic, we have constructed a trading flow that buys SPY at 3:55 pm  EST(shortly before close), holds it overnight, and sells it just after the market opening bell at 9:31 AM EST.

<img width="1111" alt="Trade and Hold SPY Overnight" src="https://user-images.githubusercontent.com/79699033/195580563-8205de40-906d-4b51-ba5a-9f7e9a5ac38f.png">

This strategy begins (Flow #1) with an inject node set to fire at 9 AM each day. The purpose of the first flow is to create flow variables for the ticker and the number of shares we want to trade. The values are stored in flow variables: flow.ticker and flow.qty.  We have set the ticker value to "SPY" and the qty value to "100". As a general rule we like to use flow variables rather than hard code the ticker and quanties since it will be much easier to update this flow to trade another ticker or quantity since you'll only have to modify this one flow.

Flow #2 is used to buy the 100 shares of SPY at 3:55 PM EST (remember you'll have to change your close setting in the inject node adjusting to EST if your working from a different time zone). The function node "Alpaca market order" contains the instructions we need to send to Alpaca to make the trade. We are using a market order here for simplicity. To use limit orders, stop limits, or other order types require additional data flows which will be demonstrated in later documents and videos.

<img width="412" alt="alpaca market order" src="https://user-images.githubusercontent.com/79699033/195585413-75c63feb-fcfd-4db2-9d62-58b4f2e87c54.png">

The function node "market order" contains the information Alpaca requires to execute an order which for market orders require a ticker, qty, side (buy or sell), type (market, limit, stop limit, etc.), and time_in_force (day, gtc (good until cancelled), ioc (immediate or cancel), fok (Fill or Kill).  We're using market order shere for simplicity. Later documentw will show you how to implement advance order types. Note that crypto orders are limited to time-in_force types "gtc" or "ioc".

The ticker and qty are set from the flow variables. The side, type, and time_in_force are hard coded.
 
The order is passed to Alpaca in the "Alpaca Order" node.  Alpaca returns quite a bit of information about the order which is processed and stored by the function node "store raw orders" and sent to the sqlite raw_orders table. If you look carefully at the sql insert, you will see that only some of the information is stored.  This can be modified according to your needs although you will need to modify the create table statement in the "Utilities" node to create additional fields.

<img width="767" alt="store raw orders" src="https://user-images.githubusercontent.com/79699033/195587787-3cf60624-339f-4a47-b909-2212e6cfa339.png">

We also connected the Alpaca market order node to another function node "insert in sub_portfolio id = 2" which allow us to store the order information in the sub_portfolio table to thta we can track the performance of this strategy.

Flow #3 covers the position we took the previous day by selling whatever quantity of SPY is being held (as of 6 am in the morning.

<img width="435" alt="market sell order" src="https://user-images.githubusercontent.com/79699033/195588432-1be1b1e6-1720-409e-9cd2-1be6e7553a5d.png">

Here we are using a market order similar to the buy order in Flow #2. However, instead of hard coding it to sell a specific qty -- which would cause us to take a short position if for some reason the buy order on the previous day failed - we take the qty to be sold from the flow variable flow.postion. The variable is assigned at 6 am in the morning based on running the Alpaca Positions query.  In this case we use the "update positions" function to retrieve information that is specific to the ticker we are buying and the specific sub portfolio.  

This is the sql query used in the alpaca positions query: sql = "update sub_portfolio set gain_today = " +unrealized_intraday_pl+ ", pctgain_today = " +unrealized_intraday_plpc +", gain = " +unrealized_pl+ ", pctgain = " +unrealized_plpc+ " where ticker = '" +symbol+ "' and id = " +portfolio_id+ ";\n" 

Flow #4 is set to fire at 6 AM on trading days and gathers the information required by the sell order in Flow 3 while also updating the sub_portfolio table to track performance.

  <img width="747" alt="alpaca positions query" src="https://user-images.githubusercontent.com/79699033/195590153-74687a72-8851-4f44-9264-efb12c41b649.png">


# Build Your Own no-load, commission-free ETFF - Create a dividend stock portfolio

Download json file "Build a portfoliio.json" and import to your instance.

One of the really useful things you can do simply and easily is to build your very own no-load, commission-free ETFs. MachineTrader maintains nearly a dozen collections representing different combinations of assets. One collection is called "dividends" and it includes more than one thousand stocks that pay regular dividends. The flow we discuss here uses the dividend collection to construct a portfolio of stocks that pay dividends.

 <img width="953" alt="Create dividend portfolio" src="https://user-images.githubusercontent.com/79699033/195637359-bf814670-e24a-45ab-9d6a-02e4605f95dc.png">


The initial flow queries MachineTrader's ptsapi database for the collection dividends. The sql is defined to get a unique list of tickers, along with the previous day's closing price, but filtered to include those tickers what have a value betwen 4 and 10 in the "pct" field and which have an exdate greater than 6/1/2022.  The dividend table includes informaton on dividends going back 15 years, but we're only interested in the lastest information -- after 6/1/22. 

The pct field contains the value expressed as a pct of the current annual dividend for the stock; i.e. give us a list of stocks paying annual dividends between 4 and 10 percent. Since this is a low code, no code platform, you can change that query in the "Get divident stocks" function to reflect your own preferences. Being the cautious types, we avoid including any stock paying an annual dividend above 10 percent. We also don't want to bother with any stocks paying less than 4 percent. Revise the query as you like.

<img width="696" alt="dividend query" src="https://user-images.githubusercontent.com/79699033/195627730-2e2f0bb8-6e6d-4ccd-8975-e6aa9f885596.png">

The query is executed and the number of stocks found that matched the criteria is stored in the flow variable flow.stocks. 

The second flow lets me define the size of my desired portfolio in whole dollars (flow.portfolio_size) and assigns id = 1 to the flow.portfolio_id.
Note that is used the inject node ("set size of portfolio whole dollars) to send these variables to the change node.

<img width="465" alt="inject node" src="https://user-images.githubusercontent.com/79699033/195629996-f459ff40-c977-435b-ac78-0bb560a5c0a2.png">

<img width="346" alt="change node" src="https://user-images.githubusercontent.com/79699033/195630040-1cee4d03-5b12-46e4-8e46-60579b6eac68.png">

Click the "Display flow variables" in the third flow to make sure we stored the values we wanted. You can see that our filter reduced the list of stocks to buy to 91.  One problem  with the loop node we're using is that the number of iterations in the loop has to be set manually. So open the "Fixed Count Loop and enter the value 91 as shown below. 

<img width="287" alt="Fixed Loop Node" src="https://user-images.githubusercontent.com/79699033/195634794-5ef052b8-9d62-4a92-b280-607419049c58.png">

We're now ready to send our orders to Alpaca to be filled. When we buy a large numbber of stocks like this, we recommend using "loop" amnd "delay" nodes so that don't overwhelm the Alapaca API. Depending on your Alpaca subscription plan, you're limited to 200 queries a minute so we need to be careful - don't want to be cancelled!  For simplicity, we're using market orders. Depending on how long you plan to hold the portfolio, market orders are probably fine.  Flow 3 concludes by storing order info in the orders database and the portfolio info is inserted into the portfolio database.

Flow 4 concludes this strategy with an inject node running each morning at 6 AM which hits the "Alpaca Positions Query," parsing that information in the "update positions" node, splitting the position array into separate rows (split node) so the each line of information becomes it's own update query. With the update, if you view or download the position table, you can see how the strategy is workimng on a daily basis.




  

