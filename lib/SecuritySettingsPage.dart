import 'package:flutter/material.dart';
import 'ChangePasswordPage.dart';
import 'TwoFactorAuthPage.dart';

class SecuritySettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres de Sécurité'),
        backgroundColor: Color.fromARGB(255, 177, 124, 56),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Paramètres de Sécurité',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Changer de Mot de Passe'),
              onTap: () {
                // Naviguez vers la page de changement de mot de passe
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePasswordPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Authentification à Deux Facteurs'),
              onTap: () {
                // Naviguez vers la page d'authentification à deux facteurs
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TwoFactorAuthPage()),
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text('Supprimer le Compte'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmation de Suppression du Compte'),
                      content: Text(
                          'Êtes-vous sûr de vouloir supprimer votre compte ?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            // Mettez en œuvre la logique pour supprimer le compte ici
                            Navigator.of(context)
                                .pop(); // Ferme la boîte de dialogue
                          },
                          child: Text(
                            'Confirmer',
                            style: TextStyle(
                              color: Colors
                                  .green, // Définissez la couleur du texte en vert.
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pop(); // Ferme la boîte de dialogue
                          },
                          child: Text(
                            'Annuler',
                            style: TextStyle(
                              color: Colors
                                  .red, // Définissez la couleur du texte en vert.
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
