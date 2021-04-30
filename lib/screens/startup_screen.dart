import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';

class StartupScreen extends StatelessWidget {
  AuthBase authBase = AuthBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 280,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 40
                ),
                child: FlatButton(
                  height: 20,
                  minWidth: 20,
                  color: Colors.white,
                  onPressed: () async {
                    await authBase.logout();
                    Navigator.of(context).pushReplacementNamed('login');
                  },
                  child:Row(
                    children:<Widget>[
                      Icon(Icons.logout,color: Colors.black,size: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: <Widget>[
        Stack(
        children: <Widget>[
        Container(
        height: MediaQuery.of(context).size.height * 0.56,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Hero(
              tag: 'logoAnimation',
              child: Image.asset('assets/images/ECS logo1.jpg',
               height: 220,
                width: double.infinity,

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50
              ),
              child: Text('EdgeCloudSim is another fork from CloudSim, mainly focused on Edge computing, '
                  'this tool covers different aspects of modeling, including network modeling '
                  ', computational modeling, and Fog specific modeling (mobility, offloading,'
                  ' orchestration).',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            ),

          ],
        ),
      ),
      ],
    ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 120,
                      bottom: 10
                    ),
                    child: Text('Edit Simulator',
                       style: TextStyle(
                          color:Colors.blue,
                          fontSize: 27,
                          height: 3,
                          fontWeight: FontWeight.w500,
                    ),
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                width: 300,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.of(context).pushNamed('graphical');

                  },
                  child: Text('Graphically' ,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ) ,
                  ),
                ),
              ),
              //all is for the button
              Text(''),
              SizedBox(
                height: 60,
                width: 300,
                child: RaisedButton(
                  color: Colors.blue,
                  onPressed: (){
                    Navigator.of(context).pushNamed('manually');
                  },
                  child: Text('Manually' ,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ) ,),
                ),
              ),
            ],
        ),
      ),
    );
  }
}