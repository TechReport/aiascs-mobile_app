import 'package:aiascs_mobile/app_state/Login_state.dart';
import 'package:aiascs_mobile/app_state/User_state.dart';
import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/app_state/location_state.dart';
import 'package:aiascs_mobile/app_state/scan_qr_code_state.dart';
import 'package:aiascs_mobile/core/components/drop_down_drip.dart';
import 'package:aiascs_mobile/core/components/enter_token_button.dart';
import 'package:aiascs_mobile/core/components/location_pop_form.dart';
import 'package:aiascs_mobile/core/services/auth/Login_service.dart';
import 'package:aiascs_mobile/core/services/shared_preference/preference_provider.dart';
import 'package:aiascs_mobile/core/utils/app_util.dart';
import 'package:aiascs_mobile/core/utils/constant/Language_Contant.dart';
import 'package:aiascs_mobile/modules/authentication/components/bezierContainer.dart';
import 'package:aiascs_mobile/modules/authentication/components/submit_button.dart';
import 'package:aiascs_mobile/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  String dropdownValue = 'Gender';
  String districtname = 'District';
  String regionname = 'Region';
  String wardname = 'Ward';

  void toLogin(BuildContext context, GlobalKey loginFormKeyStatus) async {
    if (loginFormKeyStatus.currentState.mounted) {
      Provider.of<LoginService>(context, listen: false)
          .login(_emailController.text, _passwordController.text);
    }
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new Home(
                selectedIndex:
                    Provider.of<AppBarTitleState>(context, listen: false)
                        .currentSelectedBottomBar)));
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: isPassword ? _passwordController : _emailController,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }


  Widget _title(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'AIASCS',
        style: GoogleFonts.portLligatSans(
          textStyle: Theme.of(context).textTheme.display1,
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color(0xFF264653),
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email id"),
        _entryField("Password", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Consumer<LoginState>(builder: (BuildContext context, loginState, child) {
      return Scaffold(
          body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
                top: -height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer()),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Form(
                    key: _loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .2),
                        _title(context),
                        SizedBox(height: 50),
                        _emailPasswordWidget(),
                        SizedBox(height: 20),
                        GestureDetector(
                          child:loginState.isLoading ? CircularProgressIndicator(
                            backgroundColor: Color(0xFF264653),
                          ) : SubmitButton(),
                          onTap: ()async {
                         
                           await   loginState.setLogin(_emailController.text,
                                  _passwordController.text);
                        
                         if(loginState.isLogin)
                         {
                            await  Provider.of<UserState>(context, listen: false).setCurrentUser(await PreferenceProvider.getPreferenceValue("userId"));
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new Home(selectedIndex: 1,)));
                         }
                          },
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.centerRight,
                          child: Text('Forgot Password ?',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ));
    });
  }
}
