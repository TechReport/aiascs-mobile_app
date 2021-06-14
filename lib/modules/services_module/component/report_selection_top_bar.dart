import 'package:aiascs_mobile/app_state/language_state.dart';
import 'package:aiascs_mobile/core/utils/constant/Language_Contant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportSelectinTopBar extends StatelessWidget {
  final VoidCallback onSelectVisualisation;
  final VoidCallback onSelectGeneralReport;
  final bool isClicked;

  ReportSelectinTopBar(
      {@required this.onSelectVisualisation,
      @required this.onSelectGeneralReport,
      this.isClicked = false});

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageState>(
        builder: (BuildContext context, languageState, child) {
      return ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.only(),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          !isClicked ? Color(0xFF264653) : Colors.transparent,
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 5.0,
                      ),
                    ),
                    onPressed: onSelectVisualisation,
                    child: Text(
                      languageState.currentLanguage == LanguageContant().english ? 'Visualisation' : "Tafsiri ya Graph",
                      style: TextStyle().copyWith(
                        fontSize: 14.0,
                        color: !isClicked ? Colors.white : Color(0xFF1A3518),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          isClicked ? Color(0xFF264653) : Colors.transparent,
                      padding: EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 5.0,
                      ),
                    ),
                    onPressed: onSelectGeneralReport,
                    child: Text(
                    languageState.currentLanguage == LanguageContant().english ? 'General Report' : "Repoti Yote" ,
                      style: TextStyle().copyWith(
                        fontSize: 14.0,
                        color: isClicked ? Colors.white : Color(0xFF1A3518),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
