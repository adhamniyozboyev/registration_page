import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}git 

class _MyAppState extends State<MyApp> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _saffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text(
                'Contact us',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  expands: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp('[0-9]'))
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter correct name';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Your name',
                      suffixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter correct email';
                    } else
                      return null;
                  },
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.email),
                      labelText: 'Email Adress',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Enter correct name';
                  //   } else
                  //     return null;
                  // },
                  style: TextStyle(fontSize: 40),
                  decoration: InputDecoration(
                      labelText: 'Your message',
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      fixedSize: Size(360, 45),
                      backgroundColor: Colors.blue),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final snackBar =
                          SnackBar(content: Text('Correct informations'));
                    }
                  },
                  child: Text('Send message'))
            ],
          ),
        ),
      ),
    );
  }
}
