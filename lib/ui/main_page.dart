import 'package:flutter/material.dart';
import 'cafe_item_widget.dart'; // Impor widget CafeItem
import 'reservation_page.dart'; // Sesuaikan dengan path file ReservationPage
import 'homepage.dart'; // Sesuaikan dengan path file HomePage

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kafe'),
        actions: [
          // Button Search
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Tambahkan logika untuk menangani pencarian
              print('Tombol Search ditekan');
            },
          ),
          // Tombol Pesan
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigasi ke halaman pemesanan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReservationPage()),
              );
            },
          ),
          // Tombol Logout
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Tambahkan logika untuk logout
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar atau header di sini
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bgmain.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Header',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Daftar Kafe
            Expanded(
              child: ListView(
                children: [
                  CafeItemWidget(
                    nama: 'Kogu',
                    kategori: 'Aesthetic',
                    rating: 4.5,
                    bisaDipesan: true,
                  ),
                  CafeItemWidget(
                    nama: 'Laff',
                    kategori: 'Cute',
                    rating: 3.8,
                    bisaDipesan: false,
                  ),

                  // Tambahkan item kafe lainnya sesuai kebutuhan
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi logout
  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Anda yakin ingin logout?'),
          actions: <Widget>[
            TextButton(
              child: Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Ya'),
              onPressed: () {
                // Tambahkan logika untuk logout di sini
                Navigator.of(context).pop(); // Tutup dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
