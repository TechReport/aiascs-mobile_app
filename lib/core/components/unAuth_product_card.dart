import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/core/utils/constant/Language_Contant.dart';
import 'package:aiascs_mobile/models/UnAuthorized_Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UnAuthProductInvetoryServiceReportCard extends StatelessWidget {
  final UnAuthorizedProduct product;
  final int productIndex;
  UnAuthProductInvetoryServiceReportCard(
      {@required this.product, @required this.productIndex});
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageState>(
        builder: (BuildContext context, languageState, child) {
      return Container(
        height: MediaQuery.of(context).size.height / 2 - 30,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        margin: EdgeInsets.all(10),
        child: Material(
          type: MaterialType.card,
          elevation: 1,
          child: Column(
            children: [
              Container(
                color: Color(0xFF264653),
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text("UnAuthorizedProduct",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                    ),
                    Text("$productIndex",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Image.network(
                  product.photoUrl,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 6,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("name                         : "),
                    Expanded(
                      child: Text(
                        product.name ?? "No name",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Company Name     :"),
                    Expanded(
                      child: Text(
                        product.companyName ?? "No company Name",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 2),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(languageState.currentLanguage == LanguageContant().english ? "Identifier                :         " :
                    "Identifier                :         "
                    ),
                    Text(
                      product.id ?? "                    NO value",
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
