mkdir dados

curl https://dados.tce.pb.gov.br/TCE-PB-SAGRES-Folha_Pessoal_Esfera_Municipal.txt.gz -o dados/TCE-PB-SAGRES-Folha_Pessoal_Esfera_Municipal.txt.gz

tar --extract --file dados/TCE-PB-SAGRES-Folha_Pessoal_Esfera_Municipal.txt.gz --directory /dados


