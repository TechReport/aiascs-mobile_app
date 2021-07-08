import 'package:aiascs_mobile/app_state/User_state.dart';
import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/core/components/spacer_component.dart';
import 'package:aiascs_mobile/core/services/http_service/http_service.dart';
import 'package:aiascs_mobile/core/utils/constant/Language_Contant.dart';
import 'package:aiascs_mobile/modules/home/components/bottom_navigation_bar_options.dart';
import 'package:aiascs_mobile/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  int _selectedindex;
  String _dropDownValue;

  @override
  void initState() {
    super.initState();
    Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentSelectedBottomBarIndex(0);
    _selectedindex = Provider.of<AppBarTitleState>(context, listen: false)
        .currentSelectedBottomBar;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _descriptionController;
    GlobalKey _formKey = new GlobalKey();
    void _update_page(int value) {
      setState(() {
        _selectedindex = value;
      });
      Provider.of<AppBarTitleState>(context, listen: false)
          .setCurrentSelectedBottomBarIndex(_selectedindex);
      Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (context) => new Home(
                  selectedIndex:
                      Provider.of<AppBarTitleState>(context, listen: false)
                          .currentSelectedBottomBar)));
    }

    return Consumer<LanguageState>(
        builder: (BuildContext context, languageState, child) {
      return Consumer<UserState>(
          builder: (BuildContext context, userState, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xFF264653),
            title: Text(Provider.of<AppBarTitleState>(context, listen: false)
                .appBarTitle),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Provider.of<AppBarTitleState>(context, listen: false)
                    .setCurrentAppBarTitle(languageState.currentLanguage ==
                            LanguageContant().english
                        ? "Home"
                        : "Nyumbani");
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Home(
                            selectedIndex: Provider.of<AppBarTitleState>(
                                    context,
                                    listen: false)
                                .currentSelectedBottomBar)));
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Divider(),
                Divider(),
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    languageState.currentLanguage == LanguageContant().english
                        ? 'For any feedback concern the system, project,products and supply chain status for agro inputs products,   Choose the levels of your feedback and descriptions . '
                        : "Kwa Mrejesho wowote wa mfumo,mradi,bidhaa pamoja na myororo wa bidhaa za kilimo ,Chagua aina ya mrejesho ambatanisha na maelezo yake ",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SpacerComponent(
                    height: MediaQuery.of(context).size.height / 13),
                DropdownButton(
                  iconEnabledColor: Color(0xFF264653),
                  hint: _dropDownValue == null
                      ? Text(languageState.currentLanguage ==
                              LanguageContant().english
                          ? 'Choose Profile Feedback '
                          : "Mrejesho ni wa nini ?")
                      : Text(
                          _dropDownValue,
                          style: TextStyle(color: Color(0xFF264653)),
                        ),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Color(0xFF264653)),
                  items: ['Company', 'Product', 'SupplyChain Status'].map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        _dropDownValue = val;
                      },
                    );
                  },
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(minWidth: double.infinity),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 26.0, right: 8.0, left: 8.0),
                        child: TextFormField(
                            controller: _descriptionController,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            maxLength: 1000,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) =>
                                FocusScope.of(context).nextFocus(),
                            validator: (value) {},
                            onSaved: (String val) {},
                            decoration: InputDecoration(
                                contentPadding: new EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                fillColor: Colors.white,
                                hintText: languageState.currentLanguage ==
                                        LanguageContant().english
                                    ? 'Enter Description here'
                                    : "Ingiiza Maelezo",
                                hintStyle: TextStyle(color: Colors.grey),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: BorderSide(
                                        color: Color(0xFF264653), width: 2.0)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ))))),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 40.0, left: 40.0, top: 40.0),
                  child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: RaisedButton(
                      color: Color(0xFF264653),
                      child: Text(
                        languageState.currentLanguage ==
                                LanguageContant().english
                            ? 'Send Feedback'
                            : "Tuma Mrejesho",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      textColor: Colors.white,
                      splashColor: Colors.red,
                      onPressed: () async {
                        HttpService().httpPostFeedback(
                            userState.currentUser, _descriptionController.text);
                      },
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: Colors.grey)),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xFF264653),
            selectedIconTheme: IconThemeData(
              color: Color(0xfff2f2f2),
            ),
            unselectedIconTheme: IconThemeData(color: Colors.white),
            selectedLabelStyle: TextStyle(
              color: Colors.white,
            ),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedLabelStyle:
                TextStyle(color: Color(0xfff2f2f2).withOpacity(0.5)),
            fixedColor: Colors.yellow,
            type: BottomNavigationBarType.fixed,
            items: BottomNavigationOptions.navigationOptions,
            currentIndex: _selectedindex,
            onTap: _update_page,
          ),
        );
      });
    });
  }
}
