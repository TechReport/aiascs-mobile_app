import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/app_state/scan_qr_code_state.dart';
import 'package:aiascs_mobile/core/components/enter_token_button.dart';
import 'package:aiascs_mobile/core/components/spacer_component.dart';
import 'package:aiascs_mobile/core/utils/app_util.dart';
import 'package:aiascs_mobile/core/utils/constant/Language_Contant.dart';
import 'package:aiascs_mobile/modules/scan_qr_code/components/qr_code_validate.dart';
import 'package:aiascs_mobile/modules/scan_qr_code/scan_product_report.dart';
import 'package:provider/provider.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrCode extends StatefulWidget {
  @override
  _ScanQrCodeState createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String result = '';
  Future<void> onValidateToken(String tokenValue) async {
    print("on search token validate");
    if (tokenValue.isNotEmpty && tokenValue.length > 7 || tokenValue != null) {
      await Provider.of<ScanQrCodeState>(context, listen: false)
          .scanQrCode(qrInfo: tokenValue);
    } else {
      //
      return AppUtil.showToastMessage(message: "Enter Valid Product TOKEN");
    }
// Provider.of<ScanQrCodeState>(context, listen: false).setIsLoading(false);
  }

  void onViewProductScanReport() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new ScanProductReport()));
  }

  void onStartScanQrCoe() async {
    // Provider.of<ScanQrCodeState>(context, listen: false).setIsLoading(true);
    // await Permission.camera.request();
    String cameraScanResult = await scanner.scan();
    print("searchScanResult");
    if (cameraScanResult != null ||
        cameraScanResult.isNotEmpty && cameraScanResult.length > 7) {
      await Provider.of<ScanQrCodeState>(context, listen: false)
          .scanQrCode2(qrInfo: cameraScanResult);
      // Provider.of<ScanQrCodeState>(context, listen: false).isLoading
      return showDialog(
          barrierDismissible: false,
          builder: (context) => new AlertDialog(
                title: new Text(
                    Provider.of<ScanQrCodeState>(context, listen: false)
                            .isLoading
                        ? "Verifying"
                        : "Finish Verification"),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Provider.of<ScanQrCodeState>(context, listen: false)
                            .isLoading
                        ? CircularProgressIndicator()
                        : Icon(
                            Icons.mark_email_read_sharp,
                            size: 60,
                            color: Colors.greenAccent,
                          ),
                    Provider.of<ScanQrCodeState>(context, listen: false)
                            .isLoading
                        ? Text(" Loading ....")
                        : EnterTokenButton(
                            title: Provider.of<LanguageState>(context,
                                            listen: false)
                                        .currentLanguage ==
                                    LanguageContant().english
                                ? "Show Report "
                                : "Onesha Repoti",
                            onPressButton: () {
                              if (Provider.of<ScanQrCodeState>(context,
                                          listen: false)
                                      .currentProduct
                                      .isRevoked ==
                                  null) {
                                return AppUtil.showToastMessage(
                                    message: "Nothing to Revoke");
                              } else {
                                return onViewProductScanReport();
                              }
                            },
                            width: MediaQuery.of(context).size.width / 4 + 50,
                          )
                  ],
                ),
              ),
          context: context);
    }
// Provider.of<ScanQrCodeState>(context, listen: false).setIsLoading(false);

    if (QrCodeValidate.validateQrcode(cameraScanResult)) {
      print("the authenticated messsage is" + cameraScanResult);
    } else {}
    //  Provider.of<ScanQrCodeState>(context, listen: false).setIsLoading(false);
  }

  TextEditingController _searchController = new TextEditingController();
