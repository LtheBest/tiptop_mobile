import 'package:flutter/material.dart';

class RemarquesPage extends StatelessWidget {
  final TextEditingController remarksController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remarques'),
        backgroundColor: Color.fromARGB(255, 177, 124, 56),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Laissez vos remarques',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: remarksController,
              maxLines:
                  5, // Vous pouvez ajuster le nombre de lignes selon vos besoins
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Saisissez vos remarques ici...',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Vous pouvez utiliser les données saisies ici, par exemple :
                final remarks = remarksController.text;
                // Faites quelque chose avec les remarques, par exemple, les afficher.
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Remarques Enregistrées'),
                      content: Text('Vos remarques sont : $remarks'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
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
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'annuller',
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
              child: Text('Enregistrer'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 177, 124, 56),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
