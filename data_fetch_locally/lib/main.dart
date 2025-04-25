import 'package:flutter/material.dart';

class LocalDataPage extends StatefulWidget {
  @override
  _LocalDataPageState createState() => _LocalDataPageState();
}

class _LocalDataPageState extends State<LocalDataPage> {
  List<String>? _items;

  @override
  void initState() {
    super.initState();
    _simulateLocalFetch();
  }

  Future<void> _simulateLocalFetch() async {
    // Simulate a delay of 2 seconds (like fetching from local DB)
    await Future.delayed(Duration(seconds: 2));

    // Simulated fetched data
    setState(() {
      _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Local Data Fetch Simulation'),
        centerTitle: true,
      ),
      body:
          _items == null
              ? _buildLoadingScreen() // Show loading indicator
              : _buildDataList(), // Show data list after delay
    );
  }

  // Loading screen with a spinner and message
  Widget _buildLoadingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text(
            'Fetching data...',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Data list display
  Widget _buildDataList() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: _items!.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(
                _items![index],
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              leading: Icon(Icons.check_circle, color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}
