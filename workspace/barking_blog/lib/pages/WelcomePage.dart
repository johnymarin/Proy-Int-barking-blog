

import 'package:flutter/material.dart';
import 'SignUpPage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with
    TickerProviderStateMixin {

  late AnimationController _controller1;
  late Animation<Offset> animation1;

  @override
  void initState(){
    super.initState();
    _controller1 = AnimationController(
        duration: Duration(milliseconds: 1500),
        vsync: this
    );
    animation1 = Tween<Offset>(
      begin: Offset(0.0, 6.0),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller1, curve: Curves.bounceOut),
      );
    _controller1.forward();
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller1.dispose();
  }



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.green,
            ],
            begin: FractionalOffset(0.0, 1.0),
            end: FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.repeated,
          )
        ),
        child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SlideTransition(
                  position: animation1,
                  child: const Text(
                    'Blog del grupo 4',
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height/10,),
                SlideTransition(
                  position: animation1,
                  child: Text("Muy buenas Historias",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 38,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20,),
                BoxContainer(
                    "assets/images/facebookLogo.png",
                    "Log wit Facebook",
                    null),

                SizedBox(height: 20,),
                BoxContainer(
                    "assets/images/googleLogo.png",
                    "Log wit Google",
                    null),

                SizedBox(height: 20,),
                BoxContainer(
                    "assets/images/emailLogo.png",
                    "Log wit Email",
                    onEmailClick),


              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  onEmailClick(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage(),),);
  }

  Widget BoxContainer(String pathToImage, String textOfCard, onClick)
  {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 1.1,
        child: Card(
          child: Row(
            children: [
              Image.asset(pathToImage, height: 40, width: 40,),
              SizedBox(width: 20,),
              Text(
                textOfCard,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

