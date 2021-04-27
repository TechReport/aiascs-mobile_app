
import 'package:flutter/material.dart';

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
                        !isClicked ?  Color(0xFF9FB9CC) : Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                  ),
                  onPressed: onSelectVisualisation,
                  child: Text(
                    'Visualisation',
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
                        isClicked ?  Color(0xFF9FB9CC) : Colors.transparent,
                    padding: EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 5.0,
                    ),
                  ),
                  onPressed: onSelectGeneralReport,
                  child: Text(
                    'General Report',
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
  }
}