import 'package:flutter/material.dart';
import 'package:reservafiz/ui/paymentsuccesspage.dart';
import 'paymentsuccesspage.dart';

class PaymentPage extends StatefulWidget {
  final String cafeName;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final int tableNumber;
  final int numberOfPeople;

  PaymentPage({
    required this.cafeName,
    required this.selectedDate,
    required this.selectedTime,
    required this.tableNumber,
    required this.numberOfPeople,
  });

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  double harga = 10.0;
  double diskon = 2.0;
  double totalPembayaran = 0.0;

  String selectedPaymentMethod = 'Tunai'; // Default selected payment method
  List<String> paymentMethods = [
    'Tunai',
    'Non Tunai'
  ]; // List of payment methods

  @override
  void initState() {
    super.initState();
    // Hitung total pembayaran saat halaman pertama kali dibuat
    totalPembayaran = (harga * widget.numberOfPeople) - diskon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pembayaran'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 241, 235, 231),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Detail Pesanan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Nama Cafe: ${widget.cafeName}',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Text(
                    'Tanggal Pemesanan: ${widget.selectedDate.toLocal()}'
                        .split(' ')[0],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Waktu Pemesanan: ${widget.selectedTime.format(context)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Nomor Meja: ${widget.tableNumber}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Jumlah Orang: ${widget.numberOfPeople}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 239, 240, 239),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Harga: \$${harga.toStringAsFixed(2)} per orang',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Diskon: \$${diskon.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Total Pembayaran: \$${totalPembayaran.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 149, 40),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Metode Pembayaran: Pilih Metode Pembayaran Anda',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  DropdownButton<String>(
                    value: selectedPaymentMethod,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedPaymentMethod = newValue!;
                      });
                    },
                    items: paymentMethods.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Metode Pembayaran Dipilih: $selectedPaymentMethod',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String invoiceNumber = 'INV123456';
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentSuccessPage(
                      invoiceNumber: invoiceNumber,
                      paymentMethod: selectedPaymentMethod,
                      customerName:
                          'John Doe', // Gantilah dengan data pelanggan yang sesuai
                      cafeName: widget.cafeName,
                      orderDate: widget.selectedDate,
                      orderTime: widget.selectedTime,
                      tableNumber: widget.tableNumber,
                      numberOfPeople: widget.numberOfPeople,
                      totalPayment: totalPembayaran,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 224, 100, 51),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Bayar Sekarang',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
