part of 'app.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 80);

var theme = ThemeData().copyWith(
  dividerColor: darkBlue,
  primaryColor: darkBlue,
  colorScheme: const ColorScheme.light().copyWith(primary: darkBlue),
  scaffoldBackgroundColor: Colors.grey.shade100,
  iconTheme: const IconThemeData(color: darkBlue),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: darkBlue),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: darkBlue),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: darkBlue)),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    circularTrackColor: darkBlue.withOpacity(0.3),
    color: darkBlue,
  ),
  sliderTheme: SliderThemeData(
    thumbColor: darkBlue,
    activeTrackColor: darkBlue,
    inactiveTrackColor: darkBlue.withOpacity(0.2),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    color: Colors.transparent,
    elevation: 0,
    foregroundColor: darkBlue,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: darkBlue,
    elevation: 0,
    showUnselectedLabels: true,
    unselectedLabelStyle: TextStyle(fontSize: 16, color: Colors.white),
    unselectedIconTheme: IconThemeData(color: Colors.white, size: 36),
    selectedIconTheme: IconThemeData(size: 36),
    selectedLabelStyle: TextStyle(fontSize: 16),
    selectedItemColor: Colors.yellow,
  ),
);

var darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: darkBlue,
  colorScheme: const ColorScheme.dark().copyWith(primary: Colors.teal.shade200),
  dividerColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: TextStyle(color: Colors.teal.shade200),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.teal.shade200),
    ),
  ),
  sliderTheme: const SliderThemeData(
    thumbColor: Colors.white,
    activeTrackColor: Colors.white,
    inactiveTrackColor: Colors.white30,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    circularTrackColor: Colors.white12,
    color: Colors.orange.shade200,
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    color: Colors.transparent,
    elevation: 0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    elevation: 0,
    showUnselectedLabels: true,
    unselectedLabelStyle: TextStyle(fontSize: 16, color: darkBlue),
    unselectedIconTheme: IconThemeData(color: darkBlue, size: 36),
    selectedIconTheme: IconThemeData(size: 36),
    selectedLabelStyle: TextStyle(fontSize: 16),
    selectedItemColor: Colors.grey,
  ),
);
