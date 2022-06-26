import 'package:api_dio_kullnimi/dio_client.dart';
import 'package:flutter/material.dart';

import '../model/data.dart';
import '../model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioClient _client = DioClient();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Info"),
      ),
      body: Center(
        child: FutureBuilder<User?>(
          future: _client.getUser(id: "1"),
          builder: (context,snapshot){
            if (snapshot.hasData) {
              User? userInfo = snapshot.data;
              if (userInfo != null) {
                Data userData = userInfo.data;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(userData.avatar),
                    SizedBox(height:8.0,),
                    Text("${userInfo.data.firstName} ${userInfo.data.lastName}",
                    style: TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      userData.email,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                );
                
              }
              
            }
            return CircularProgressIndicator();


          },
        ),
      ),
      
    );
  }
}