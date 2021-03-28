import 'package:aiascs_mobile/core/components/auth_button.dart';
import 'package:aiascs_mobile/modules/home/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _form = new GlobalKey();
  TextEditingController userEmail = new TextEditingController();
  TextEditingController userPassword = new TextEditingController();

  @override
  void dispose() {
    userEmail.dispose();
    userPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Card(
            elevation: 0,
            child: Form(
              key: _form,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: TextFormField(
                      cursorColor: Color(0xFF9FB9CC),
                      showCursor: true,
                      controller: userEmail,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email),
                        hintText: "Email",
                        labelText: "Email",
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Color(0xFF9FB9CC),
                        focusColor: Colors.yellow,
                      ),
                      validator: (value){
                        if (!value.contains("@")) {
                          return "Enter valid email";
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      cursorColor: Color(0xFF9FB9CC),
                      showCursor: true,
                      controller: userPassword,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: "Password",
                        labelText: "Password",
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Color(0xFF9FB9CC),
                        focusColor: Colors.yellow,
                      ),
                      validator: (value) {
                        if (value.length < 2) {
                          return "password should contain atleast 8 character";
                        }
                      },
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height/28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               AuthaSaveButton(
                  label: "Log in",
                  labelColor:  Color(0xFF9FB9CC),
                  buttonColor:                   Color(0xFFFFFFFF),
                  onPressButton: (){
                      Navigator.push(
        context, new MaterialPageRoute(builder: (context) => Home()));
  
                  },
                )
            ],
          )
        ],
      ),
    );
  }
}