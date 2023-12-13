import 'package:flutter/material.dart';
import 'reservation_page.dart'; // Sesuaikan dengan path file ReservationPage

class CafeItemWidget extends StatelessWidget {
  final String nama;
  final String kategori;
  final double rating;
  final bool bisaDipesan;

  CafeItemWidget({
    required this.nama,
    required this.kategori,
    required this.rating,
    required this.bisaDipesan,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          // Tambahkan widget untuk menampilkan gambar kafe di sini
          backgroundColor: Colors.grey,
          radius: 30,
        ),
        title: Text(nama),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kategori: $kategori'),
            Text('Rating: $rating'),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: bisaDipesan
              ? () {
                  // Navigasi ke halaman pemesanan ketika tombol pesan ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReservationPage()),
                  );
                }
              : null,
          child: Text(bisaDipesan ? 'Pesan' : 'Tidak Tersedia'),
        ),
      ),
    );
  }
}
