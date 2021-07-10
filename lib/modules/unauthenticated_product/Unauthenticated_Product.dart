import 'dart:io';
import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/app_state/unAuthorizedProduct_State.dart';
import 'package:aiascs_mobile/core/components/enter_token_button.dart';
import 'package:aiascs_mobile/core/utils/app_util.dart';
import 'package:aiascs_mobile/core/utils/constant/Language_Contant.dart';
import 'package:aiascs_mobile/modules/services_module/product_module/product_invetory_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

File _image;

class UnAuthenticatedProduct extends StatefulWidget {
  @override
  State createState() => _UnAuthenticatedProductState();
}

class _UnAuthenticatedProductState extends State<UnAuthenticatedProduct> {
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController _photoController = new TextEditingController();
  TextEditingController _productNameController = new TextEditingController();
  TextEditingController _companyNameController = new TextEditingController();
  TextEditingController _locationController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();

  GlobalKey<FormState> _key = new GlobalKey();
  AutovalidateMode _validate = AutovalidateMode.disabled;
  String firstName,
      lastName,
      email,
      mobile,
      password,
      confirmPassword,
      schoolName;
  //initialize scale factor for image zoom manipulation using matrix manipulation by change each pixel accordingly
  double _scale = 1.0;
  double _previousScale = 1.0;
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      retrieveLostData();
    }

    return Consumer<LanguageState>(
        builder: (BuildContext context, languageState, child) {
      return Consumer<UnAuthorizedProductState>(
          builder: (BuildContext context, unAuthorizedProductState, child) {
        return Scaffold(
            body: SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
            child: new Form(
              key: _key,
              autovalidateMode: _validate,
              child: new Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 32, right: 8, bottom: 8),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if (_image == null) {
                            } else {}
                          },
                          child: Container(
                            height:
                                MediaQuery.of(context).size.height / 4 + 100,
                            width: MediaQuery.of(context).size.width,
                            child: Material(
                              elevation: 2,
                              type: MaterialType.card,
                              child: SizedBox(
                                width: 170,
                                height: 170,
                                child: _image == null
                                    ? GestureDetector(
                                        onTap: _onCameraClick,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.camera_alt,
                                              color: Color(0xFF264653),
                                            ),
                                            Text(
                                              languageState.currentLanguage ==
                                                      LanguageContant().english
                                                  ? "Tap to Capture or Select Photo"
                                                  : "Bonyeza Hapa Kuchagua au Kupiga Picha",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          ],
                                        ),
                                      )
                                    : Image.file(
                                        _image,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        _image != null
                            ? Positioned(
                                left: 80,
                                right: 0,
                                child: FloatingActionButton(
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Color(0xFF264653),
                                    ),
                                    mini: true,
                                    onPressed: _onCameraClick),
                              )
                            : Text("")
                      ],
                    ),
                  ),
                  ConstrainedBox(
                      constraints: BoxConstraints(minWidth: double.infinity),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, right: 8.0, left: 8.0),
                          child: TextFormField(
                              controller: _productNameController,
                              validator: (value) {},
                              onSaved: (String val) {
                                firstName = val;
                              },
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) =>
                                  FocusScope.of(context).nextFocus(),
                              decoration: InputDecoration(
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  fillColor: Colors.white,
                                  hintText: languageState.currentLanguage ==
                                          LanguageContant().english
                                      ? 'Enter Product Name'
                                      : " Ingiiza Jina la Bidhaa",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: Color(0xFF264653),
                                          width: 2.0)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ))))),
                  ConstrainedBox(
                      constraints: BoxConstraints(minWidth: double.infinity),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 16.0, right: 8.0, left: 8.0),
                          child: TextFormField(
                              controller: _companyNameController,
                              validator: (value) {},
                              onSaved: (String val) {
                                lastName = val;
                              },
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) =>
                                  FocusScope.of(context).nextFocus(),
                              decoration: InputDecoration(
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  fillColor: Colors.white,
                                  hintText: languageState.currentLanguage ==
                                          LanguageContant().english
                                      ? 'Enter Company Name'
                                      : "Ingiiza Jina la Kampuni",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: Color(0xFF264653),
                                          width: 2.0)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ))))),
                  // ConstrainedBox(
                  //     constraints: BoxConstraints(minWidth: double.infinity),
                  //     child: Padding(
                  //         padding: const EdgeInsets.only(
                  //             top: 16.0, right: 8.0, left: 8.0),
                  //         child: TextFormField(
                  //             keyboardType: TextInputType.name,
                  //             controller: _locationController,
                  //             textInputAction: TextInputAction.next,
                  //             onFieldSubmitted: (_) =>
                  //                 FocusScope.of(context).nextFocus(),
                  //             validator: (value) {},
                  //             onSaved: (String val) {
                  //               mobile = val;
                  //             },
                  //             decoration: InputDecoration(
                  //                 contentPadding: new EdgeInsets.symmetric(
                  //                     vertical: 8, horizontal: 16),
                  //                 fillColor: Colors.white,
                  //                 hintText: languageState.currentLanguage ==
                  //                         LanguageContant().english
                  //                     ? 'Location'
                  //                     : "Eneo",
                  //                 hintStyle: TextStyle(color: Colors.grey),
                  //                 focusedBorder: OutlineInputBorder(
                  //                     borderRadius: BorderRadius.circular(25.0),
                  //                     borderSide: BorderSide(
                  //                         color: Color(0xFF264653),
                  //                         width: 2.0)),
                  //                 border: OutlineInputBorder(
                  //                   borderRadius: BorderRadius.circular(25.0),
                  //                 ))))),
                  ConstrainedBox(
                      constraints: BoxConstraints(minWidth: double.infinity),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 26.0, right: 8.0, left: 8.0),
                          child: TextFormField(
                              controller: _descriptionController,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              maxLength: 1000,
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) =>
                                  FocusScope.of(context).nextFocus(),
                              validator: (value) {},
                              onSaved: (String val) {
                                mobile = val;
                              },
                              decoration: InputDecoration(
                                  contentPadding: new EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16),
                                  fillColor: Colors.white,
                                  hintText: languageState.currentLanguage ==
                                          LanguageContant().english
                                      ? 'Enter Description here'
                                      : "Ingiiza Maelezo Hapa",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                          color: Color(0xFF264653),
                                          width: 2.0)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ))))),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 40.0, left: 40.0, top: 40.0),
                    child: ConstrainedBox(
                      constraints:
                          const BoxConstraints(minWidth: double.infinity),
                      child: unAuthorizedProductState.isLoading
                          ? CircularProgressIndicator()
                          : Container(
                              margin: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height / 27),
                              height: MediaQuery.of(context).size.height / 12,
                              child: Material(
                                type: MaterialType.card,
                                elevation: 0,
                                child: EnterTokenButton(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height:
                                      MediaQuery.of(context).size.height / 16,
                                  title: languageState.currentLanguage ==
                                          LanguageContant().english
                                      ? "Submit"
                                      : "Kusanya",
                                  onPressButton: () async {
                                    if (_photoController.text.isNotEmpty ||
                                        _companyNameController
                                            .text.isNotEmpty ||
                                        _descriptionController
                                            .text.isNotEmpty ||
                                        _productNameController
                                            .text.isNotEmpty) {
                                      _key.currentState.save();
                                      await unAuthorizedProductState
                                          .onPostProduct(
                                              _photoController.text,
                                              _companyNameController.text,
                                              _descriptionController.text,
                                              _productNameController.text);
                                      Navigator.push(
                                          context,
                                          new MaterialPageRoute(
                                              builder: (context) =>
                                                  new ProductInvetoryService()));
                                    } else {
                                      return AppUtil.showToastMessage(
                                          message:
                                              "Form Empty are not allowed");
                                    }
                                    setState(() {
                                      _photoController.text = "";
                                      _companyNameController.text = "";
                                      _descriptionController.text = "";
                                      _productNameController.text = "";
                                      _locationController.text = " ";
                                    });
                                  },
                                ),
                              )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      });
    });
  }

  Future<void> retrieveLostData() async {
    final LostData response = await _imagePicker.getLostData();
    if (response == null) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _image = File(response.file.path);
        _photoController.text = response.file.path;
      });
    }
  }

  _onCameraClick() {
    final action = CupertinoActionSheet(
      message: Text(
        Provider.of<LanguageState>(context, listen: false).currentLanguage ==
                LanguageContant().english
            ? "Add profile picture"
            : "Weka Picha ya Bidhaa",
        style: TextStyle(fontSize: 15.0),
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text(Provider.of<LanguageState>(context, listen: false)
                      .currentLanguage ==
                  LanguageContant().english
              ? "Choose from gallery"
              : "Chagua kutoka kwa picha zingine"),
          isDefaultAction: false,
          onPressed: () async {
            Navigator.pop(context);
            PickedFile image =
                await _imagePicker.getImage(source: ImageSource.gallery);
            if (image != null)
              setState(() {
                _image = File(image.path);
                _photoController.text = image.path;
              });
          },
        ),
        CupertinoActionSheetAction(
          child: Text(Provider.of<LanguageState>(context, listen: false)
                      .currentLanguage ==
                  LanguageContant().english
              ? "Take a picture"
              : "Piga picha"),
          isDestructiveAction: false,
          onPressed: () async {
            Navigator.pop(context);
            PickedFile image =
                await _imagePicker.getImage(source: ImageSource.camera);
            if (image != null)
              setState(() {
                _image = File(image.path);
              });
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text(Provider.of<LanguageState>(context, listen: false)
                    .currentLanguage ==
                LanguageContant().english
            ? "Cancel"
            : "Acha"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    showCupertinoModalPopup(context: context, builder: (context) => action);
  }

  _sendToServer() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();
    } else {
      setState(() {
        _validate = AutovalidateMode.onUserInteraction;
      });
    }
  }

  @override
  void dispose() {
    TextEditingController().dispose();
    _image = null;
    super.dispose();
  }
}
