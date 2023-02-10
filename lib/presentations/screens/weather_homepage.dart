import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weatherapp/presentations/services/services.dart';
import 'package:weatherapp/widgets/shimmer_effect.dart';
import '../../utils.dart/styles.dart';
import '../../widgets/shimmer_load.dart';
import '../services/getLocation.dart';

class WeatherHomeScreen extends StatelessWidget {
  ShimmerController shimmerController = Get.put(ShimmerController());
  var client = WeatherData();
  var data;
  info() async {
     // var position = await GetPosition();
   // data = await client.getData(position.latitude, position.longitude);
    data = await client.getData('51.52', '-0.11');
    return data;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() => shimmerController.isLoadingCompleted.value == true
      ? SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
          future: info(),
          builder: ((context, snapshot) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 70),
                  height: size.height * 0.75,
                  width: size.width,
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      borderRadius: BorderRadius.circular(40),
                      gradient: const LinearGradient(
                          colors: [Color(0xff955cd1), Color(0xff3fa2fa)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.2, 0.5])),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: size.width * 0.13,
                          width: size.width * 0.80,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Search country..",
                                        hintStyle:
                                            TextStyle(color: Colors.grey)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        '${data?.cityName}',
                        style: TextStyles.countryText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        // "Monday, 03 Mars",
                        '${data?.CountryName}',
                        style: TextStyles.dateText,
                      ),
                      /* Image.asset(
                      'assets/img_sunny.png',
                      width: size.width * 0.4,
                    ),*/
                      Image.network(
                        'http:${data?.icon}',
                        width: size.width * 0.3,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${data?.condition}',
                        style: TextStyles.climateText,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${data?.temp}°',
                        style: TextStyles.tempText,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Column(
                            children: [
                              Image.asset(
                                'assets/img_storm.png',
                                width: size.width * 0.10,
                              ),
                              Text(
                                '${data?.wind} km/h',
                                style: TextStyles.climateNumbers,
                              ),
                              Text(
                                'wind',
                                style: TextStyles.climateNumbers,
                              ),
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Image.asset(
                                'assets/img_humidity.png',
                                width: size.width * 0.10,
                              ),
                              Text(
                                '${data?.humidity}',
                                style: TextStyles.climateNumbers,
                              ),
                              Text(
                                'Humidity',
                                style: TextStyles.climateNumbers,
                              ),
                            ],
                          )),
                          Expanded(
                              child: Column(
                            children: [
                              Image.asset(
                                'assets/img_wind_direction.png',
                                width: size.width * 0.10,
                              ),
                              Text(
                                '${data?.wind_dir}',
                                style: TextStyles.climateNumbers,
                              ),
                              Text(
                                'wind Direction',
                                style: TextStyles.climateNumbers,
                              ),
                            ],
                          ))
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          "Gust",
                          style: TextStyles.climateNumbers,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data?.gust} kp/h",
                          style: TextStyles.climateNumbers1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Pressure",
                          style: TextStyles.climateNumbers,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data?.pressure} hpa",
                          style: TextStyles.climateNumbers1,
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          "UV",
                          style: TextStyles.climateNumbers,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data?.uv}",
                          style: TextStyles.climateNumbers1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Precipitation",
                          style: TextStyles.climateNumbers,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data?.pricipe} mm",
                          style: TextStyles.climateNumbers1,
                        ),
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          "Wind",
                          style: TextStyles.climateNumbers,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data?.wind} km/h",
                          style: TextStyles.climateNumbers1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Last Update",
                          style: TextStyles.climateNumbers,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${data?.last_update}",
                          style: TextStyles.climateNumbers2,
                        ),
                      ],
                    ))
                  ],
                )
              ],
            );
          }),
        ),
      )
    : const ShimmerEffect())
    );
  }
}
