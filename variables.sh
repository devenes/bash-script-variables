#!/bin/bash

#Değişken Sayıda Variable’ı (Kaç tane variable tanımlanacağı sayı olarak) kullanıcıdan input olarak alın
read -p "Kaç tane variable tanımlanacağınızı giriniz: " var_sayi

# Variableları dosya içerisine yazın
for i in $(seq 1 $var_sayi); do
    read -p "Variable adını giriniz: " var_adi
    echo "$var_adi" >> variable.txt
done

# Kullanıcıdan gösterilecek satır ve kelimeyi (Sayı olarak) variable olarak alın
read -p "Gösterilecek satır numarasını giriniz: " gosterilecek_satir
read -p "Gösterilecek kelime numarasını giriniz: " gosterilecek_kelime

# Alınan variableları kullanarak, dosya içerisindeki seçilen satırın seçilen kelimesini ekrana yazdırın
echo "Görmek istediğiniz satır: $(sed -n "$gosterilecek_satir"p variable.txt) "
echo "Görmek istediğiniz kelime: $(sed -n "$gosterilecek_satir"p variable.txt | cut -d " " -f $gosterilecek_kelime)"

# Oluşturulan dosyalar içerisinde bulunan BestCloudForMe kelimesini, komut kullanılarak BC4M olarak güncelleyin
sed -i "s/BestCloudForMe/BC4M/g" variable.txt

# Tüm dosyayı ekrana yazdırın
echo "Tüm dosya: $(cat variable.txt)"
