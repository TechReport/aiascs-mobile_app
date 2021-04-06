import 'package:aiascs_mobile/app_state/scan_qr_code_state.dart';
import 'package:aiascs_mobile/core/components/enter_token_button.dart';
import 'package:aiascs_mobile/core/components/spacer_component.dart';
import 'package:aiascs_mobile/modules/scan_qr_code/components/qr_code_validate.dart';
import 'package:aiascs_mobile/modules/scan_qr_code/scan_product_report.dart';
import 'package:provider/provider.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanQrCode extends StatefulWidget {
  @override
  _ScanQrCodeState createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {
  String result = '';
  void onValidateToken() {
    print("on search token validate");
  }


void onViewProductScanReport(){

  Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new ScanProductReport()));


  
}
  void onStartScanQrCoe() async {
    Provider.of<ScanQrCodeState>(context, listen: false).setIsLoading(true);
  
    String cameraScanResult = await scanner.scan();
      if(Provider.of<ScanQrCodeState>(context, listen: false).isLoading)
    {



      showDialog(
        barrierDismissible: false,
        builder: (context) => new AlertDialog(
      title: new Text(Provider.of<ScanQrCodeState>(context, listen: false).isLoading ? "Verifying"  : "Finish Verification"),
      content:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        Provider.of<ScanQrCodeState>(context, listen: false).isLoading ?  CircularProgressIndicator() : Icon(Icons.mark_email_read_sharp,size: 60,color: Colors.greenAccent,),

             Provider.of<ScanQrCodeState>(context, listen: false).isLoading ?  Text(" Loading ....") :       EnterTokenButton(
                              title: "Show Report ",
                              onPressButton: () => onViewProductScanReport(),
                              width: MediaQuery.of(context).size.width/4 + 50,
                            )
          
        ],
      ),
    ), context: context
);
Provider.of<ScanQrCodeState>(context, listen: false).setIsLoading(false);
    }
    if (QrCodeValidate.validateQrcode(cameraScanResult)) {
      print("the authenticated messsage is" + cameraScanResult);
    } else {}
  //  Provider.of<ScanQrCodeState>(context, listen: false).setIsLoading(false);
  }

  TextEditingController _searchController;
  @override
  Widget build(BuildContext context) {
    return Consumer<ScanQrCodeState>(builder: (BuildContext context,scanQrCode ,child)  {
      return 
          Scaffold(
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
                            child: TextField(
                                cursorColor: Colors.blue,
                                keyboardAppearance: Brightness.light,
                                keyboardType: TextInputType.text,
                                controller: _searchController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.qr_code_rounded),
                                  border: InputBorder.none,
                                  labelText: 'Enter token ',
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
                            EnterTokenButton(
                              title: "Validate",
                              onPressButton: () => onValidateToken(),
                            )
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
                      child: Icon(
                        Icons.qr_code_scanner,
                        size: 130,
                        color: Colors.grey[400],
                      ),
                    ),
                    SpacerComponent(
                        height: MediaQuery.of(context).size.height / 30),
                    Expanded(
                      child:
                          Text("This QR code is very safe share to any others"),
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
                  child:  EnterTokenButton(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 16,
                    title: "Scan Code",
                    onPressButton: () => onStartScanQrCoe(),
                  ),
                )),
          ],
        ));
    });


  }
}
