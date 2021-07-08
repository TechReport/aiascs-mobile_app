import 'package:aiascs_mobile/app_state/product_state.dart';
import 'package:aiascs_mobile/app_state/unAuthorizedProduct_State.dart';
import 'package:aiascs_mobile/modules/services_module/component/Visualisation_analysing_report.dart';
import 'package:aiascs_mobile/modules/services_module/component/report_selection_top_bar.dart';
import 'package:aiascs_mobile/modules/services_module/reports/components/Visualisation_graph.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllReports extends StatefulWidget {
  @override
  _AllReportsState createState() => _AllReportsState();
}

class _AllReportsState extends State<AllReports> {
  double fake, genuine, others;

  @override
  void initState() {
    super.initState();
    genuine =
        Provider.of<ProductState>(context, listen: false).countGenuineProduct;
    fake = Provider.of<ProductState>(context, listen: false).countFakeProduct;
    others = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductState>(
        builder: (BuildContext context, productState, child) {
      return Consumer<UnAuthorizedProductState>(
          builder: (BuildContext context, unAuthorizedState, child) {
        return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReportSelectinTopBar(
                isClicked: productState.isVisual,
                onSelectGeneralReport: () {
                  setState(() {
                    productState.setVisualonReportTopBar(true);
                  });
                },
                onSelectVisualisation: () {
                  setState(() {
                    productState.setVisualonReportTopBar(false);

                  });
                },
              ),
             productState.isVisual ?
             
             Container(
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(0),
      child: Material(
        color:  Color(0xFF264653),
        elevation: 0,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text("Total Products",style: TextStyle(color: Colors.white,fontSize: 15),),
          Text(
            (productState.countFakeProduct+productState.countGenuineProduct+unAuthorizedState.listUnAuthProduct.length).toString()
            ,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
        ],
      ),
    ),
       Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Text("Fake Products",style: TextStyle(color: Colors.white,fontSize: 15),),
          Text(
            
                  (productState.countFakeProduct+unAuthorizedState.listUnAuthProduct.length).toString()
            ,style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),)
        ],
      ),
    )
  ],
),
Container(
  color: Colors.transparent  ,
        padding: EdgeInsets.only(top: 10),

  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height/4,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Divider(),
      Row(
        children: [
Expanded(
  flex: 1,
  child: Icon(Icons.unarchive_outlined,size: 20,color: Colors.white,),
)
,
Expanded(
  flex: 3,
  child: Column(children: [
  Text("UnAuthorized products",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal),),
  // Icon(Icons.linear_scale_sharp,size: 40,color: Colors.green,)
],)),

Expanded(
  flex: 1,
  child: Text(unAuthorizedState.listUnAuthProduct.length.toString() ,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal),))
      ],),
      Divider(),
          Row(children: [
Expanded(
  flex: 1,
  child: Icon(Icons.signal_cellular_no_sim_sharp,size: 20,color: Colors.white,),
)
,
Expanded(
  flex: 3,
  child: Column(children: [
  Text("Fake products",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal),),
  // Icon(Icons.linear_scale_sharp,size: 40,color: Colors.green,)
],)),

Expanded(
  flex: 1,
  child: Text((productState.countFakeProduct + unAuthorizedState.listUnAuthProduct.length).toString(),style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal)))
      ],),
       Divider(),
          Row(children: [
Expanded(
  flex: 1,
  child: Icon(Icons.baby_changing_station_outlined,size: 20,color: Colors.white,),
)
,
Expanded(
  flex: 3,
  child: Column(children: [
  Text("Genuine products",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal)),
  // Icon(Icons.linear_scale_sharp,size: 40,color: Colors.green,)
],)),

Expanded(
  flex: 1,
  child: Text(productState.countGenuineProduct.toString(),style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.normal)))
      ],)
    ],
  ),
)

          ],
        ) 
      ),
    )
             
             : VisualisationGraph(
                genuine: genuine,
                fake: fake,
                others: others,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(
                  "Analysing",
                  style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
              ),
              VisualisationAnallysingReport()
            ],
          ),
        ),
      );
      });
    });
  }
}
