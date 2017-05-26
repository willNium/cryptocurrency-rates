if [ -e output.txt ]
then
  rm output.txt
  echo "reset ouput"
fi

if [ -z "$1" ]
  then
    echo "No from date supplied, starting from Jan 1, 2014"
    from=1388577600
    echo $from
  else
    from=$1
    echo "Pulling data starting at: $from"
fi

if [ -z "$2" ]
  then
    echo "No to date supplied, pulling data until the current date"
    today=$(date +%s)
    echo $today
  else
    today=$2
    echo "Pulling data until: $today"
fi

currencies=('BTC' 'ETH' 'XRP' 'LTC' 'XEM' 'DASH'  'XMR' 'STR' 'STEEM' 'REP' 'GNT' 'SJCX' 'GNO')

for i in $currencies
do
  date=$from
  sleep 10 &&
  while [ $date -lt $today ]
  do
    curl https://min-api.cryptocompare.com/data/pricehistorical\?fsym\=${i}\&tsyms\=USD,BTC\&ts\=${date} > response
    echo $i","$( cat response | jq .$i.USD)","$( cat response | jq .$i.BTC)","$date >> output.txt
    date=$[$date+86400]
  done
done