//cc8bb08d-f246-4124-8fa2-7c1b2407b39a
  @override
  void initState() {
    super.initState();
    _searchController.text = "2101-00-003K";
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageState>(
        builder: (BuildContext context, languageState, child) {
      return Consumer<ScanQrCodeState>(
          builder: (BuildContext context, scanQrCode, child) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: Text(""),
                title: Form(
                    child: Stack(
                  fit: StackFit.loose,
                  overflow: Overflow.visible,
                  children: [
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                            margin: EdgeInsets.only(top: 0),
                            height: MediaQuery.of(context).size.height / 16,
                            width: MediaQuery.of(context).size.width / 2 + 900,
                            decoration: BoxDecoration(
                              color: Color(0xFFF8F4FF),
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 1, right: 15, top: 5),
                                child: TextFormField(
                                    validator: (value) {
                                      if (value.length < 7) {
                                        return "enter valid token";
                                      }
                                    },
                                    cursorColor: Colors.blue,
                                    keyboardAppearance: Brightness.light,
                                    keyboardType: TextInputType.text,
                                    controller: _searchController,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.qr_code_rounded),
                                      border: InputBorder.none,
                                      labelText:
                                          languageState.currentLanguage ==
                                                  LanguageContant().english
                                              ? 'token here'
                                              : "weka token ",
                                    ))))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Divider(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                ),
                                scanQrCode.isLoading
                                    ? CircularProgressIndicator()
                                    : EnterTokenButton(
                                        title: languageState.currentLanguage ==
                                                LanguageContant().english
                                            ? "Validate"
                                            : "Hakiki",
                                        onPressButton: () async {
                                          await onValidateToken(
                                              _searchController.text);

                                          showDialog(
                                              barrierDismissible: false,
                                              builder:
                                                  (context) => new AlertDialog(
                                                        title: new Text(scanQrCode
                                                                .isLoading
                                                            ? "Verifying"
                                                            : "Finish Verification"),
                                                        content: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          children: [
                                                            scanQrCode.isLoading
                                                                ? CircularProgressIndicator()
                                                                : Icon(
                                                                    Icons
                                                                        .mark_email_read_sharp,
                                                                    size: 60,
                                                                    color: Colors

                                                                    
                                                                        .greenAccent,
                                                                  ),
                                                            scanQrCode.isLoading
                                                                ? Text(
                                                                    " Loading ....")
                                                                : EnterTokenButton(
                                                                    title:
                                                                        "Show Report ",
                                                                    onPressButton:
                                                                        () =>
                                                                            onViewProductScanReport(),
                                                                    width: MediaQuery.of(context).size.width /
                                                                            4 +
                                                                        50,
                                                                  )
                                                          ],
                                                        ),
                                                      ),
                                              context: context);
                                        })
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ))),
            body: ListView(
              children: [
                                             

                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Material(
                    type: MaterialType.card,
                    elevation: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SpacerComponent(
                            height: MediaQuery.of(context).size.height / 15),
                        CircleAvatar(
                          backgroundColor: Color(0xFFF8F4FF),
                          radius: MediaQuery.of(context).size.height / 8,
                          child: scanQrCode.isQRLoading ? CircularProgressIndicator(
                            backgroundColor:  Color(0xFF264653),
                          ):Icon(
                            Icons.qr_code_scanner,
                            size: 130,
                            color: Colors.grey[400],
                          ),
                        ),
                        SpacerComponent(
                            height: MediaQuery.of(context).size.height / 30),
                        Expanded(
                          child: Text(
                           languageState.currentLanguage == LanguageContant().english ?    "This QR code is very safe share to any others" : "QR code hii ni salama tumia na wengine"),
                        )
                      ],
                    ),                                                                                                                   
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height / 27),
                    height: MediaQuery.of(context).size.height / 12,
                    child: Material(
                      type: MaterialType.card,
                      elevation: 0,
                      child: EnterTokenButton(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 16,
                        title:languageState.currentLanguage == LanguageContant().english ? "Scan Code" : "Hakiki QR",
                        onPressButton: () => onStartScanQrCoe(),
                      ),
                    )),
              ],
            ));
      });
    });
  }
}
