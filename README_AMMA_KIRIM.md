# PADANG EXPRESS – CI4

Versi upgrade bergaya aplikasi on-demand untuk jasa pengiriman.

## Fitur
- Customer booking pickup & tujuan
- Peta Leaflet/OpenStreetMap, geocoding Nominatim, routing OSRM
- Estimasi jarak, tarif Motor/Mobil, berat, estimasi waktu
- Pencarian kurir terdekat berdasarkan lokasi terakhir
- Profil/foto kurir, rating, kendaraan, plat nomor
- Live location kurir berbasis browser Geolocation + polling tracking
- Chat customer-kurir berbasis AJAX polling
- Status order dan tracking
- Admin dashboard, kurir management, assignment
- MySQL database, siap dipindah ke shared hosting/VPS

## Database
`jasa_kirim_amma` dari `database.sql`.

## Demo
admin / admin123
pelanggan / pelanggan123
kurir / kurir123

## Run
1. Extract ke C:\xampp\htdocs\AMMA_KIRIM
2. Import database.sql
3. Pastikan .env database sesuai
4. `php spark serve` atau arahkan DocumentRoot hosting ke folder `public/`.
5. Untuk fitur lokasi browser, gunakan HTTPS saat online.

Catatan: chat real-time menggunakan polling AJAX agar kompatibel dengan shared hosting tanpa WebSocket.
