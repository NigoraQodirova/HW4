import 'package:flutter/material.dart';
import 'package:hw4/db_helper.dart';

class DatabaseListScreen extends StatefulWidget {
  const DatabaseListScreen({super.key});

  @override
  _DatabaseListScreenState createState() => _DatabaseListScreenState();
}

class _DatabaseListScreenState extends State<DatabaseListScreen> {
  final dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> userList = [];

  Future<void> _fetchUsersFromDB() async {
    final users = await dbHelper.getAllUsers();

    setState(() {
      userList = users;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUsersFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database List'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return ListTile(
            title: Text('${user['firstName']} ${user['lastName']}'),
            subtitle: Text('${user['email']}'),
          );
        },
      ),
    );
  }
}
