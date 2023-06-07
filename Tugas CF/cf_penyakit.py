# data penakit
penyakit = {
    'P01' : {'nama':'A','gejala':['G02','G04']},
    'P02' : {'nama':'B','gejala':['G01','G03']},
    'P03' : {'nama':'C','gejala':['G02','G03','G04']},
    'P04' : {'nama':'D','gejala':['G01','G04','G05','G06']}
}

# data gejala penyakit
gejala = {
    'G01' : {'nama':'Pusing','nilai_pakar':0.8},
    'G02' : {'nama':'Keringat dingin','nilai_pakar':0.6},
    'G03' : {'nama':'Menggigil','nilai_pakar':0.5},
    'G04' : {'nama':'Dehidrasi','nilai_pakar':0.2},
    'G05' : {'nama':'Batuk','nilai_pakar':0.5},
    'G06' : {'nama':'Nyeri tenggorokan','nilai_pakar':0.5}
}

# proses hitung nilai CF
def hitung_cf(nilai_gejala,nilai_pakar):
    return round(nilai_gejala*nilai_pakar,3)

# keluhan pasien
gejala_pasien = {
    'G03' : 0.2, # menggigil
    'G04' : 0.4, # dehidrasi
    'G01' : 0.5, # dehidrasi
    'G05' : 0.8, # dehidrasi
    'G02' : 0.3, # dehidrasi
}

# perhitungan cf
hasil_penyakit = {}

for kode_penyakit in penyakit.keys():
  gejala_penyakit = penyakit[kode_penyakit]['gejala']
  cf_penyakit = []

  for kode_gejala in gejala_penyakit:
    if kode_gejala in gejala_pasien and gejala_pasien[kode_gejala]:
      nilai_gejala = gejala_pasien[kode_gejala]
      nilai_pakar = gejala[kode_gejala]['nilai_pakar']
      cf_gejala = hitung_cf(nilai_gejala, nilai_pakar)
      cf_penyakit.append(cf_gejala)

  cf_hasil = cf_penyakit[0]
  for i in range(1, len(cf_penyakit)):
    cf_hasil = cf_hasil + cf_penyakit[i] * (1 - cf_hasil)

  hasil_penyakit[kode_penyakit] = cf_hasil

#tampilkan hasil

hasil_penyakit = sorted(hasil_penyakit.items(), key=lambda x: x[1], reverse=True)
for kode_penyakit, cf in hasil_penyakit:
  nama_penyakit = penyakit[kode_penyakit]['nama']
  print(f'Penyakit {nama_penyakit} = {cf * 100:.2f}%')
