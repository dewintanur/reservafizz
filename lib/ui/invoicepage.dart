import 'package:flutter/material.dart';
import 'reservation_page.dart';
import 'paymentsuccesspage.dart';

class InvoicePage extends StatelessWidget {
  final String invoiceNumber;
  final String customerName; // Gunakan data pelanggan (username login)
  final String cafeName;
  final DateTime orderDate;
  final TimeOfDay orderTime;
  final int tableNumber;
  final int numberOfPeople;
  final double totalPayment;

  // Tambahkan parameter data pelanggan
  InvoicePage({
    required this.invoiceNumber,
    required this.customerName,
    required this.cafeName,
    required this.orderDate,
    required this.orderTime,
    required this.tableNumber,
    required this.numberOfPeople,
    required this.totalPayment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              elevation: 3,
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nomor Invoice: $invoiceNumber',
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                        'Pemesan: $customerName'), // Gunakan data pelanggan (username login)
                    Text('Nama Cafe: $cafeName'),
                    Text('Tanggal Pemesanan: ${orderDate.toLocal()}'
                        .split(' ')[0]),
                    Text('Waktu Pemesanan: ${orderTime.format(context)}'),
                    Text('Nomor Meja: $tableNumber'),
                    Text('Jumlah Orang: $numberOfPeople'),
                    SizedBox(height: 16),
                    Text(
                      'Total Pembayaran: \$${totalPayment.toStringAsFixed(2)}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigasi kembali ke halaman utama (MainPage)
                Navigator.pushReplacementNamed(context, '/main');
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 158, 52, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Done',
                style: TextStyle(
                    color: Colors.white), // Atur warna teks menjadi putih
              ),
            ),
          ],
        ),
      ),
    );
  }
}
