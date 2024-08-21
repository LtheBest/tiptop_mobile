import 'package:flutter/material.dart';
import 'SecuritySettingsPage.dart';
import 'RemarquesPage.dart';
import 'ReportProblemPage.dart';
import 'auth_page.dart'; 
import 'info_perso.dart'; 


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Remplacez les valeurs factices par les données de l'utilisateur connecté
    final String firstName = 'John';
    final String lastName = 'Doe';
    const String profileImage =
        'images/po_1.jpg'; // Chemin vers l'image de profil

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 177, 124, 56),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(profileImage),
              radius: 30,
            ),
            title: Text('$firstName $lastName'),
            subtitle: Text('Connecté en tant que'),
          ),
          ListTile(
            title: Text('Paramètres'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Naviguer vers la page des paramètres
            },
          ),
          Divider(),
          ListTile(
            title: Text('Informations personnelles'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      InfoPersoPage(), // Navigation vers la page d'informations personnelles
                ),
              );
            },
          ),
          
          ListTile(
            title: Text('Connexion et sécurité'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SecuritySettingsPage(), // Navigation vers la page d'informations personnelles
                ),
              );
              //LoginPage()
              // Naviguer vers la page de connexion et sécurité
            },
          ),
          Divider(),
          ListTile(
            title: const Text('Signaler un problème'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ReportProblemPage(), // Navigation vers la page d'informations personnelles
                ),
              );
              //ReportProblemPage()
              // Naviguer vers la page de signalement des problèmes
            },
          ),
          ListTile(
            title: const Text('Vos remarques'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RemarquesPage(), // Navigation vers la page d'informations personnelles
                ),
              );
              // Naviguer vers la page de remarques
            },
          ),
          ListTile(
            title: const Text('Déconnexion'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const AuthPage(), // Navigation vers la page d'authentification
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
