import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool vis=true;
  final _globalkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
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
          child: Form(
            key: _globalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign up with email",
                  style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 20,),
                usernameTextField(),
                emailTextField(),
                passwordTextField(),
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    if(_globalkey.currentState!.validate()){
                      print("validated");
                    }
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green
                    ),
                    child: Center(
                      child: Text(
                          "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }

  Widget usernameTextField(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Column(
        children: [
          Text("User Name"),
          TextFormField(

            validator: (value){
              if(value!.isEmpty)
                return"Userneame cant be Empty";
              return null;
            },
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    )
                )
            ),
          )
        ],
      ),
    );
  }
  Widget emailTextField(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        children: [
          Text("email"),
          TextFormField(
            validator: (value){
              if(value!.isEmpty)
                return"email cant be Empty";
              if (!value.contains("@"))
                return "email must contain 'at'";
              return null;
            },
            decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    )
                )
            ),
          )
        ],
      ),
    );
  }
  Widget passwordTextField(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        children: [
          Text("Password"),
          TextFormField(
            validator:  (value){
              if(value!.isEmpty)
                return"Password cant be Empty";
              if(value.length <=8)
                return "Password lenght must be 8";
              return null;
            },
            obscureText: vis,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(
                  vis?Icons.visibility_off:Icons.visibility,
                ),
                onPressed: (){
                  setState(() {
                    vis = !vis;
                  });
                },
              ),
              helperText: "Password lenthshould have 8 characters",
              helperStyle: TextStyle(
                fontSize: 16,
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  )
                )
            ),
          )
        ],
      ),
    );
  }



}
