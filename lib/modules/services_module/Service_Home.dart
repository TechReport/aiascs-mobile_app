import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/models/transaction_service_card_model.dart';
import 'package:aiascs_mobile/modules/services_module/reports/reports_module.dart';
import 'package:aiascs_mobile/modules/services_module/component/info_top_bar.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceHome extends StatefulWidget {
  @override
  _ServiceHomeState createState() => _ServiceHomeState();
}

class _ServiceHomeState extends State<ServiceHome> {
  void onTransaction(String id) {
    switch (id) {
      case "report":
        onReport();
        break;
      case "feedback":
        onNotificatin();
        break;
      case "assign":
        onAssigns();
        break;
      case "chainstatus":
        onChainStatus();
        break;
      case "notification":
        onNotificatin();
        break;
      case "monitor":
        onMonitor();

        break;
      case "product":
        onProduct();
        break;
      default:
        print("Here are default settings");
    }
  }

  void onReport() {
    Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentAppBarTitle("Report");
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new ReportModule()));
  }

  void onFeedBack() {
      Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentAppBarTitle("Report");
    print("on feedback");
  }

  void onAdd() {
      Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentAppBarTitle("Report");
    print("on Add");
  }

  void onNotificatin() {
      Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentAppBarTitle("Report");
    print("on Notification");
  }

  void onChainStatus() {
      Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentAppBarTitle("Report");
    print("on ChainStatus");
  }

  void onAssigns() {
      Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentAppBarTitle("Report");
    print("on Assigns");
  }

  void onMonitor() {
      Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentAppBarTitle("Report");
    print("on monitor");
  }

  void onProduct() {
      Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentAppBarTitle("Report");
    print("on monitor");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InfoTopHeader(),
          Container(
              color: Color(0xFF9FB9CC),
              height: MediaQuery.of(context).size.width / 9,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Text(
                    "Last Sync     ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "    4/2/2021 10:21:18 AM",
                    style: TextStyle(
                        color: Colors.white,
                        wordSpacing: 4,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    "       Logs(3)",
                    style: TextStyle(
                        color: Colors.white,
                        wordSpacing: 4,
                        fontSize: 12,
                        fontWeight: FontWeight.normal),
                  )
                ],
              )),
          Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text("     Transactions",
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ]),
          Material(
            elevation: 0,
            child: Container(
              padding: EdgeInsets.all(13),
              color: Colors.grey[200],
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3 - 20,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //maxCrossAxisExtent: 200,
                      crossAxisCount: 4,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: TransactionServiceCardModel.defaultData().length,
                  itemBuilder:
                      (BuildContext context, int transactionCardPosition) {
                    List<TransactionServiceCardModel> cartDetails =
                        TransactionServiceCardModel.defaultData();
                    if (cartDetails[transactionCardPosition].title ==
                        "Notification") {
                      return GestureDetector(
                        onTap: () => onNotificatin(),
                        child: Badge(
                          elevation: 3,
                          badgeContent: Text(
                            "3",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          animationDuration: Duration(microseconds: 30),
                          badgeColor: Colors.yellow,
                          child: Container(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  cartDetails[transactionCardPosition].iconPath,
                                  color: Colors.grey[400],
                                ),
                                Text(
                                  cartDetails[transactionCardPosition].title,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () => onTransaction(
                          cartDetails[transactionCardPosition].id),
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              cartDetails[transactionCardPosition].iconPath,
                              color: Colors.grey[400],
                            ),
                            Text(
                              cartDetails[transactionCardPosition].title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    );
                  }),
            ),
          ),
          Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text("     Invetory",
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ]),
          Divider(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 10,
            color: Colors.transparent,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemExtent: 90,
                // padding: EdgeInsets.all(3),
                itemCount:
                    TransactionServiceCardModel.defaultInvetoryData().length,
                itemBuilder: (BuildContext context, int invetoryPostion) {
                  List<TransactionServiceCardModel> inveteryDetails =
                      TransactionServiceCardModel.defaultInvetoryData();
                  return GestureDetector(
                    onTap: () =>
                        onTransaction(inveteryDetails[invetoryPostion].id),
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            inveteryDetails[invetoryPostion].iconPath,
                            color: Colors.grey[400],
                          ),
                          Text(
                            inveteryDetails[invetoryPostion].title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
