import 'package:flutter/material.dart';

class TwoFactorAuthPage extends StatefulWidget {
  @override
  _TwoFactorAuthPageState createState() => _TwoFactorAuthPageState();
}

class _TwoFactorAuthPageState extends State<TwoFactorAuthPage> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentification à Deux Facteurs'),
        backgroundColor: Color.fromARGB(255, 177, 124, 56),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Options d\'Authentification à Deux Facteurs',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            RadioListTile(
              title: Text('Texto ou SMS'),
              value: 'Texto ou SMS',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                  // Mettez en œuvre la logique pour gérer la sélection de l'option
                });
              },
               activeColor: Color.fromARGB(255, 177, 124, 56),
            ),
            RadioListTile(
              title: Text('Email'),
              value: 'Email',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                  // Mettez en œuvre la logique pour gérer la sélection de l'option
                });
              },
               activeColor: Color.fromARGB(255, 177, 124, 56),
            ),
            
            RadioListTile(
              title: Text('Clé Sécurisée'),
              value: 'Clé Sécurisée',
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value;
                  // Mettez en œuvre la logique pour gérer la sélection de l'option
                });
              },
               activeColor: Color.fromARGB(255, 177, 124, 56),
            ),
          ],
        ),
      ),
    );
  }
}
