

import 'package:aiascs_mobile/core/components/Line_separator.dart';
import 'package:aiascs_mobile/models/Service_Pop_up_menu.dart';
import 'package:flutter/material.dart';

class PopUpMenuComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
              children: ServicePopUpMenu.getDefaultServicePopUpMenus()
                  .map((ServicePopUpMenu popUpMenu) => Container(
                          child: Visibility(                       
                        child: GestureDetector(
                          onTap: () => {Navigator.pop(context, popUpMenu)},
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 15),
                                    child: Text(
                                      popUpMenu.name,
                                      style: TextStyle(
                                          color: popUpMenu.color,
                                          fontSize: 14.0,
                                          fontWeight: popUpMenu.fontWeight),
                                    ),
                                  )
                                ],
                              ),
                              LineSeperator(
                                color: Color(0xFFE0E6E0),
                                height: 1,
                              )
                            ],
                          ),
                        ),
                      )))
                  .toList(),
            );
  }
}