# MachineTrader-Community
This is a community repository for MachineTrader users who want to upload or share json files to be used in MachineTrader instances.  Json files can be used to implement and execute algorithmic trading strategies. The easiest method for downloading the json files you'll need is to click the green "Code"  button to the right, and then download zip files. You'll then be able to "Import" the json files into your instance as you need them.

Before attempting to upload any of these json scripts, we highly recommend reviewing the MachineTrader "Intro to Nodes and Flows" video in the video training library by clicking here: https://drive.google.com/file/d/1sZTaXBhRjyAKSIIaxdYJ8Lh2xVoUtV_8/view?usp=sharing


# Adding Your Alpaca Keys to Your Instance

Click the Admin button in the upper right of the Home page of your instance. This opens a browser tab in the backend (you may need to login again). Click the "home" tab.

Click the inject node on the top fow which will activate the Alpaca Oauth routine.  Login into your Alpaca account and follow the instructions here: https://drive.google.com/file/d/1vAUkXuiP4CGUszLROUvCPBdG5Lx0T0I0/view

Once you Alpaca account is authorized, test by clicking the "Test Live Key" and "Test Paper Key" inject nodes and account information will be displayed to your right in the debug panel.

# Be Careful working in the Admin

Be careful when you're using the admin because any changes you make will affect the operation of your instance. 

<img width="1010" alt="Screenshot 2023-03-11 at 9 03 21 AM" src="https://user-images.githubusercontent.com/79699033/224489148-43a98b28-4ab5-4718-964d-26138c3cd26a.png">

You will see a pencil icon on the right.  Click that, and paste in your Key in “API Key ID” and your Secret Key 

# Modifying Your Default Market Indicators and Watchlist

One of the first things you may decide to do once your personal MachineTrader instance is up and running, is to modify the default tickers that are used in the Watchlist and as Market Indicators. The "Modify Markets and Watchlist" json allows you to do just that.  

<img width="1503" alt="Screenshot 2023-03-11 at 8 53 19 AM" src="https://user-images.githubusercontent.com/79699033/224489521-85d57530-4f76-4d10-9c7d-1e81eaccab82.png">

Click on the inject nodes "Display Markets tickers" or "Display Watchlist tickers" to send the current values stored in postgres table to the debug panel. The tickers can be changed and update by using the other flows in the tab. 

Clear existing tables will use the "truncate" sql command to clear out the values stored in the tables. Add new tickers allows you to insert a new list of tickers into the table. Make sure they tickers are comma separated and that there are no spaces. 

Once the new tickers have been added, the "Update names" flows use a sql command to update the full name of the ticker matching values in the alpaca_assets table.

The final set of flows will giv e you starting prices for the tickers which are set to update auytomatically going forward. The 6AM flow gets the price for each ticker as 6Am (New York time). The 7d flows stores the price for a ticker 7 days ago.



