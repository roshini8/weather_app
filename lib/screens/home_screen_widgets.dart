import 'dart:ui';
import 'package:assignment/bloc/weather_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class HomeScreenWidgets {
  Widget drawPurpleCircle(double start, double y) {
    return Align(
      alignment: AlignmentDirectional(start, y),
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepPurple,
        ),
      ),
    );
  }

  Widget drawOrangeSquare(double start, double y) {
    return Align(
      alignment: AlignmentDirectional(start, y),
      child: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
      ),
    );
  }

  Widget produceGradientColor(double sigmaX, double sigmaY) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        // Make sure to set a transparent color
      ),
    );
  }

  Widget displayCurrentLocation(String ?currentLocation) {
    return Text(
              '${currentLocation}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
              ),
            );
  }

  Widget displayGreeting() {
    return Text(
              'Good Morning',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            );
  }

  Widget displayWeatherInformation(BuildContext context) {
    return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSuccess) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                displayCurrentLocation(state.weather.areaName),
                displayGreeting(),
                getWeatherIcon(state.weather.weatherConditionCode!),
                displayWeatherTemperature(state.weather.temperature!.celsius!.round()),
                displayWeatherCondition(state.weather.weatherMain!),
                displayCurrentDate(state.weather.date!),
                Row(
                  children: [
                    displayWeatherDetails(
                      'assets/11.png',
                      'Sunrise',
                      DateFormat().add_jm().format(state.weather.sunrise!).toString(),
                    ),
                    displayWeatherDetails(
                      'assets/12.png',
                      'Sunset',
                      DateFormat().add_jm().format(state.weather.sunset!).toString(),
                    ),
                  ],
                ),
                displayDivider(),
                Row(
                  children: [
                    displayWeatherDetails(
                      'assets/14.png',
                      'Temp Min',
                      '${state.weather.tempMin!.celsius!.round()}°C',
                    ),
                    displayWeatherDetails(
                      'assets/14.png',
                      'Temp Max',
                      '${state.weather.tempMax!.celsius!.round()}°C',
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }



  Widget displayWeatherImage(){

    return Image.asset('assets/1.png');
  }

  Widget displayWeatherTemperature(int? temperature){

    return Center(
      child:Text(
        '${temperature}° C',
        style:TextStyle(
          color:Colors.white,
          fontSize: 55,
          fontWeight: FontWeight.w600
        ),
      )
    );
  }

  Widget displayWeatherCondition(String weatherCondition) {
    return Center(
      child: Text(
        weatherCondition,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget displayCurrentDate(DateTime currrentDateTime){

    return Center(
      child: Text(
        DateFormat('EEEE dd').add_jm().format(currrentDateTime),
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w300,
        ),
      ),

    );
  }

  Widget displayWeatherDetails(String filename, String label, String data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          filename,
          scale: 8,
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white,

                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 3,),
            Text(
              data,
              style: TextStyle(
                color: Colors.white,

                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget displayDivider(){

    return Padding(
      padding:EdgeInsets.symmetric(vertical: 10.0),
      child: Divider(
        color: Colors.grey[900],

      ),
    );
  }

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return Image.asset('assets/1.png');
      case >= 300 && < 400:
        return Image.asset('assets/2.png');
      case >= 500 && < 600:
        return Image.asset('assets/3.png');
      case >= 600 && < 700:
        return Image.asset('assets/4.png');
      case >= 700 && < 800:
        return Image.asset('assets/5.png');
      case 800:
        return Image.asset('assets/6.png');
      case > 800 && <= 804:
        return Image.asset('assets/7.png');
      default:
        return Image.asset('assets/7.png');
    }
  }


}
