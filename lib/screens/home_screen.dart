import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen_widgets.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  final HomeScreenWidgets homeScreenWidgets = HomeScreenWidgets();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 40),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  homeScreenWidgets.drawPurpleCircle(3, -0.3),
                  homeScreenWidgets.drawPurpleCircle(-3, -0.3),
                  homeScreenWidgets.drawOrangeSquare(0, -1.2),
                  homeScreenWidgets.produceGradientColor(100.0, 100.0),
                  homeScreenWidgets.displayWeatherInformation(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
