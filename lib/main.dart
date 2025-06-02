import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/Stacks/Splash/welcome_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:loginsignup/Stacks/User/Pages/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://nkcrjblsahkbzguklfvu.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5rY3JqYmxzYWhrYnpndWtsZnZ1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU0Njc2NjAsImV4cCI6MjA2MTA0MzY2MH0.uA7JPnTSM3mPfGKEbbfQ2c7yBj1bYXj41_CzycpdrXA',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final session = Supabase.instance.client.auth.currentSession;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: session == null ? const WelcomeScreen() : const BottomNavScreen(),
      // home: BottomNavScreen(),
    );
  }
}


class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(), // Main screen
    const Center(child: Text('Shop', style: TextStyle(fontSize: 20, color: Colors.white))),
    const Center(child: Text('Bag', style: TextStyle(fontSize: 20, color: Colors.white))),
    const Center(child: Text('Favorites', style: TextStyle(fontSize: 20, color: Colors.white))),
    const Center(child: Text('Profile', style: TextStyle(fontSize: 20, color: Colors.white))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.shopify_rounded), label: "Bag"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorites"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: "Profile"),
        ],
      ),
    );
  }
}
