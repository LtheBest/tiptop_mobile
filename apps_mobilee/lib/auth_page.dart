import 'package:flutter/material.dart';
import 'login_page.dart';
import 'inscription_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isHoveringConnexion = false;
  bool isHoveringInscription = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentification'),
        backgroundColor: Color.fromARGB(255, 177, 124, 56),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/po_2.jpg'), // Chemin vers l'image de fond
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHoveringConnexion = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHoveringConnexion = false;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isHoveringConnexion ? Colors.black : Color.fromARGB(255, 177, 124, 56),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      if (isHoveringConnexion)
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text(
                      'Connexion',
                      style: TextStyle(
                        color: isHoveringConnexion ? Color.fromARGB(255, 177, 124, 56) : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHoveringInscription = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHoveringInscription = false;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: isHoveringInscription ? Colors.black : Color.fromARGB(255, 177, 124, 56),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      if (isHoveringInscription)
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InscriptionPage()),
                      );
                      // Action lors du clic sur le bouton d'inscription
                    },
                    child: Text(
                      'Inscription',
                      style: TextStyle(
                        color: isHoveringInscription ? Color.fromARGB(255, 177, 124, 56) : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
