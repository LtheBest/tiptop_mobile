import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String? _oldPassword;
  String? _newPassword;
  String? _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Changer de Mot de Passe'),
        backgroundColor: Color.fromARGB(255, 177, 124, 56),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Ancien Mot de Passe'),
                obscureText: true,
                validator: (value) {
                  // Ajoutez ici la logique de validation pour l'ancien mot de passe
                },
                onSaved: (value) {
                  _oldPassword = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nouveau Mot de Passe'),
                obscureText: true,
                validator: (value) {
                  // Ajoutez ici la logique de validation pour le nouveau mot de passe
                },
                onSaved: (value) {
                  _newPassword = value;
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Confirmer le Mot de Passe'),
                obscureText: true,
                validator: (value) {
                  // Ajoutez ici la logique de validation pour la confirmation du mot de passe
                },
                onSaved: (value) {
                  _confirmPassword = value;
                },
              ),
              Column(
                children: [
                  SizedBox(height: 16.0), // Espace vertical
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        // Logique pour vérifier et mettre à jour le mot de passe
                      }
                    },
                    child: Text('Enregistrer'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 177, 124, 56),), // Couleur du bouton
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
