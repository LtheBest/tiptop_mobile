import 'package:flutter/material.dart';
import 'inscription_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
        backgroundColor: Color.fromARGB(255, 243, 166, 33),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: 'Entrez votre email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Mot de passe',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Entrez votre mot de passe',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Action lors du clic sur "Mot de passe oublié"
                  },
                  child: const Text(
                    'Mot de passe oublié',
                    style: TextStyle(
                      color: Color.fromARGB(255, 243, 166, 33),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Naviguer vers la page d'inscription
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InscriptionPage()),
                    );
                  },
                  child: const Text(
                    "S'inscrire",
                    style: TextStyle(
                      color: Color.fromARGB(255, 33, 96, 243),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action lors du clic sur le bouton de connexion
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 243, 166, 33),
                  ),
                  child: const Text('Connexion'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
