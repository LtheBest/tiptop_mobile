import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class RoulettePage extends StatefulWidget {
  const RoulettePage({Key? key}) : super(key: key);

  @override
  State<RoulettePage> createState() => _RoulettePageState();
}

class _RoulettePageState extends State<RoulettePage> {
  // StreamController to manage selected items
  StreamController<int> selected = StreamController<int>();
  final TextEditingController _ticketNumberController = TextEditingController();
  String? _errorMessage;

  // Updated list of prizes
  final List<String> _prizes = [
    'Infuseur à Thé',
    'Thé détox',
    'Thé signature',
    'Coffret D mini',
    'Coffret D max',
  ];

  @override
  void dispose() {
    selected.close();
    _ticketNumberController.dispose();
    super.dispose();
  }

  // Function to validate ticket
  bool _isTicketValid(String ticket) {
    final RegExp regex = RegExp(r'^ticket_\d+$');
    return regex.hasMatch(ticket);
  }

  // Function to spin the wheel
  void _spinRoulette() {
    final ticketNumber = _ticketNumberController.text;
    if (_isTicketValid(ticketNumber)) {
      // Spin to a random index
      selected.add(Fortune.randomInt(0, _prizes.length));
      setState(() {
        _errorMessage = null;
      });
    } else {
      setState(() {
        _errorMessage =
            'Veuillez entrer un numéro de ticket valide (ex: ticket_1).';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JEUX CONCOURS'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Fortune wheel
              GestureDetector(
                onTap: _spinRoulette,
                child: Column(
                  children: [
                    Container(
                      width: 260,
                      height: 260,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              const Color(0xFF050505), // Couleur de la bordure
                          width: 5.0, // Épaisseur de la bordure
                        ),
                        borderRadius:
                            BorderRadius.circular(130), // Arrondissement
                      ),
                      child: FortuneWheel(
                        selected: selected.stream,
                        items: [
                          for (var prize in _prizes)
                            FortuneItem(
                              child: Text(
                                prize,
                                style: const TextStyle(
                                  fontSize: 12, // Size of the text
                                  color: Colors.white,
                                ),
                              ),
                              style: FortuneItemStyle(
                                color: prize == 'Coffret D mini' ||
                                        prize == 'Thé détox'
                                    ? const Color(0xFF99a76c) // Couleur verte
                                    : const Color(0xFF3e3e3e), // Couleur noire
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Appuyez sur la roue pour jouer',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: _ticketNumberController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Numéro du ticket',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(height: 10),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _spinRoulette,
                child: const Text('Jouer'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => selected.add(
            Fortune.randomInt(0, _prizes.length)), // Reset for demonstration
        child: const Icon(Icons.refresh_rounded),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: RoulettePage()));
}
