
select pilihan in "Menu Utama" "Exit Program"
do
case $pilihan in 
	"Menu Utama")
	echo "Masukkan inputan : "
	read input;
	for ((angka=1;angka<=$input;angka=angka+1))
	do
	a=5;
	b=2;
		if [[ $angka%$a -eq 0 ]];
		then
			echo "Kode -" $angka "Khusus"
		elif [[ $angka%$b -eq 0 ]];
		then 
			printf " Kode -"$angka" Genap"
		else
			printf " Kode -"$angka" Ganjil"
		fi
	done
	;;
	"Exit Program")
	break
	;;
*) echo "Tidak dalam program"
;;
esac
done
