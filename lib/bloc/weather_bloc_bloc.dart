import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_weather/data/data.dart';
import 'package:weather/weather.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      try {
        WeatherFactory wf =
            WeatherFactory(API_KEy, language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        emit(WeatherBlocSucess(weather));
      } catch (e) {
        emit(WeatherBlocFailure());
      }
      // TODO: implement event handler
    });
  }
}
