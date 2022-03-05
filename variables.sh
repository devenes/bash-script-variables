#!/bin/bash

# Kaç tane değişken tanımlanacağını kullanıcıdan sayı girdisi olarak alın.
read -p "Kaç tane cümle tanımlamak istediğinizi giriniz: " var_sayi
if ! [ $var_sayi -gt 0 ]; then
    echo "Lütfen 0'dan büyük bir sayı giriniz."
    exit 
# Aldığınız değişkenleri dosya içerisine yazdırın.
elif [ $var_sayi -gt 0 ]; then
    for i in $(seq 1 $var_sayi); do
        read -p "Kaydetmek istediğiniz cümleyi giriniz: " var_adi
        echo "$var_adi" >> variable.txt
    done
fi

# Kullanıcıdan gösterilecek satırı sayı değişkeni olarak alın.
read -p "Gösterilecek satır numarasını giriniz: " gosterilecek_satir
# Kullanıcıdan gösterilecek kelimeyi sayı değişkeni olarak alın. 
read -p "Seçtiğiniz satır içerisinde gösterilecek kelimenin sıra numarasını giriniz: " gosterilecek_kelime
if [ -z "${gosterilecek_satir//[1-99]}" ] && [ -z "${gosterilecek_kelime//[1-99]}" ];
    then
        # Alınan değişkenleri kullanarak dosya içerisinde seçilen satırı ekrana yazdırın.
        echo "Görmek istediğiniz satır: $(sed -n "$gosterilecek_satir"p variable.txt) "
        # Alınan değişkenleri kullanarak dosya içerisinde seçilen kelimeyi ekrana yazdırın.
        echo "Görmek istediğiniz kelime: $(sed -n "$gosterilecek_satir"p variable.txt | cut -d " " -f $gosterilecek_kelime)"
        # Oluşturulan dosya içerisinde bulunan bütün BestCloudForMe kelimelerini, BC4M olarak güncelleyin.
        sed -i "s/BestCloudForMe/BC4M/g" variable.txt
        # Tüm dosyayı ekrana yazdırın.
        echo "Tüm dosya: $(cat variable.txt)"
    else
        echo "Lütfen geçerli bir sayı giriniz."         
fi