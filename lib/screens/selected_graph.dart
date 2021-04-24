import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/services/auth.dart';
class SelectedGraph extends StatefulWidget {
  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<SelectedGraph> {
  AuthBase authBase = AuthBase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Row(
          children: [
            Padding(padding: const EdgeInsets.only(
              left: 30,
            ),
              child: Text('Selected Graph'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 100,
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
    );
  }
}
