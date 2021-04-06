import 'package:aiascs_mobile/core/components/Line_separator.dart';
import 'package:flutter/material.dart';

class InfoTopHeader extends StatelessWidget {
  const InfoTopHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material(
          type: MaterialType.card,
          elevation: 1.0,
          child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Text(
                              "Name",
                              style: TextStyle().copyWith(
                                  color: Color(0xFF1A3518),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 5.0),
                            child: Text(
                              "Danford Kija David",
                              style: TextStyle().copyWith(
                                  color: Color(0xFF1A3518),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: LineSeperator(color: Color(0XFFECF5EC)),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Field ',
                                  style: TextStyle().copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF92A791),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Morogoro",
                                      style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF9FB9CC),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: RichText(
                                text: TextSpan(
                                  text: 'Status ',
                                  style: TextStyle().copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF92A791),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Quality Controller",
                                      style: TextStyle().copyWith(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF9FB9CC),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]))
                ],
              )),
        
    );
  }
}
