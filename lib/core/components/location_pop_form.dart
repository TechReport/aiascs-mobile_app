import 'package:aiascs_mobile/app_state/location_state.dart';
import 'package:aiascs_mobile/core/components/drop_down_drip.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LocationPopUpForm extends StatefulWidget {
  const LocationPopUpForm({Key key}) : super(key: key);

  @override
  _LocationPopUpFormState createState() => _LocationPopUpFormState();
}

class _LocationPopUpFormState extends State<LocationPopUpForm> {
  String dropdownValue = 'Gender';
  String districtname = 'District';
  String regionname = 'Region';
  String wardname = 'Ward';

  @override
  void initState() {
    super.initState();
    initSetup();
  }

  @override
  void dispose() {
    super.dispose();
  }

  initSetup() async {
    await Provider.of<LocationState>(context, listen: false).onGetRegions();
    await Provider.of<LocationState>(context, listen: false).onGetDistrict();
    await Provider.of<LocationState>(context, listen: false).onGetWard();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationState>(builder: (context, locationState, child) {
      return Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropDownStrip(
                    dropdownitem: districtname,
                    onChange: (newValue) {
                      setState(() async {
                        districtname = newValue;
                        await locationState.getSelectedDistrict(districtname);
                      });
                    },
                    item: locationState.districtListString,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropDownStrip(
                    dropdownitem: wardname,
                    onChange: (newValue) {
                      setState(() {
                        wardname = newValue;
                      });
                    },
                    item: locationState.wardListString,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 64,
                ),
                TextButton(
                    onPressed: () {
                      print(" region " +
                          regionname +
                          "   ward  " +
                          wardname +
                          "   district " +
                          districtname);
                      // Map<String, dynamic> data = {
                      //   "fname": _firstnameController.text ?? "",
                      //   "mname": _secondnameController.text ?? "",
                      //   "lname": _lastnameController.text ?? "",
                      //   "gender": dropdownValue ?? "",
                      //   "region": regionname ?? "",
                      //   "district": districtname ?? "",
                      //   "ward": wardname ?? "",
                      //   "bdate": _textEditingController.text ?? "",
                      // };
                      // authState.setValueonMapper(data);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => NextRegistration(),
                      //     ));
                    },
                    child: Text(
                      'Tap for Next',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
