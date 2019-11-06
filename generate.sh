#!/bin/bash
# Example parameters. Update according to your needs
echo "Make sure start date is not greater than the end date otherwise the output will be empty"
echo "DATE FORMAT (YYYY-mm-dd)"
read -p "Enter Start Date: " STARTDATE
if [[ ! $STARTDATE =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
	echo "Invalid START date"
	exit
fi
read -p "Enter End Date: " ENDDATE
if [[ ! $ENDDATE =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
	echo "Invalid END date"
	exit
fi
# Example SELECT query. Change it to suit your needs
mysql -h {HOST NAME OR IP} -u {USER} -p{PASS} --database {DATABASE NAME} -e "SELECT * FROM transactions WHERE transaction_date > '$STARTDATE'  AND transaction_date < '$ENDDATE' ORDER BY transaction_date\G;" > output.txt
python3 process_raw_data.py output.txt
