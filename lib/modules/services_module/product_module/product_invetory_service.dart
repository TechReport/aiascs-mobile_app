import 'package:aiascs_mobile/app_state/app_bar_titile.dart';
import 'package:aiascs_mobile/app_state/product_state.dart';
import 'package:aiascs_mobile/app_state/unAuthorizedProduct_State.dart';
import 'package:aiascs_mobile/core/components/product_authorized_profile.dart';
import 'package:aiascs_mobile/core/components/product_invetory_service_report_card.dart';
import 'package:aiascs_mobile/core/components/unAuth_product_card.dart';
import 'package:aiascs_mobile/core/components/unAuthorizedProductProfile.dart';
import 'package:aiascs_mobile/models/Product.dart';
import 'package:aiascs_mobile/models/UnAuthorized_Product.dart';
import 'package:aiascs_mobile/modules/home/components/bottom_navigation_bar_options.dart';
import 'package:aiascs_mobile/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductInvetoryService extends StatefulWidget {
  @override
  _ProductInvetoryServiceState createState() => _ProductInvetoryServiceState();
}

class _ProductInvetoryServiceState extends State<ProductInvetoryService> {
  int _selectedindex;

  @override
  void initState() {
    super.initState();
    Provider.of<AppBarTitleState>(context, listen: false)
        .setCurrentSelectedBottomBarIndex(0);
    _selectedindex = Provider.of<AppBarTitleState>(context, listen: false)
        .currentSelectedBottomBar;
    onGetData();
  }

  onGetData() async {
    await Provider.of<UnAuthorizedProductState>(context, listen: false)
        .onRetrieveUnAuthroduct();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    int productCount = 0;
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

    return Consumer<ProductState>(
        builder: (BuildContext context, productState, child) {
      List<Product> productList = productState.productList;
      return Consumer<UnAuthorizedProductState>(
          builder: (BuildContext context, unAuthproductState, child) {
        List<UnAuthorizedProduct> unAuthProductList =
            unAuthproductState.listUnAuthProduct;
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
                    .setCurrentAppBarTitle("Home");
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Home(
                            selectedIndex: Provider.of<AppBarTitleState>(
                                    context,
                                    listen: false)
                                .currentSelectedBottomBar)));
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ExpansionTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Authorized Products ",
                        style: TextStyle(
                          color: Color(0xFF264653),
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Icon(
                        Icons.computer_rounded,
                        size: 26,
                        color: Colors.grey[350],
                      ),
                    ],
                  ),
                  children: productList.map((Product product) {
                    productCount = productCount + 1;
                    return GestureDetector(
                      onTap: () {
                        Provider.of<AppBarTitleState>(context, listen: false)
                            .setCurrentAppBarTitle("Product Details");
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    new ProductAuthorizedProfile(
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
                ExpansionTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "UnAuthorized Products ",
                          style: TextStyle(
                            color: Color(0xFF264653),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        Icon(
                          Icons.cancel_presentation_sharp,
                          size: 26,
                          color: Colors.grey[350],
                        ),
                      ],
                    ),
                    children:
                        unAuthProductList.map((UnAuthorizedProduct product) {
                      return GestureDetector(
                        onTap: () async {
                          Provider.of<AppBarTitleState>(context, listen: false)
                              .setCurrentAppBarTitle("Product Details");
                          Provider.of<UnAuthorizedProductState>(context,
                                  listen: false)
                              .currentUnAuthiredProduct;
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      new UnAuthorizedProductAuthorizedProfile(
                                        product: product,
                                        isReport: true,
                                      )));
                        },
                        child: UnAuthProductInvetoryServiceReportCard(
                          product: product,
                          productIndex: productCount,
                        ),
                      );
                    }).toList()),
              ],
            ),
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
      });
    });
  }
}
