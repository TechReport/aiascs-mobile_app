import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/core/components/enter_token_button.dart';
import 'package:aiascs_mobile/core/components/spacer_component.dart';
import 'package:aiascs_mobile/modules/home/components/bottom_navigation_bar_options.dart';
import 'package:aiascs_mobile/modules/scan_qr_code/components/qr_code_header.dart';
import 'package:aiascs_mobile/modules/scan_qr_code/scan_Qr_Code.dart';
import 'package:aiascs_mobile/modules/services_module/Service_Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanProductReport extends StatefulWidget {
  @override
  _ScanProductReportState createState() => _ScanProductReportState();
}

class _ScanProductReportState extends State<ScanProductReport> {
  @override
  void initState() {
    super.initState();
    Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentSelectedBottomBarIndex(1);
  }

  List<Widget> _widgetOptions = [
    ServiceHome(),
    ScanQrCode(),
    Text("3"),
    Text("4"),
  ];

  @override
  Widget build(BuildContext context) {
    int _selectedindex = Provider.of<AppBarTitleState>(context, listen: false)
        .currentSelectedBottomBar;

    void _update_page(int value) {
      setState(() {
        _selectedindex = value;
      });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
      color:  Color(0xFF9FB9CC)
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute (builder: (context) => new ScanQrCode()), (route) => false);

          },
        ),
      ),
      body: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

                Text("FAKE PRODUCT",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                ),
                
                ),


            Icon(
              Icons.cancel_presentation_sharp,
              size: 32,
              color: Color(0xFF9FB9CC),
            ),
        
          ],
        ),
        children: [
          QRCodeHeader(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0),
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
            child: Column(children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "Company Name",
                    style: TextStyle().copyWith(
                        fontSize: 12.0,
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
                    "online",
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "Company Name",
                    style: TextStyle().copyWith(
                        fontSize: 12.0,
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
                    "online",
                    style: TextStyle().copyWith(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              
              ],
            ),
          
            ],),
          ),
           SpacerComponent(height: MediaQuery.of(context).size.height/4),
          EnterTokenButton(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 16,
                    title: "Revoke Product",
                    onPressButton: (){},
                  )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF9FB9CC),
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
  }
}
