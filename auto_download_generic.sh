# this script executes an http edit node called "api/download_onesecprice1"
dt=$(date +%s)
echo "Current date and time: $dt"
PATH="/Users/danielsavage/desktop/csvfiles/"
FILENAME="onesecprice1.csv"
FILE="$PATH$dt$FILENAME"
echo "$FILE"
/usr/bin/curl https://[ourinstancename]:[password]@[yourinstancename].machinetrader.io/api/download_onesecprice1 -o $FILE
