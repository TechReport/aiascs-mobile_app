import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/product_state.dart';
import 'package:aiascs_mobile/app_state/scan_qr_code_state.dart';
import 'package:aiascs_mobile/core/components/spacer_component.dart';
import 'package:aiascs_mobile/models/UnAuthorized_Product.dart';
import 'package:aiascs_mobile/modules/home/components/bottom_navigation_bar_options.dart';
import 'package:aiascs_mobile/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnAuthorizedProductAuthorizedProfile extends StatefulWidget {
  final UnAuthorizedProduct product;
  final bool isReport;

  UnAuthorizedProductAuthorizedProfile({@required this.product, this.isReport = false});

  @override
  _ProductAuthorizedProfileState createState() => _ProductAuthorizedProfileState();
}

class _ProductAuthorizedProfileState extends State<UnAuthorizedProductAuthorizedProfile> {
  
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
    return Consumer<ScanQrCodeState>(
      //ProductState
        builder: (BuildContext context, scanQrCode, child) {
      return Consumer<ProductState>(
        builder: (BuildContext context,productState,child){
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
                  .setCurrentAppBarTitle("Report");
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView(
          children: [
            // ProductReportHeader(status:widget.product.isRevoked =="true"? "Fake" :"Genuine" ,),
              Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Image.network(widget.product.photoUrl,fit: BoxFit.cover,height: MediaQuery.of(context).size.height / 6,),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                height: MediaQuery.of(context).size.height / 2 + 1,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                              "name",
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
                              widget.product.name,
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                          Divider(),
                           Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                              "Company ",
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
                            widget.product.companyName,
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                          Divider(),
                           Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                              "Descriptions ",
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
                            widget.product.descriptions,
                                style: TextStyle().copyWith(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                           Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                              "Status",
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
                            "FAKE",
                                style: TextStyle().copyWith(
                                  fontSize: 24.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      
                  ],
                )
            )),
            SpacerComponent(height: MediaQuery.of(context).size.height / 53),
         
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
  }
}
