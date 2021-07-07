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
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordController.text = "TBS";
    _emailController.text = "test@tbs.com";
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Consumer<LoginState>(
        builder: (BuildContext context, loginState, child) {
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
                          child: loginState.isLoading
                              ? CircularProgressIndicator(
                                  backgroundColor: Color(0xFF264653),
                                )
                              : SubmitButton(),
                          onTap: () async {
                            //             showDialog(
                            //                 barrierDismissible: true,
                            //                 builder: (context) => new AlertDialog(
                            //                     title: Row(
                            //                       mainAxisAlignment:
                            //                           MainAxisAlignment.center,
                            //                       children: [
                            //                         new Text(Provider.of<LanguageState>(
                            //                                         context,
                            //                                         listen: false)
                            //                                     .currentLanguage ==
                            //                                 LanguageContant().english
                            //                             ? "Add Description "
                            //                             : "Ongeza Maelezo "),
                            //                         Icon(
                            //                           Icons.mark_email_read_sharp,
                            //                           size: 60,
                            //                           color: Colors.greenAccent,
                            //                         )
                            //                       ],
                            //                     ),
                            //                     content: Container(
                            //                       height:
                            //                           MediaQuery.of(context).size.height /
                            //                                   2+
                            //                               100,
                            //                       width: MediaQuery.of(context).size.width,
                            //                       child: Column(children: [

                            //                         Row(
                            //                           mainAxisAlignment:
                            //                               MainAxisAlignment.spaceAround,
                            //                           children: [
                            //                             Provider.of<ScanQrCodeState>(
                            //                                         context,
                            //                                         listen: false)
                            //                                     .isLoading
                            //                                 ? Text(" Loading ....")
                            //                                 : EnterTokenButton(
                            //                                     title: Provider.of<LanguageState>(
                            //                                                     context,
                            //                                                     listen:
                            //                                                         false)
                            //                                                 .currentLanguage ==
                            //                                             LanguageContant()
                            //                                                 .english
                            //                                         ? "Complete "
                            //                                         : "Maliza",
                            //                                     onPressButton: () async {

                            //                                     },
                            //                                     width:
                            //                                         MediaQuery.of(context)
                            //                                                     .size
                            //                                                     .width /
                            //                                                 4 +
                            //                                             50,
                            //                                   )
                            //                           ],
                            //                         ),
                            //                         Padding(
                            //   padding: const EdgeInsets.all(10.0),
                            //   child: DropDownStrip(
                            //     dropdownitem: regionname,
                            //     onChange: (newValue) async {
                            //       setState(() {
                            //         regionname = newValue;
                            //       });
                            //       regionname = newValue;
                            //       await Provider.of<LocationState>(context, listen: false).getSelectedRegion(regionname);
                            //     },
                            //     item: Provider.of<LocationState>(context, listen: false).regionListString,
                            //   ),
                            // ),Padding(
                            //   padding: const EdgeInsets.all(10.0),
                            //   child: DropDownStrip(
                            //     dropdownitem: districtname,
                            //     onChange: (newValue) {
                            //       setState(() async {
                            //         districtname = newValue;
                            //         await Provider.of<LocationState>(context, listen: false).getSelectedDistrict(districtname);
                            //       });
                            //     },
                            //     item: Provider.of<LocationState>(context, listen: false).districtListString,
                            //   ),
                            // ),
                            //  Padding(
                            //   padding: const EdgeInsets.all(10.0),
                            //   child: DropDownStrip(
                            //     dropdownitem: wardname,
                            //     onChange: (newValue) {
                            //       setState(() {
                            //         wardname = newValue;
                            //       });
                            //     },
                            //     item: Provider.of<LocationState>(context, listen: false).wardListString,
                            //   ),
                            // ),
                            //     Form(
                            //                           child: ConstrainedBox(
                            //                             constraints: BoxConstraints(
                            //                                 minWidth: double.infinity),
                            //                             child: Padding(
                            //                               padding: const EdgeInsets.all(0),
                            //                               child: TextFormField(
                            //                                   controller:
                            //                                       _passwordController,
                            //                                   textAlignVertical:
                            //                                       TextAlignVertical.center,
                            //                                   textInputAction:
                            //                                       TextInputAction.next,
                            //                                   obscureText: false,
                            //                                   enableSuggestions: true,
                            //                                   maxLines: 7,
                            //                                   // ignore: missing_return
                            //                                   validator: (value) {
                            //                                     if (value.length < 1) {
                            //                                       return  "Taarifa hazifanani na nywila ulizoingiza hapo juu";
                            //                                     }
                            //                                   },
                            //                                   onSaved: (String val) {
                            //                                     // email = val;
                            //                                   },
                            //                                   onFieldSubmitted: (_) =>
                            //                                       FocusScope.of(context)
                            //                                           .nextFocus(),
                            //                                   style:
                            //                                       TextStyle(fontSize: 13.0),
                            //                                   keyboardType:
                            //                                       TextInputType.text,
                            //                                   cursorColor:
                            //                                       Color(0xFF264653),
                            //                                   decoration: InputDecoration(
                            //                                       contentPadding:
                            //                                           new EdgeInsets.only(
                            //                                               left: 2,
                            //                                               right: 0,
                            //                                               top: 10),
                            //                                       fillColor: Colors.white,
                            //                                       hintText: "Ingiiza Nywila",
                            //                                       focusedBorder: OutlineInputBorder(
                            //                                           borderRadius:
                            //                                               BorderRadius.circular(2.0),
                            //                                           borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                            //                                       border: OutlineInputBorder(
                            //                                         borderRadius:
                            //                                             BorderRadius
                            //                                                 .circular(2.0),
                            //                                       ))),
                            //                             ),
                            //                           ),
                            //                         ),
                            //                       ]),
                            //                     )),
                            //                 context: context);
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty ||
                                !_emailController.text.contains("@")) {
                              return AppUtil.showToastMessage(
                                  message: "Enter Valid Login Credentials");
                            } else {
                              await loginState.setLogin(_emailController.text,
                                  _passwordController.text);

                              if (loginState.isLogin) {
                                await Provider.of<UserState>(context,
                                        listen: false)
                                    .setCurrentUser(await PreferenceProvider
                                        .getPreferenceValue("userId"));
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => new Home(
                                              selectedIndex: 1,
                                            )));
                              }
                            }
                          },
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.centerRight,
                          child: Text('',
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
