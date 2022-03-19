import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          // getTextStyles: (value) => const TextStyle(
          //   color: Color(0xff68737d),
          //   fontWeight: FontWeight.bold,
          //   fontSize: 16,
          // ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'Feb';
              case 3:
                return 'March';
              case 4:
                return 'Apr';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          // getTextStyles: (value) => const TextStyle(
          //   color: Color(0xff67727d),
          //   fontWeight: FontWeight.bold,
          //   fontSize: 15,
          // ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 30:
                return '30';
              case 31:
                return '31';
              case 32:
                return '32';
            }
            return '';
          },
          reservedSize: 35,
          margin: 12,
        ),
      );
}
