import 'package:flutter/material.dart';
import 'login_page.dart'; // Import file LoginPage
import 'registrasi_page.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Nama Aplikasi
              Text(
                'Reservafiz',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 124, 33, 5),
                ),
              ),
              SizedBox(height: 32),
              // Tombol Login
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman login
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 139, 69, 19),
                  minimumSize: Size(200, 50),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              // Tombol Create Account
              OutlinedButton(
                onPressed: () {
                  // Arahkan ke halaman RegistrasiPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrasiPage()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color.fromARGB(255, 139, 101, 8)),
                  minimumSize: Size(200, 50),
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
