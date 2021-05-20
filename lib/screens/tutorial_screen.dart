import 'package:flutter/material.dart';
import 'package:flutter_edgecloudsim/widgets/NavDrawer.dart';
class TutorialScreen extends StatefulWidget {
  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
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
            Padding(padding: const EdgeInsets.only(
              //left: 10,
            ),
              child: Text('Information',style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                  left: 140,
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
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
           // color: Colors.blueGrey,
            child: Column(
                children: <Widget>[
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text('Introduction'),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(left: 15),
                     child: Row(
                        children: [
                          SizedBox(
                              height: 50,
                              child: VerticalDivider(
                                color: Colors.black,
                                thickness: 2,
                              )
                          ),
                         Column(
                           children: [
                             Text('Organizations big and small are moving their businesses'),
                             Text('to the cloud,avoiding the complexity and cost of owning    '),
                             Text('maintaining expensive hardware and software resources   '),
                             Text('resources to execute intensive computations                        '),
                           ],
                         ),
                        ],
                      ),
                   ),
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text('Installation of EdgeCloudSim'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color: Colors.black,
                              thickness: 2,
                            )
                        ),
                        Column(
                          children: [
                            Text('Download the source code from GitHub repository.   '),
                            Text('Create a Java project in Eclipse and imported EdgeCS.   '),
                            Text('Install json-simple-1.1.jar and add the JAR file                 '),
                            Text('Understand the modular structure of the code.                  ' ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text('Running sample application'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color: Colors.black,
                              thickness: 2,
                            )
                        ),
                        Column(
                          children: [
                            Text(' Run the mainApp class to track the process.        '),
                            Text('Achieve results under specified output as log files    '),
                            Text(' Run matlab functions in MATLAB to plot our results   '),
                            Text(' Modify configuration files and observe the changes.   '),
                          ],
                        ),
                      ],
                    ),
                  ),
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text('Analysis of Parameters'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color: Colors.black,
                              thickness: 2,
                            )
                        ),
                        Column(
                          children: [
                            Text('We are going to clarify the configuration files that Sim use.'),
                            Text('EdgeCloudSim uses three different files. First of all,             '),
                            Text(' the default_config.properties file .Then we have edge_       '),
                            Text('devices.xml file. Last file is applications.xml,                       '),
                          ],
                        ),
                      ],
                    ),
                  ),
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text('Architecture'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color: Colors.black,
                              thickness: 2,
                            )
                        ),
                        Column(
                          children: [
                            Text('Our client-server architecture consists of mobile '),
                            Text('application users which in turn request and receive     '),
                            Text(' services from the server on the other side An interface'),
                            Text(' is provided to the users  to help modify the simulator.    '),
                          ],
                        ),
                      ],
                    ),
                  ),
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text('Results and Analysis'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color: Colors.black,
                              thickness: 2,
                            )
                        ),
                        Column(
                          children: [
                            Text('Organizations big and small are moving their businesses'),
                            Text('to the cloud,avoiding the complexity and cost of owning    '),
                            Text('maintaining expensive hardware and software resources   '),
                            Text('resources to execute intensive computations                        '),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]
            ),
          ),
        ),
      )
    );
  }
}
class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 20.0,
      width: 20.0,
      decoration: new BoxDecoration(
        color: Color(0xFF345979),
        shape: BoxShape.circle,
      ),
    );
  }
}
