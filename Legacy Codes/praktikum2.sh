
echo " masukkan detik : ";
read detik;
jam=3600
menit=60


if [ $detik -ge $jam ]
then 
	let sisa1=$detik%$jam
	let sisa2=$sisa1%$menit
	let hasil1=$detik/$jam
	let hasil2=$sisa1/$menit

	echo $hasil1"jam" $hasil2 "menit" $sisa2 "detik"
elif [ $detik -ge $menit ]
then 
	let sisa1=$detik%$menit
	let hasil1=$detik/$menit

	
	echo $hasil1 "menit" $sisa1 "detik"
else
	echo $detik "detik"
fi
