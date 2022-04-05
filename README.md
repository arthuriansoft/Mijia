# Mijia
Script(s) to format data exported from the Mijia sensors and import into influxDB.

Using the tools [here](https://pvvx.github.io/ATC_MiThermometer/) flash and configure the devices with the Telink Flasher.

Then using the GraphMemo.html page save the data as a CSV file and transfer back to your computer.

The awk script will take your CSV file and format it for importing into influxDB. Run the script with:

`awk -F \; -f mijia-convert.awk data.csv > export.csv`

This can then be imported into influxDB with:

`influx write -p s -b MyBucket -o MyOrg -t <token> -f export.csv`

or exclude the -t flag and set the $INFLUX_TOKEN variable instead. This schema has names for each sensor so multiple sets of data can be held along side each other.
