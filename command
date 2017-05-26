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
# currencies=('BTC' 'ETH' 'XRP' 'LTC' 'XEM' 'DASH'  'XMR' 'STR' 'STEEM' 'REP' 'GNT' 'SJCX' 'GNO')
currencies=('BTC' 'ETH')
for i in $currencies
do
  echo "before sleep $i"
  sleep 2 &&
  echo "after sleep $i"
  for day in $sample
  do
    curl https://min-api.cryptocompare.com/data/pricehistorical\?fsym\=${i}\&tsyms\=USD,BTC\&ts\=${day} > response
    echo $i","$( cat response | jq .$i.USD)","$( cat response | jq .$i.BTC)","$day >> output.txt
  done
done

