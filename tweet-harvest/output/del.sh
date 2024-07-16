#!/bin/bash

# Nama file CSV
input_file="input.csv"
output_file="output.csv"

# Proses file CSV
awk -v FPAT='([^,]*)|("[^"]+")' '
NR==1 { print; next }  # Cetak header dan lanjut ke baris berikutnya
{
    # Ambil kolom full_text (kolom ke-4 dalam contoh)
    full_text = $4;

    # Hapus tanda kutip ganda di sekitar full_text
    gsub(/^"|"$/, "", full_text);

    # Pisahkan kata-kata dalam full_text
    split(full_text, words, " ");

    # Periksa apakah semua kata diawali dengan #
    all_hashtags = 1;
    for (i in words) {
        if (substr(words[i], 1, 1) != "#") {
            all_hashtags = 0;
            break;
        }
    }

    # Hapus baris jika semua kata diawali #
    if (!all_hashtags && full_text != "" && !seen[full_text]++) {
        print $0;
    }
}' $input_file > $output_file
