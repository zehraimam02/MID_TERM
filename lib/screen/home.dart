import 'dart:convert';
import 'package:mid_zehraimam_26946/model/launch_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //alias

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Launch> launches = [];

  
  @override
  void initState(){
    super.initState();  
    fetchLaunches();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('Space Missions'),
        backgroundColor: const Color.fromARGB(255, 1, 97, 88),
        foregroundColor: Colors.white,
      ),

      body: ListView.builder(
        itemCount: launches.length, //10
        itemBuilder: (context,index){
          final launch = launches[index];
          return Card (
            elevation: 5, 
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            
            child: ListTile(
              title: Text(launch.missionName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(launch.description),
                  if (launch.payloadIds != null) 
                    // Payloads
                    Text('Payloads: ${launch.payloadIds?.join(", ")}'),
                    
                ],
              ),

            ),
          );
        },
      ),

    );
  }

  Future<void> fetchLaunches() async{

    print('fetchLaunches called');

    const url = 'https://api.spacexdata.com/v3/missions';
    final uri = Uri.parse(url);
    final response = await http.get(uri); // waiting for the response
    
    if (response.statusCode == 200) {
      final body = response.body;
      final List<dynamic> json = jsonDecode(body); //stored in a list because response is a list of missions
    
      final transformed = json.map((e) => Launch.fromJson(e)).toList();
      
      setState(() {
        launches = transformed;
      });

      print('fetchLaunches completed');
    } else {
      print('Failed to load missions');
    }

  }

}