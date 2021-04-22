import 'package:aiascs_mobile/app_state/Login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ChangePassword extends StatefulWidget {
  @override
  State createState() {
    return _ChangePassword();
  }
}

class _ChangePassword extends State<ChangePassword> {
  GlobalKey<FormState> _key = new GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  String email = '', password = '';
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginState>(builder: (context, loginState, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
        ),
        body: Form(
          key: _key,
          autovalidateMode: _validate,
          child: ListView(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 32.0, right: 16.0, left: 16.0),
                child: Text(
                  'Change password',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: double.infinity),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
                  child: TextFormField(
                      controller: _passwordController,
                      textAlignVertical: TextAlignVertical.center,
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                      validator: (value) {
                          if (value.length < 1) {
                          return "Value is not correct or similar to password above";
                        }
                      },
                      onSaved: (String val) {
                        email = val;
                      },
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).nextFocus(),
                      style: TextStyle(fontSize: 12.0),
                      keyboardType: TextInputType.text,
                      cursorColor: Color(0xFF9FB9CC),
                      decoration: InputDecoration(
                          contentPadding:
                              new EdgeInsets.only(left: 16, right: 16),
                          fillColor: Colors.white,
                          hintText: 'Enter New Password',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ))),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: double.infinity),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 32.0, right: 24.0, left: 24.0),
                  child: TextFormField(
                      controller: _confirmPasswordController,
                      textAlignVertical: TextAlignVertical.center,
                      validator: (value) {
                        if (value.length < 1 ||
                            value != _passwordController.text) {
                          return "Value is not correct or similar to password above";
                        }
                      },
                      onSaved: (String val) {
                        password = val;
                      },
                      onFieldSubmitted: (password) async {},
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(fontSize: 12.0),
                      cursorColor: Colors.blue,
                      decoration: InputDecoration(
                          contentPadding:
                              new EdgeInsets.only(left: 16, right: 16),
                          fillColor: Colors.white,
                          hintText: 'Comfirm Password',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.0)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 40.0, left: 40.0, top: 40),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: RaisedButton(
                    color:loginState.isLoading ? Colors.white:Color(0xFF9FB9CC),
                    child:loginState.isLoading ? CircularProgressIndicator(
                            backgroundColor: Color(0xFF9FB9CC),
                          ) : Text(
                      'Submit',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    textColor: Colors.white,
                    splashColor: Colors.white,
                    onPressed: () async {
                      if (_key.currentState.validate()) {
                        _key.currentState.save();
                        loginState.changePassword(_passwordController.text);
                      } else {
                        setState(() {
                          _validate = AutovalidateMode.onUserInteraction;
                        });
                      }
                    },
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        side: BorderSide(color: Colors.red)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Text(
                    '',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
