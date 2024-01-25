import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import'package:assignment/data/key.dart';
import 'package:flutter/material.dart';
import 'package:assignment/screens/home_screen.dart';
import 'package:assignment/screens/home_screen_widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:equatable/equatable.dart';// Import the geolocator package
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assignment/bloc/weather_bloc_bloc.dart'; // Import your WeatherBlocBloc
import 'package:assignment/main.dart';
import 'package:bloc/bloc.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent,
    WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {

        WeatherFactory wf = WeatherFactory(API_KEY,
            language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude,
        );
        emit(WeatherBlocSuccess(weather));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}

