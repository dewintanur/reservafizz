import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'invoicepage.dart'; // Import halaman InvoicePage

class PaymentSuccessPage extends StatelessWidget {
  final String invoiceNumber;
  final String paymentMethod;
  final String customerName;
  final String cafeName;
  final DateTime orderDate;
  final TimeOfDay orderTime;
  final int tableNumber;
  final int numberOfPeople;
  final double totalPayment;

  PaymentSuccessPage({
    required this.invoiceNumber,
    required this.paymentMethod,
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
        title: Text('Pembayaran Berhasil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Pembayaran Berhasil!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Nomor Invoice: $invoiceNumber',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            // Widget untuk menampilkan barcode
            BarcodeWidget(
              barcode: Barcode.qrCode(),
              data: invoiceNumber,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 16),
            Text(
              'Metode Pembayaran: $paymentMethod',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman InvoicePage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InvoicePage(
                      invoiceNumber: invoiceNumber,
                      customerName: customerName,
                      cafeName: cafeName,
                      orderDate: orderDate,
                      orderTime: orderTime,
                      tableNumber: tableNumber,
                      numberOfPeople: numberOfPeople,
                      totalPayment: totalPayment,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 158, 52, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Lihat Invoice',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
