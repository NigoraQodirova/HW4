import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hw4/db_helper.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  _UserListScreenState createState() {
    return _UserListScreenState();
  }
}

class _UserListScreenState extends State<UserListScreen> {
  List<Map<String, dynamic>> userList = [];
  final dbHelper = DatabaseHelper();

  Future<void> _fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://randomuser.me/api/?results=1'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      setState(() {
        userList.addAll(data['results'].cast<Map<String, dynamic>>());
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return ListTile(
            title: Text('${user['name']['first']} ${user['name']['last']}'),
            subtitle: Text('${user['email']}'),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () => _fetchUsers(),
            tooltip: 'Get More Users',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () async {
              await dbHelper.insertUsers(userList);
              userList.clear();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Data is saved to db'),
                ),
              );
            },
            tooltip: 'Store Data',
            child: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
