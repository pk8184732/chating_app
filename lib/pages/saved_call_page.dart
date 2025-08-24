import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'call_page.dart';

class SavedCallPage extends StatefulWidget {
  const SavedCallPage({super.key});

  @override
  State<SavedCallPage> createState() => _SavedCallPageState();
}

class _SavedCallPageState extends State<SavedCallPage> {
  List<String> savedCallIDs = [];

  @override
  void initState() {
    super.initState();
    _loadSavedCallIDs();
  }

  Future<void> _loadSavedCallIDs() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('savedCallIDs') ?? [];
    setState(() {
      savedCallIDs = saved;
    });
  }

  void _StartCall(BuildContext context, String callID) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return CallPage(callID: callID);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Saved Calls")),
      body: savedCallIDs.isEmpty
          ? Center(child: Text("No saved calls yet."))
          : ListView.builder(
              itemCount: savedCallIDs.length,
              itemBuilder: (_, index) {
                final id = savedCallIDs[index];
                return ListTile(
                  title: Text("Call ID: $id"),
                  leading: Icon(Icons.call),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () => _StartCall(context, id),
                );
              },
            ),
    );
  }
}
