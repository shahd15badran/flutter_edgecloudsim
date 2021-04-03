import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
import 'package:flutter_edgecloudsim/widgets/original_button.dart';
class GraphicalScreen extends StatelessWidget {
  AuthBase authBase = AuthBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text('                                                      '),
            FlatButton(
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
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 10.0,
          top: 5.0,
        ),
        child: Container(
          color: Colors.white,
          child: SafeArea(
            child: Column(

              children: [
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                        ),
                        child: Text('Global Cloud',style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.w800,
                        ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 100,
                          left: 30,
                        ),
                        child: Icon(Icons.sync_alt,size: 30),
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: RaisedButton(
                          color: Colors.black12,
                          onPressed: (){
                            Navigator.of(context).pushNamed('global cloud');
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child:Row(
                            children:<Widget>[
                              Icon(Icons.cloud,color: Colors.yellow,size: 28),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                        ),
                        child: Column(
                          children: [
                            Text(''),
                            Text('Internet         ',style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 100,
                          left: 30,
                        ),
                        child: Column(
                          children: [
                            Text(''),
                            Icon(Icons.sync_alt,size: 30),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Icon(Icons.arrow_upward),
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: (){
                                Navigator.of(context).pushNamed('internet');
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              child:Row(
                                children:<Widget>[
                                  Icon(Icons.wifi_sharp,color: Colors.white,size: 28),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[

                      SizedBox(
                        height: 80,
                        width: 80,
                        child: RaisedButton(
                          color: Colors.orangeAccent,
                          onPressed: (){
                            Navigator.of(context).pushNamed('orchestrator');
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child:Row(
                            children:<Widget>[
                              Icon(Icons.settings,color: Colors.black,size: 46),
                            ],
                          ),
                        ),
                      ),
                      Text('          '),
                      Text('Edge Orchestrator',style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.w800,
                      ),
                      ),
                      Column(
                        children: [
                          Icon(Icons.trending_up,size: 50),
                          Icon(Icons.trending_down,size: 50),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                        ),
                        child: Text('Edge Server   ',style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                          fontWeight: FontWeight.w800,
                        ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 100,
                          left: 30,
                        ),
                        child: Icon(Icons.sync_alt,size: 30),
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: RaisedButton(
                          color: Colors.blue,
                          onPressed: (){
                            Navigator.of(context).pushNamed('edge server');
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child:Row(
                            children:<Widget>[
                              Icon(Icons.storage,color: Colors.white,size: 28),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                        ),
                        child: Column(
                          children: [
                            Text(''),
                            Text('AP                    ',style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 100,
                          left: 30,
                        ),
                        child: Column(
                          children: [
                            Text(''),
                            Icon(Icons.sync_alt,size: 30),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Icon(Icons.arrow_downward),
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: (){
                                Navigator.of(context).pushNamed('internet');
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              child:Row(
                                children:<Widget>[
                                  Icon(Icons.wifi_sharp,color: Colors.white,size: 28),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40,
                        ),
                        child: Column(
                          children: [
                            Text(''),
                            Text('Edge Users    ',style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                            ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 100,
                          left: 30,
                        ),
                        child: Column(
                          children: [
                            Text(''),
                            Icon(Icons.sync_alt,size: 30),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Icon(Icons.arrow_downward),
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: (){
                                Navigator.of(context).pushNamed('users');
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)
                              ),
                              child:Row(
                                children:<Widget>[
                                  Icon(Icons.group_add_rounded,color: Colors.white,size: 28),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                          left: 8,
                        ),
                        child: SizedBox(
                          height: 60,
                          width: 240,
                          child: OriginalButton(
                            text:'Continue',
                            textColor: Colors.white,
                            color: Colors.blue,
                            onPressed: (){
                              Navigator.of(context).pushNamed('simulation');
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 50,
                          left: 33,
                        ),
                        child: SizedBox(
                          height: 60,
                          width: 100,
                          child: OriginalButton(
                            text:'Next',
                            textColor: Colors.white,
                            color: Colors.grey,
                            onPressed: (){
                              Navigator.of(context).pushNamed('add application');
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
