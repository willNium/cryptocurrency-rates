if [ -e output.txt ]
then
  rm output.txt
  echo "reset ouput"
fi
# jan14=1388577600
# jan214=1388664000
# sample=(1388664000 1388577600)
# day=`expr $jan214 - $jan14`
sample=(1495540800)
echo $day
currencies=('BTC' 'ETH' 'XRP' 'LTC' 'XEM' 'DASH'  'XMR' 'STR' 'STEEM' 'REP' 'GNT' 'SJCX' 'GNO')
# currencies=('BTC')
for i in $currencies
do
  echo "before sleep $i"
  sleep 1 &&
  echo "after sleep $i"
  for day in $sample
  do
    echo $(curl https://min-api.cryptocompare.com/data/pricehistorical\?fsym\=${i}\&tsyms\=USD,BTC\&ts\=${day} | jq .$i)","$day"," >> output.txt
    # curl https://min-api.cryptocompare.com/data/pricehistorical\?fsym\=${i}\&tsyms\=USD,BTC\&ts\=${day} | python -mjson.tool | grep $i >> output.txt
  done
done

