# Modify the Sensor name variable in the BEGIN section before running.
# Convert CSV from Mijia sensors with "awk -F \; -f mijia-convert.awk data.csv > export.csv"
# Run "influx write -p s -b MyBucket -o MyOrg -t <token> -f export.csv" or exclude -t and set
#  $INFLUX_TOKEN variable.

BEGIN {
	Sensor="Mijia-1"
	Measurement="air"

	getline;

	printf("#datatype measurement,tag,dateTime:number,double,double,double\n");
	printf("m,sensor,time,temperature,humidity,battery\n");
}

{
	printf("%s,%s,%s,%s,%s,%.2f\n", Measurement, Sensor, $1, $2, $3, $4/1000);
}
