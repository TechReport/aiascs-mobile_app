import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/app_state/product_state.dart';
import 'package:aiascs_mobile/app_state/scan_qr_code_state.dart';
import 'package:aiascs_mobile/core/components/enter_token_button.dart';
import 'package:aiascs_mobile/core/components/product_report_header.dart';
import 'package:aiascs_mobile/core/components/spacer_component.dart';
import 'package:aiascs_mobile/core/utils/constant/Language_Contant.dart';
import 'package:aiascs_mobile/models/Product.dart';
import 'package:aiascs_mobile/models/scan_product_profile.dart';
import 'package:aiascs_mobile/modules/home/components/bottom_navigation_bar_options.dart';
import 'package:aiascs_mobile/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductAuthorizedProfile extends StatefulWidget {
  final Product product;
  final bool isReport;

  ProductAuthorizedProfile({@required this.product, this.isReport = false});

  @override
  _ProductAuthorizedProfileState createState() =>
      _ProductAuthorizedProfileState();
}

class _ProductAuthorizedProfileState extends State<ProductAuthorizedProfile> {
  int _selectedindex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentSelectedBottomBarIndex(0);
    _selectedindex = Provider.of<AppBarTitleState>(context, listen: false)
        .currentSelectedBottomBar;
  }

  @override
  Widget build(BuildContext context) {
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
          //ProductState
          builder: (BuildContext context, scanQrCode, child) {
        return Consumer<ProductState>(
          builder: (BuildContext context, productState, child) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Color(0xFF264653),
                title: Text(
                    Provider.of<AppBarTitleState>(context, listen: false)
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
                            ? "Report"
                            : "Repoti");
                    Navigator.pop(context);
                  },
                ),
              ),
              body: ListView(
                children: [
                  ProductReportHeader(
                    status:
                        widget.product.isRevoked == "true" ? "Fake" : "Genuine",
                  ),
                  SingleChildScrollView(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                      height: MediaQuery.of(context).size.height / 2 + 1,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 10),
                          itemCount:
                              ScanProductProfile.defaultProductProfileData(
                                      widget.product)
                                  .length,
                          itemBuilder: (context, int profileIndex) {
                            return Container(
                              color: Colors.grey[100],
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      ScanProductProfile
                                              .defaultProductProfileData(
                                                  widget.product)[profileIndex]
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
                                                  widget.product)[profileIndex]
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
                  // widget.isReport
                  //     ?
                  scanQrCode.isLoading
                      ? CircularProgressIndicator()
                      : EnterTokenButton(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 16,
                          title: widget.product.isRevoked == "false"
                              ? languageState.currentLanguage ==
                                      LanguageContant().english
                                  ? "Revoke Product"
                                  : "Batilisha Bidhaa"
                              : languageState.currentLanguage ==
                                      LanguageContant().english
                                  ? "Other Products"
                                  : "Bidhaa Zingine",
                          onPressButton: () async {
                            scanQrCode.onSetCurrentProduct(widget.product);
                            scanQrCode.clear();
                            if (widget.product.isRevoked == "false") {
                              await scanQrCode.revokeProduct(widget.product.id);
                              if (scanQrCode.isRevoked) {
                                print("in revokes condition");
                                Provider.of<AppBarTitleState>(context,
                                        listen: false)
                                    .setCurrentAppBarTitle(
                                        Provider.of<LanguageState>(context,
                                                        listen: false)
                                                    .currentLanguage ==
                                                LanguageContant().english
                                            ? "Report"
                                            : "Repoti");
                                Provider.of<ProductState>(context,
                                        listen: false)
                                    .clearState();

                                Provider.of<ProductState>(context,
                                        listen: false)
                                    .getProductList();
                                Navigator.pop(context);
                              } else {
                                print("else revoke fail");
                                Navigator.pop(context);
                              }
                            } else {}
                          },
                        )
                  // : productState.isProductLoading
                  //     ? CircularProgressIndicator()
                  //     : EnterTokenButton(
                  //         width: MediaQuery.of(context).size.width / 2,
                  //         height: MediaQuery.of(context).size.height / 16,
                  //         title:languageState.currentLanguage == LanguageContant().english  ? "Revoke Product" :"Batilisha Bidhaa",
                  //         onPressButton: () async {
                  //           scanQrCode.clear();
                  //           await scanQrCode
                  //               .revokeProduct(widget.product.id);
                  //         },
                  //       )
                ],
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
          },
        );
      });
    });
  }
}
