
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'call_page.dart';

class HomePage extends StatelessWidget {

  final TextEditingController callIDController = TextEditingController();

  HomePage({super.key});

  void _startVideoCall(BuildContext context) {
    final callID = callIDController.text.trim();
    if(callID.isEmpty){
      ScaffoldMessenger.of(context,
      ).showSnackBar(SnackBar(content: Text("Please enter a call ID")));
      return;
    }
    
    saveCallID(callID);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) {
            return CallPage(callID: callID);
          }
      ),
    );
  }

  Future<void> saveCallID(String id) async {
   final prefs = await SharedPreferences.getInstance();
   final existing = prefs.getStringList('savedCallIDs') ?? [];
   if(!existing.contains(id)){
     existing.add(id);
     await prefs.setStringList('savedCallIDs', existing);
   }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chatting App"),
       centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Enter Call ID",style: TextStyle(fontSize: 20),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: callIDController,
                  decoration: InputDecoration(
                    hintText: "Enter Call ID",
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                    )
                  ),
                ),
              ),
                 SizedBox(height: 16,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.video_call),
                label:Text("Start Video Call"),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12)
                  )
                ),
                  onPressed: () => _startVideoCall(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
