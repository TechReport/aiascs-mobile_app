import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/searching_state.dart';
import 'package:aiascs_mobile/core/components/product_authorized_profile.dart';
import 'package:aiascs_mobile/core/components/product_invetory_service_report_card.dart';
import 'package:aiascs_mobile/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int productCount = 0;
    return Consumer<SearchingState>(
        builder: (BuildContext context, searchingState, child) {
      return Scaffold(
        body: ListView(
          children: searchingState.searchedProduct.map((Product product) {
            productCount++;
            return GestureDetector(
              onTap: () {
                Provider.of<AppBarTitleState>(context, listen: false)
                    .setCurrentAppBarTitle("Product Details");
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ProductAuthorizedProfile(
                              product: product,
                              isReport: true,
                            )));
              },
              child: ProductInvetoryServiceReportCard(
                product: product,
                productIndex: productCount,
              ),
            );
          }).toList(),
        ),
      );
    });
  }
}
