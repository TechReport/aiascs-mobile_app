import 'package:aiascs_mobile/models/Product.dart';
import 'package:flutter/material.dart';

class ProductInvetoryServiceReportCard extends StatelessWidget {
  final Product product;
final int productIndex;
  ProductInvetoryServiceReportCard(
      {
        @required this.product,
        @required this.productIndex
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
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
                    child: Text(product.name,
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
              margin: EdgeInsets.only(top: 2),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Product Id                  : "),                  
                   Expanded(
      child: Text(product.id, maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.justify,),
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
                  Text("Token                          : "),
                     Expanded(
      child: Text(product.token, maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.justify,),
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
                  Text(
                    
                    "ExpireDate                  : "),
                  Text(product.expiryDate,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
