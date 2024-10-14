import 'package:flutter/material.dart';
import 'package:troc_bay_v3/page/listTroc.dart';
import 'market.dart';
import 'discussion.dart';
import 'favorite.dart';
import 'home.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key, required this.currUser}) : super(key: key);
  final Future<Map<String, dynamic>> currUser;

  @override
  State<NavPage> createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

    List<StatefulWidget> _screens = [
      Home(
        currUser: widget.currUser,
      ),
      Market(),
      Fav(
        currUser: widget.currUser,
      ),
      ListTroc(
        currUser: widget.currUser,
      ),
      Discussion()
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      //Bar de titre en au de l'application (à modifier)
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favori',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            label: 'Mes Trocs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),
    );
  }
}
