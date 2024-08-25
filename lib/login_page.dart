import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'inscription_page.dart';
import 'roulette_page.dart'; // Importez votre page Roulette ici

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final Dio _dio = Dio();
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  String _email = '';
  String _password = '';
  String? _errorMessage;
  Map<String, String?> _errors = {};

  Future<void> _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        final response = await _dio.post(
          'http://localhost:8000/login',
          data: {'email': _email, 'password': _password},
        );

        String token = response.data['token'];
        await _storage.write(key: 'token', value: token);

        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

        if (decodedToken['category'] == 1) {
          Navigator.pushReplacementNamed(context, '/admin');
        } else if (decodedToken['category'] == 3) {
          Navigator.pushReplacementNamed(context, '/employee');
        } else {
          // Redirection vers la page Roulette
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => RoulettePage()),
          );
        }
      } catch (e) {
        if (e is DioError && e.response != null) {
          print(e
              .response?.data); // Affichez la réponse complète pour le débogage

          setState(() {
            // Si le serveur retourne un message d'erreur
            _errorMessage = e.response?.data['message'] ??
                'Une erreur s\'est produite. Veuillez réessayer.';
            _errors =
                {}; // Réinitialise les erreurs spécifiques aux champs si nécessaire
          });
        } else {
          setState(() {
            _errorMessage = 'Une erreur s\'est produite. Veuillez réessayer.';
          });
        }
      }
    }
  }

  void _handleChange(String value, String field) {
    setState(() {
      if (field == 'email') {
        _email = value;
      } else if (field == 'password') {
        _password = value;
      }
      _errors[field] = null;
      _errorMessage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
        backgroundColor: const Color.fromARGB(255, 243, 166, 33),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
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
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Entrez votre email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorText: _errors['email'],
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) => _handleChange(value, 'email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "L'email est obligatoire.";
                  }
                  return null;
                },
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
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  hintText: 'Entrez votre mot de passe',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorText: _errors['password'],
                ),
                onChanged: (value) => _handleChange(value, 'password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Le mot de passe est obligatoire.";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
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
                          builder: (context) => InscriptionPage(),
                        ),
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
                    onPressed: _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 243, 166, 33),
                    ),
                    child: const Text('Connexion'),
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
