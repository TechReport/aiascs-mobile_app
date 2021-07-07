import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/app_state/product_state.dart';
import 'package:aiascs_mobile/app_state/scan_qr_code_state.dart';
import 'package:aiascs_mobile/core/components/enter_token_button.dart';
import 'package:aiascs_mobile/core/components/location_pop_form.dart';
import 'package:aiascs_mobile/core/components/spacer_component.dart';
import 'package:aiascs_mobile/core/utils/constant/Language_Contant.dart';
import 'package:aiascs_mobile/models/Product.dart';
import 'package:aiascs_mobile/models/scan_product_profile.dart';
import 'package:aiascs_mobile/modules/home/components/bottom_navigation_bar_options.dart';
import 'package:aiascs_mobile/modules/home/home.dart';
import 'package:aiascs_mobile/modules/scan_qr_code/components/qr_code_header.dart';
import 'package:aiascs_mobile/modules/services_module/product_module/product_invetory_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanProductReport extends StatefulWidget {
  @override
  _ScanProductReportState createState() => _ScanProductReportState();
}

class _ScanProductReportState extends State<ScanProductReport> {
  int _selectedindex = 0;
  GlobalKey<FormState> _key = new GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  String email = '', password = '';
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentSelectedBottomBarIndex(1);
    _selectedindex = Provider.of<AppBarTitleState>(context, listen: false)
        .currentSelectedBottomBar;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
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
      return Consumer<ScanQrCodeState>(
          builder: (BuildContext context, scanQrCode, child) {
        Product product = scanQrCode.currentProduct;
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Color(0xFF264653)),
              onPressed: () {
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
            child: ExpansionTile(
              title: product.isRevoked == "false"
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          languageState.currentLanguage ==
                                  LanguageContant().english
                              ? "GENUINE "
                              : "NI ORIGINAL",
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                        Icon(
                          Icons.mark_email_read_sharp,
                          size: 32,
                          color: Color(0xFF264653),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          languageState.currentLanguage ==
                                  LanguageContant().english
                              ? "FAKE "
                              : "NI FEKI",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 27,
                          ),
                        ),
                        Icon(
                          Icons.cancel_presentation_sharp,
                          size: 32,
                          color: Color(0xFF264653),
                        ),
                      ],
                    ),
              children: [
                QRCodeHeader(),
                SingleChildScrollView(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                    height: MediaQuery.of(context).size.height / 2 + 1,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                        itemCount: ScanProductProfile.defaultProductProfileData(
                                product)
                            .length,
                        itemBuilder: (context, int profileIndex) {
                          return Container(
                            color: Colors.grey[100],
                            padding: EdgeInsets.symmetric(vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    ScanProductProfile
                                            .defaultProductProfileData(
                                                product)[profileIndex]
                                        .profileTitle,
                                    style: TextStyle().copyWith(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    ":",
                                    style: TextStyle().copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    ScanProductProfile
                                            .defaultProductProfileData(
                                                product)[profileIndex]
                                        .profileValue,
                                    style: TextStyle().copyWith(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ),
                SpacerComponent(
                    height: MediaQuery.of(context).size.height / 53),
                scanQrCode.isLoading
                    ? CircularProgressIndicator()
                    : EnterTokenButton(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 16,
                        title: product.isRevoked == "false"
                            ? languageState.currentLanguage ==
                                    LanguageContant().english
                                ? "Revoke Product"
                                : "Iweke Kuwa Feki"
                            : languageState.currentLanguage ==
                                    LanguageContant().english
                                ? "View Full Report"
                                : "Onesha Repoti Nzima",
                        onPressButton: () async {
                          scanQrCode.clear();
                          if (product.isRevoked == 'false') {
                            showDialog(
                                barrierDismissible: true,
                                builder: (context) => new AlertDialog(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        new Text(Provider.of<LanguageState>(
                                                        context,
                                                        listen: false)
                                                    .currentLanguage ==
                                                LanguageContant().english
                                            ? "Add Description "
                                            : "Ongeza Maelezo "),
                                        Icon(
                                          Icons.mark_email_read_sharp,
                                          size: 60,
                                          color: Colors.greenAccent,
                                        )
                                      ],
                                    ),
                                    content: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                                  4 +
                                              10,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(children: [
                                        Form(
                                          key: _key,
                                          autovalidateMode: _validate,
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                                minWidth: double.infinity),
                                            child: Padding(
                                              padding: const EdgeInsets.all(0),
                                              child: TextFormField(
                                                  controller:
                                                      _passwordController,
                                                  textAlignVertical:
                                                      TextAlignVertical.center,
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  obscureText: false,
                                                  enableSuggestions: true,
                                                  maxLines: 7,
                                                  // ignore: missing_return
                                                  validator: (value) {
                                                    if (value.length < 1) {
                                                      return languageState
                                                                  .currentLanguage ==
                                                              LanguageContant()
                                                                  .english
                                                          ? "Value is not correct or similar to password above"
                                                          : "Taarifa hazifanani na nywila ulizoingiza hapo juu";
                                                    }
                                                  },
                                                  onSaved: (String val) {
                                                    email = val;
                                                  },
                                                  onFieldSubmitted: (_) =>
                                                      FocusScope.of(context)
                                                          .nextFocus(),
                                                  style:
                                                      TextStyle(fontSize: 13.0),
                                                  keyboardType:
                                                      TextInputType.text,
                                                  cursorColor:
                                                      Color(0xFF264653),
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          new EdgeInsets.only(
                                                              left: 2,
                                                              right: 0,
                                                              top: 10),
                                                      fillColor: Colors.white,
                                                      hintText: languageState
                                                                  .currentLanguage ==
                                                              LanguageContant()
                                                                  .english
                                                          ? 'Enter New Password'
                                                          : "Ingiiza Nywila",
                                                      focusedBorder: OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(2.0),
                                                          borderSide: BorderSide(color: Colors.grey, width: 2.0)),
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2.0),
                                                      ))),
                                            ),
                                          ),
                                        ),
                                        LocationPopUpForm(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Provider.of<ScanQrCodeState>(
                                                        context,
                                                        listen: false)
                                                    .isLoading
                                                ? Text(" Loading ....")
                                                : EnterTokenButton(
                                                    title: Provider.of<LanguageState>(
                                                                    context,
                                                                    listen:
                                                                        false)
                                                                .currentLanguage ==
                                                            LanguageContant()
                                                                .english
                                                        ? "Complete "
                                                        : "Maliza",
                                                    onPressButton: () async {
                                                      if (await scanQrCode
                                                          .revokeProduct(
                                                              product.id)) {
                                                        Navigator.push(
                                                            context,
                                                            new MaterialPageRoute(
                                                                builder: (context) =>
                                                                    new Home(
                                                                        // product: product,
                                                                        // isReport: true,
                                                                        )));
                                                      }
                                                    },
                                                    width:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                4 +
                                                            50,
                                                  )
                                          ],
                                        )
                                      ]),
                                    )),
                                context: context);
                          } else {
                            Provider.of<AppBarTitleState>(context,
                                    listen: false)
                                .setCurrentAppBarTitle(
                                    Provider.of<LanguageState>(context,
                                                    listen: false)
                                                .currentLanguage ==
                                            LanguageContant().english
                                        ? "Report"
                                        : "Repoti");
                            Provider.of<ProductState>(context, listen: false)
                                .clearState();

                            Provider.of<ProductState>(context, listen: false)
                                .getProductList();
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        new ProductInvetoryService()));

                            print("on monitor");
                          }
                        },
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
