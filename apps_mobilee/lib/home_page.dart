import 'package:apps_mobilee/profile_page.dart';
import 'package:flutter/material.dart';
import 'roulette_page.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const RoulettePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.games),
            label: 'Jeux',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> items = const [
    {
      'image': 'images/lot_1.jpeg',
      'title': 'Infuseur de thé',
      'description':
          'Découvrez notre infuseur de thé artisanal, un accessoire indispensable pour tous les amateurs de thé. Conçu pour optimiser la libération des arômes, cet infuseur vous permet de profiter pleinement de chaque tasse de thé bio.',
    },
    {
      'image': 'images/lot_2.jpeg',
      'title': 'Thé détox',
      'description':
          'Faites une pause bien-être avec notre thé détox bio, spécialement élaboré pour purifier et revitaliser votre corps. Composé d\'ingrédients naturels et biologiques, ce thé détox est parfait pour ceux qui cherchent à allier plaisir et santé.',
    },
    {
      'image': 'images/lot_3.jpeg',
      'title': 'Thé signature',
      'description':
          'Découvrez l\'authenticité et le raffinement avec notre thé signature. Chaque mélange signature est le fruit de notre savoir-faire artisanal et de notre passion pour le thé bio.',
    },
    {
      'image': 'images/lot_4.jpg',
      'title': 'Coffret découverte',
      'description':
          'Explorez l\'univers riche et varié de Thé Tip Top avec notre coffret découverte. Ce coffret contient une sélection de nos meilleurs thés bios, y compris des thés détox, des infusions, et des mélanges signature.',
    },
  ];

  // Contrôleur pour le champ de saisie
  final TextEditingController _searchController = TextEditingController();

  // Liste filtrée des éléments
  List<Map<String, String>> _filteredItems = [];

  // Animation controller for the "JOUER" button
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _filteredItems = items; // Initialisation avec tous les éléments

    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _filterItems(String query) {
    if (query.isEmpty) {
      setState(() {
        _filteredItems =
            items; // Réinitialise à tous les éléments si la requête est vide
      });
    } else {
      setState(() {
        _filteredItems = items
            .where((item) =>
                item['title']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          // Espace au-dessus du titre
          const SizedBox(height: 40),

          // Titre de la section
          Text(
            'LOTS A GAGNER',
            style: GoogleFonts.nunito(
              color: Color.fromARGB(255, 243, 166, 33),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Champ de saisie pour la recherche
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: _filterItems,
                    decoration: InputDecoration(
                      hintText: 'Recherche...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            30), // Arrondi du champ de saisie
                        borderSide: const BorderSide(),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          _filterItems(_searchController.text);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Icône de filtre en dessous du champ de recherche
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Animation pour le bouton "JOUER"
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RoulettePage()),
                  );
                },
                child: ScaleTransition(
                  scale: _animation,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.arrow_downward,
                        color: Color.fromARGB(255, 243, 33, 33),
                        size: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 243, 166, 33),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'JOUER',
                          style: GoogleFonts.nunito(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Icône de filtre avec animation
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      // Implémentez votre logique de filtre ici
                      // Cela peut ouvrir un dialogue ou une nouvelle page
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          // Liste des éléments
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                return HomeCard(_filteredItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final Map<String, String> itemData;

  const HomeCard(this.itemData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Ici, vous pouvez naviguer vers une page de détails
        // Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(itemData)));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 230,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 4,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
                image: DecorationImage(
                  image: AssetImage(itemData['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    itemData['title']!,
                    style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  // Ajoutez éventuellement un prix ici si vous en avez
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                itemData['description']!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
