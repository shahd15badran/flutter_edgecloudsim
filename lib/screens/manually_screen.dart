import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';

class ManuallyScreen extends StatelessWidget {
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
                left: 270,
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
                  height: MediaQuery.of(context).size.height * 0.5,
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
                      SizedBox(height: 60),
                      Text(''),
                      Text('Select The File You Want To Edit:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(''),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: OriginalButton(
                            text: 'applications.xml',
                            color: Colors.white,
                            textColor: Colors.lightBlue,
                            onPressed: () {
                              Navigator.of(context).pushNamed('app xml');
                            },
                          ),

                        ),
                      ),
                      Text(''),
                      SizedBox(
                        child: Padding(

                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: OriginalButton(
                            text: 'default_config.properties',
                            color: Colors.white,
                            textColor: Colors.lightBlue,
                            onPressed: () {
                              Navigator.of(context).pushNamed('default_config_file');
                            },
                          ),

                        ),
                      ),
                      Text(''),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: OriginalButton(
                            text: 'edge_devices.xml',
                            color: Colors.white,
                            textColor: Colors.lightBlue,
                            onPressed: () {
                              Navigator.of(context).pushNamed('edge xml');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(''),Text(''),
            Column(
              children: [
            SizedBox(
              height: 100,
              child: TextFormField(
                minLines: 5,
              keyboardType: TextInputType.multiline,maxLines: null,
              decoration: InputDecoration(
              labelText: 'Response from server :',


              ),
              ),
            ),
              ],
            ),
            //all is for the button
            Text(''),Text(''),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.blue,
                onPressed: (){
                  Navigator.of(context).pushNamed('simulation');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
                child: Text('Continue' ,
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