import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
class EditPasswprd extends StatefulWidget {
  @override
  _EditPasswprdState createState() => _EditPasswprdState();
}

class _EditPasswprdState extends State<EditPasswprd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color:Colors.white,
        ),
        backgroundColor: Color(0xFF77A5CD),
        title: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                  left: 230,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 40
                  ),
                  child: new IconButton(
                    icon: new Icon(Icons.home_sharp,color: Colors.white,),
                    onPressed: () {   Navigator.of(context).pushNamed('graphical');
                    },
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
