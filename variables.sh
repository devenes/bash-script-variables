#!/bin/bash

# Kaç tane değişken tanımlanacağını kullanıcıdan sayı girdisi olarak alın.
read -p "Kaç tane cümle tanımlamak istediğinizi giriniz: " var_sayi
# Değişkenleri dosya içerisine yazın.
if [ $var_sayi -gt 0 ]; then
    for i in $(seq 1 $var_sayi); do
        read -p "Kaydetmek istediğiniz cümleyi giriniz: " var_adi
        echo "$var_adi" >> variable.txt
    done
fi

# Kullanıcıdan gösterilecek satır ve kelimeyi sayı değişkeni olarak alın.
read -p "Gösterilecek satır numarasını giriniz: " gosterilecek_satir
read -p "Seçtiğiniz satır içerisinde gösterilecek kelimenin sıra numarasını giriniz: " gosterilecek_kelime
if [ -z "${gosterilecek_satir//[1-99]}" ] && [ -z "${gosterilecek_kelime//[1-99]}" ];
    then
        # Alınan variableları kullanarak dosya içerisinde seçilen satırla seçilen kelimeyi ekrana yazdırın.
        echo "Görmek istediğiniz satır: $(sed -n "$gosterilecek_satir"p variable.txt) "
        echo "Görmek istediğiniz kelime: $(sed -n "$gosterilecek_satir"p variable.txt | cut -d " " -f $gosterilecek_kelime)"
        # Oluşturulan dosya içerisinde bulunan bütün BestCloudForMe kelimelerini, BC4M olarak güncelleyin.
        sed -i "s/BestCloudForMe/BC4M/g" variable.txt
        # Tüm dosyayı ekrana yazdırın.
        echo "Tüm dosya: $(cat variable.txt)"
    else
        echo "Lütfen geçerli bir sayı giriniz."
fi