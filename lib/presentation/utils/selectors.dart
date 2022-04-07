import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_tags.dart';
import 'package:word_study_puzzle/common/constants/app_widget_keys.dart';
import 'package:word_study_puzzle/common/constants/calendar.dart';

class Selectors {
  static String selectActionTitle(String type) {
    if (type == WordsPageKeys.addWordKey) {
      return 'Word';
    } else if (type == WordsPageKeys.unexploredWordsKey) {
      return 'Study';
    } else if (type == WordsPageKeys.exploringWordsKey) {
      return 'Remove';
    } else {
      return 'Delete';
    }
  }

  static IconData selectActionIcon(String type) {
    if (type == WordsPageKeys.addWordKey) {
      return Icons.add;
    } else if (type == WordsPageKeys.unexploredWordsKey) {
      return Icons.explore;
    } else if (type == WordsPageKeys.exploringWordsKey) {
      return Icons.explore_off;
    } else {
      return Icons.delete;
    }
  }

  static String selectActionTag(String type) {
    if (type == WordsPageKeys.addWordKey) {
      return AppTags.heroAddWord;
    } else if (type == WordsPageKeys.unexploredWordsKey) {
      return AppTags.heroAddInExplore;
    } else if (type == WordsPageKeys.exploringWordsKey) {
      return AppTags.heroRemoveFromExplore;
    } else {
      return AppTags.heroDeleteWords;
    }
  }

  static String selectTitle(String type) {
    if (type == WordsPageKeys.exploringWordsKey) {
      return 'Studying';
    } else if (type == WordsPageKeys.unexploredWordsKey) {
      return 'Unstudied';
    } else {
      return 'Words';
    }
  }

  static String selectCellText(int index, int indexOfFirstDayMonth, int day) {
    if (index < daysOfWeek.length) {
      return daysOfWeek[index];
    } else if (index < indexOfFirstDayMonth) {
      return '';
    } else {
      return '$day';
    }
  }

  static TextStyle selectCellTextStyle(
      int index, double correctAnswerRate, bool isCurrentDate) {
    if (isCurrentDate) {
      return TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: correctAnswerRate > 0
              ? const Color(AppColors.whiteDefault)
              : null);
    }
    if (index < daysOfWeek.length) {
      return const TextStyle(
          fontSize: 8, fontWeight: FontWeight.w600, fontFamily: 'Verdana');
    } else {
      return TextStyle(
          fontSize: 13,
          color: correctAnswerRate > 0
              ? const Color(AppColors.whiteDefault)
              : null);
    }
  }

  static Color selectExploredColor(double rate) {
    if (rate == 0) {
      return Colors.transparent;
    } else if (rate <= 0.2) {
      return const Color(AppColors.color6);
    } else if (rate >= 0.2 && rate <= 0.4) {
      return const Color(AppColors.color5);
    } else if (rate >= 0.4 && rate <= 0.6) {
      return const Color(AppColors.color4);
    } else if (rate >= 0.6 && rate <= 0.8) {
      return const Color(AppColors.color3);
    } else {
      return const Color(AppColors.color2);
    }
  }

  static ThemeData selectTheme(bool darkThemeIsEnabled) {
    if (darkThemeIsEnabled) {
      return ThemeData(
        brightness: Brightness.dark,
        textTheme: ThemeData.dark().textTheme,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Color(AppColors.color9),
          backgroundColor: Colors.white24,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(AppColors.color2)),
          ),
        ),
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          textTheme: CupertinoTextThemeData(
              pickerTextStyle:
              TextStyle(color: Color(AppColors.whiteDefault), fontSize: 17)),
        ),
      );
    } else {
      return ThemeData(
        brightness: Brightness.light,
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: const Color(AppColors.color1),
              displayColor: const Color(AppColors.color1),
            ),
        iconTheme: const IconThemeData(color: Color(AppColors.color3)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Color(AppColors.color2),
          backgroundColor: Color(AppColors.whiteDefault),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          linearTrackColor: Color(AppColors.greyLight),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(AppColors.color2)),
          ),
        ),
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          textTheme: CupertinoTextThemeData(
              pickerTextStyle:
              TextStyle(color: Color(AppColors.color1), fontSize: 17)),
        ),
      );
    }
  }
}
