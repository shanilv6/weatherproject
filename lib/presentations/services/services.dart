import 'package:weatherapp/presentations/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherData{
Future<Weather> getData(var latitude,var longitude)async{
  var uriCall = Uri.parse('http://api.weatherapi.com/v1/current.json?key=c0dbb6f1794640eeabf103014222805&q=$latitude,$longitude&aqi=no');
  var response =await http.get(uriCall);
  var body = jsonDecode(response.body);
  return Weather.fromJson(body);
 /* if(response.statusCode==200){
    return Weather.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Failed");
  }*/
}
}

