import 'package:flutter/material.dart';
import 'settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _currentIndex == 0
          ? HomeScreen(counter: _counter) // Pass counter here
          : const SettingPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.thumb_up),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final int counter;

  const HomeScreen(
      {super.key, required this.counter}); // Use required constructor

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Avatar image
          CircleAvatar(
            radius: 40, // Adjust the radius as needed
            backgroundColor:
                Colors.blue, // Optional: You can set a background color
            child: Icon(
              Icons.person, // Use the person icon
              size: 50, // Adjust size as needed
              color: Colors.white, // Set the icon color
            ),
          ),
          const SizedBox(height: 20),
          // Text with the title
          Align(
            alignment: Alignment.center, // Aligns the child to the center
            child: const Text(
              'Like and Share',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),

          const SizedBox(height: 10),

          // Display counter with a styled text
          Text(
            '$counter',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.blueAccent, // Customize the color
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
          ),
          const SizedBox(height: 30),

          // Row with two icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up, size: 30),
                onPressed: () {
                  // You can add functionality here
                },
                color: Colors.blueAccent,
              ),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.share, size: 30),
                onPressed: () {
                  // You can add functionality here
                },
                color: Colors.blueAccent,
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
