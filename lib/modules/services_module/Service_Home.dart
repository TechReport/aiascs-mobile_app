import 'package:aiascs_mobile/models/transaction_service_card_model.dart';
import 'package:aiascs_mobile/modules/services_module/component/info_top_bar.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class ServiceHome extends StatefulWidget {
  @override
  _ServiceHomeState createState() => _ServiceHomeState();
}

class _ServiceHomeState extends State<ServiceHome> {

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
                      return Badge(
                        elevation: 3,
                        badgeContent: Text(
                          "3",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
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
                      );
                    }
                    return Container(
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
             height: MediaQuery.of(context).size.height/15,
           ),
Container(
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height/10,
  color: Colors.transparent,
  child:    
          ListView.builder(
            shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemExtent: 90,
             // padding: EdgeInsets.all(3),
              itemCount:
                  TransactionServiceCardModel.defaultInvetoryData().length,
              itemBuilder: (BuildContext context, int invetoryPostion) {
                List<TransactionServiceCardModel> inveteryDetails =
                    TransactionServiceCardModel.defaultInvetoryData();
                return Container(
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
    
          );}),
)
     
        ],
      ),
    );
  }
}


            