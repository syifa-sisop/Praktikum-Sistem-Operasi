z=0
menu=0
buatuser(){
	echo "Masukkan nama : "
	read nama
	sudo adduser $nama
}
hapususer(){
	cd /home
	ls
	echo "Masukkan nama user yang ingin dihapus : "
	read delete
	sudo deluser --remove-home $delete
	cd ..
}
buatdata(){
	let z=$z+1
	echo -e "============ Selamat Datang ============="
	echo -e "======= Di Bank Rakyat Indonesia ========"
	echo -e "Masukkan nama anda 		     	 :"
	read nama[$z]
	echo -e "Masukkan no rekening 		     	 :"
	read nomor[$z]	    
	echo -e "Masukkan nama bank 		     	 :"
	read bank[$z]
	echo -e "Masukkan tanggal lahir (dd-mm-yyyy) 	 :"
	read ttl[$z]
	echo -e "Masukkan alamat (gunakan _ untuk spasi) :"
	read alamat[$z]
	echo -e "Masukkan alamat nama kota		 :"
	read kota[$z]
	echo -e "Masukkan alamat nama provinsi		 :"
	read provinsi[$z]
	echo -e "Masukkan jumlah saldo			 :"
	read saldo[$z]
	echo -e "========================================="
}
liatdata(){
	for((a=1;a<=z;a++))
            do
                        echo "- - -Nasabah ke-$a- - -"
                        echo "No rekening 	: ${nomor[$a]}"
                        echo "Nama 		: ${nama[$a]}"
                        echo "Bank     	: ${bank[$a]}"
                        echo "tanggal lahir 	: ${ttl[$a]}"
                        echo "Alamat      	: ${alamat[$a]}"
			echo "Saldo     	: Rp.${saldo[$a]}"
            done
}
cari(){
            echo -n "Masukkan Nomor Rekening : "
            read cari
            a=0
            b=0
            while [ $a -le $z ] && [ $b == 0 ]
            do
                        let a=$a+1
                        if [ "${nomor[a]}" == $cari ]
                        then
                                    b=1
                        fi
            done
}
cetak(){
            cari
            if [ $a -le $z ]
            then
                        echo "No rekening 	: ${nomor[$a]}"
                        echo "Nama 		: ${nama[$a]}"
                        echo "Bank     	: ${bank[$a]}"
                        echo "tanggal lahir 	: ${ttl[$a]}"
                        echo "Alamat      	: ${alamat[$a]}"
			echo "Saldo     	: Rp.${saldo[$a]}"
            else
                        echo "Data Tidak Ada"
            fi
}
isisaldo(){
	cari
	if [ $a -le $z ]
            then
                        echo "No rekening 	: ${nomor[$a]}"
                        echo "Nama 		: ${nama[$a]}"
                        echo "Bank     	: ${bank[$a]}"
                        echo "tanggal lahir 	: ${ttl[$a]}"
                        echo "Alamat      	: ${alamat[$a]}"
			echo "Saldo     	: Rp.${saldo[$a]}"
                        echo "- - --- - -"
                        echo -n "Masukkan nominal pengisian     : "
                        read isi[$a]
			echo -e "++++++++++++++++++++++++++++++++++++++++"
			let saldo[$a]=${saldo[$a]}+${isi[$a]}
                        echo -e "Saldo anda sekarang	        : ${saldo[$a]}"

            else
                        echo "Data Tidak Ada"
            fi
}
tarik(){
	cari
	if [ $a -le $z ]
            then
                        echo "No rekening 	: ${nomor[$a]}"
                        echo "Nama 		: ${nama[$a]}"
                        echo "Bank     	: ${bank[$a]}"
                        echo "tanggal lahir 	: ${ttl[$a]}"
                        echo "Alamat      	: ${alamat[$a]}"
			echo "Saldo     	: Rp.${saldo[$a]}"
                        echo "- - --- - -"
                        echo -n "Masukkan nominal penarikan     : "
                        read tarik[$a]
			if [ ${saldo[$a]} -le ${tarik[$a]} ]
			then
				echo -e "==== Saldo Tidak Cukup ===="
			else
			echo -e "++++++++++++++++++++++++++++++++++++++++"
			let saldo[$a]=${saldo[$a]}-${tarik[$a]}
                        echo -e "Saldo anda sekarang	        : ${saldo[$a]}"
			fi

            else
                        echo "Data Tidak Ada"
            fi
}
transfer(){
	cari
	if [ $a -le $z ]
            then
                        echo "No rekening 	: ${nomor[$a]}"
                        echo "Nama 		: ${nama[$a]}"
                        echo "Bank     	: ${bank[$a]}"
                        echo "tanggal lahir 	: ${ttl[$a]}"
                        echo "Alamat      	: ${alamat[$a]}"
			echo "Saldo     	: Rp.${saldo[$a]}"
                        echo "- - --- - -"
                        echo -n "Masukkan Nomor Rekening tujuan   : "
                        read nomor2[$a]
                        echo -n "Tujuan transfer atas nama	  : "
                        read nama2[$a]
                        echo -n "Masukkan nominal transfer     	  : "
                        read transfer[$a]
			if [ ${saldo[$a]} -le ${transfer[$a]} ]
			then
				echo -e "==== Saldo Tidak Cukup ===="
			else
			echo -e "++++++++++++++++++++++++++++++++++++++++"
			echo -e "============= Transfer Sukses =============="
			let saldo[$a]=${saldo[$a]}-${transfer[$a]}
                        echo -e "Saldo anda sekarang	        : ${saldo[$a]}"
			echo -e "============================================"
			fi

            else
                        echo "Data Tidak Ada"
            fi
}
hapus(){
            cari
            if [ $a -gt $z ]
            then
                        echo "Data Tidak Ada"
            else
                        while [ $a -lt $z ]
                        do
                                    let b=$a+1
                                    nomor[$a]=${nomor[$b]}
                                    nama[$a]=${nama[$b]}
                                    bank[$a]=${bank[$b]}
                                    ttl[$a]=${ttl[$b]}
                                    alamat[$a]=${alamat[$b]}
				    kota[$a]=${kota[$b]}
                                    provinsi[$a]=${provinsi[$b]}
                                    saldo[$a]=${saldo[$b]}
                                    let a=$a+1
                        done
                        let z=$z-1
                        echo "Data $cari Berhasil Dihapus"
            fi
}	
while [ $menu != 10 ]
do
	    echo -e "============ Selamat Datang ============="
	    echo -e "======= Di Bank Rakyat Indonesia ========"
            echo "1.  Membuat User"	
            echo "2.  Hapus User"		
            echo "3.  Buat Data Nasabah"		
	    echo "4.  Lihat Data"	
	    echo "5.  Isi Saldo"
	    echo "6.  Penarikan"
	    echo "7.  Transfer"
	    echo "8.  Cari Data"
	    echo "9.  Hapus Data"
	    echo "10. Exit"
	    echo -e "============== Terima Kasih =============="	
            echo -n " : "
            read menu
            if [ $menu -eq 1 ]
            then
                        buatuser 
            elif [ $menu -eq 2 ]
            then
                        hapususer
            elif [ $menu -eq 3 ]
            then
                	buatdata                 
            elif [ $menu -eq 4 ]
            then
                       if [ $z -lt 1 ]
                        then
                                    echo "Data kosong "
                        else
                                    liatdata
                        fi
            elif [ $menu -eq 5 ]
            then
                        isisaldo 
	    elif [ $menu -eq 6 ]
            then
                         tarik
	    elif [ $menu -eq 7 ]
            then
                        transfer
	    elif [ $menu -eq 8 ]
            then
                        cetak
            elif [ $menu -eq 9 ]
            then
                        hapus
            elif [ $menu -eq 10 ]
            then
                        echo "Terima Kasih" 
			break         
            else
                        echo "Salah "
            fi
            echo ""
done