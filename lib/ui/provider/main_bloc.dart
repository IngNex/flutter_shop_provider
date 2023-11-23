import 'package:flutter/material.dart';
import 'package:flutter_apptesis/clean_architecture/domain/repository/local_storage_repository.dart';
import 'package:flutter_apptesis/ui/common/theme.dart';

class MainBloc extends ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;

  MainBloc({
    required this.localRepositoryInterface,
  });

  ThemeData currentTheme = lightTheme;

  void loadTheme() async {
    final isDark = await localRepositoryInterface.isDarkMode() ?? false;
    updateTheme(isDark ? darkTheme : lightTheme);
  }

  void updateTheme(ThemeData theme) {
    currentTheme = theme;
    notifyListeners();
  }
}
