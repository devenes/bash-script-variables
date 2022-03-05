#!/bin/bash

# Kaç tane variable tanımlanacağı kullanıcıdan sayı input olarak alın.
read -p "Kaç tane variable tanımlanacağını giriniz: " var_sayi

# Variableları dosya içerisine yazın.
for i in $(seq 1 $var_sayi); do
    read -p "Cümlenizi giriniz: " var_adi
    echo "$var_adi" >> variable.txt
done

# Kullanıcıdan gösterilecek satır ve kelimeyi sayı variable olarak alın.
read -p "Gösterilecek satır numarasını giriniz: " gosterilecek_satir
read -p "Gösterilecek kelime numarasını giriniz: " gosterilecek_kelime

# Alınan variableları kullanarak dosya içerisinde seçilen satırla seçilen kelimeyi ekrana yazdırın.
echo "Görmek istediğiniz satır: $(sed -n "$gosterilecek_satir"p variable.txt) "
echo "Görmek istediğiniz kelime: $(sed -n "$gosterilecek_satir"p variable.txt | cut -d " " -f $gosterilecek_kelime)"

# Oluşturulan dosya içerisinde bulunan bütün BestCloudForMe kelimelerini, BC4M olarak güncelleyin.
sed -i "s/BestCloudForMe/BC4M/g" variable.txt

# Tüm dosyayı ekrana yazdırın.
echo "Tüm dosya: $(cat variable.txt)"
