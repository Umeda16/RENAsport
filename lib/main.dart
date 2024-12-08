import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'menu.dart';
import 'entrainements.dart';
import 'dietetique.dart';
import 'parametres.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Indice de l'onglet actif

  // Liste des pages à afficher
  final List<Widget> _pages = [
    MenuPage(),
    EntrainementsPage(),
    DietetiquePage(),
    ParametresPage(), // La page Paramètres
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 3 // Si l'indice est celui de Paramètres
          ? null // Pas d'AppBar pour la page Paramètres
          : AppBar(
        title: SvgPicture.asset(
          'assets/images/Logo_Light.svg', // Chemin vers l'image SVG
          height: 25, // Hauteur du logo
          width: 25,  // Largeur du logo
        ),
        centerTitle: false, // Garder le logo aligné à gauche
      ),
      body: _pages[_currentIndex], // Affiche la page correspondant à l'onglet actif
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Onglet actif
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Met à jour l'indice actif
          });
        },
        type: BottomNavigationBarType.fixed, // Égalité entre les onglets
        selectedItemColor: Colors.blue, // Couleur de l'onglet sélectionné
        unselectedItemColor: Colors.black87, // Couleur des onglets non sélectionnés
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Entraînements',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_dining),
            label: 'Diététique',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
      ),
    );
  }
}

