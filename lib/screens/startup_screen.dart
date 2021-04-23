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
                left: 325,
              ),
              child: FlatButton(
                height: 20,
                minWidth: 20,
                color: Colors.blue,
                onPressed: () async {
                  await authBase.logout();
                  Navigator.of(context).pushReplacementNamed('login');
                },
                child:Row(
                  children:<Widget>[
                    Icon(Icons.logout,color: Colors.white,size: 20),
                  ],
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
        height: MediaQuery.of(context).size.height * 0.57,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(30),

          ),
        ),
      ),
      Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Hero(
              tag: 'logoAnimation',
              child: Image.asset(
                'assets/images/ECS logo1.jpg',
               height: 180,
                width: double.infinity,

              ),
            ),
            Text(''),
            Text('EdgeCloudSim is another fork from CloudSim, mainly focused on Edge computing .'
                ' This tool covers different aspects of modeling, including network modeling '
                ', computational modeling , and Fog specific modeling (mobility, offloading,'
                ' orchestration).',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),

          ],
        ),
      ),
      ],
    ),
              Column(
                children: [
                  Text('Choose how you want to work:',
                     style: TextStyle(
                        color:Colors.blue,
                        fontSize: 20,
                        height: 3,
                        fontWeight: FontWeight.w800,
                  ),
                    textDirection: TextDirection.ltr,
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Text('Graphical Interface' ,
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)
                  ),
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