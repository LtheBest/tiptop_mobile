import 'package:flutter/material.dart';

class InfoPersoPage extends StatefulWidget {
  const InfoPersoPage({Key? key}) : super(key: key);

  @override
  _InfoPersoPageState createState() => _InfoPersoPageState();
}

class _InfoPersoPageState extends State<InfoPersoPage> {
  bool isEditingName = false;
  bool isEditingFirstName = false;
  bool isEditingPassword = false;
  bool showPassword = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String updatedName = ''; // Variable pour stocker le nom modifié
  String updatedFirstName = ''; // Variable pour stocker le prénom modifié
  String updatedPassword = ''; // Variable pour stocker le mot de passe modifié

  @override
  void dispose() {
    nameController.dispose();
    firstNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String currentName = 'John'; // Remplacez par la valeur réelle
    String currentFirstName = 'Doe'; // Remplacez par la valeur réelle
    String currentPassword = '********'; // Remplacez par la valeur réelle

    return Scaffold(
      appBar: AppBar(
        title: Text('Informations personnelles'),
        backgroundColor: Color.fromARGB(255, 177, 124, 56),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Nom:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            isEditingName
                ? TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Entrez votre nom',
                    ),
                    onChanged: (value) {
                      updatedName = value;
                    },
                    style: TextStyle(
                      color: isEditingName ? Color.fromARGB(255, 177, 124, 56) : Colors.black,
                    ),
                  )
                : Text(
                    updatedName.isNotEmpty ? updatedName : currentName,
                    style: TextStyle(
                      fontSize: 16,
                      color: isEditingName ? Color.fromARGB(255, 177, 124, 56) : Colors.black,
                    ),
                  ),
            SizedBox(height: 16),
            const Text(
              'Prénom:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            isEditingFirstName
                ? TextFormField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Entrez votre prénom',
                    ),
                    onChanged: (value) {
                      updatedFirstName = value;
                    },
                    style: TextStyle(
                      color: isEditingFirstName ? Color.fromARGB(255, 177, 124, 56) : Colors.black,
                    ),
                  )
                : Text(
                    updatedFirstName.isNotEmpty ? updatedFirstName : currentFirstName,
                    style: TextStyle(
                      fontSize: 16,
                      color: isEditingFirstName ? Color.fromARGB(255, 177, 124, 56) : Colors.black,
                    ),
                  ),
            SizedBox(height: 16),
            const Text(
              'Mot de passe:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            isEditingPassword
                ? Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextFormField(
                        controller: passwordController,
                        obscureText: !showPassword,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Entrez votre mot de passe',
                        ),
                        onChanged: (value) {
                          updatedPassword = value;
                        },
                        style: TextStyle(
                          color: isEditingPassword ? Color.fromARGB(255, 177, 124, 56) : Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          showPassword ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                      ),
                    ],
                  )
                : Text(
                    updatedPassword.isNotEmpty ? updatedPassword : currentPassword,
                    style: TextStyle(
                      fontSize: 16,
                      color: isEditingPassword ? Color.fromARGB(255, 177, 124, 56) : Colors.black,
                    ),
                  ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isEditingName || isEditingFirstName || isEditingPassword
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentName = updatedName.isNotEmpty ? updatedName : currentName;
                            currentFirstName = updatedFirstName.isNotEmpty ? updatedFirstName : currentFirstName;
                            currentPassword = updatedPassword.isNotEmpty ? updatedPassword : currentPassword;
                            isEditingName = false;
                            isEditingFirstName = false;
                            isEditingPassword = false;
                            updatedName = '';
                            updatedFirstName = '';
                            updatedPassword = '';
                          });
                          _showSnackBar(context, 'Informations personnelles mises à jour');
                        },
                        child: Text('Enregistrer'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 177, 124, 56),
                          ),
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isEditingName = true;
                            isEditingFirstName = true;
                            isEditingPassword = true;
                            nameController.text = currentName;
                            firstNameController.text = currentFirstName;
                            passwordController.text = currentPassword;
                          });
                        },
                        child: Text('Modifier'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 177, 124, 56),
                          ),
                        ),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
