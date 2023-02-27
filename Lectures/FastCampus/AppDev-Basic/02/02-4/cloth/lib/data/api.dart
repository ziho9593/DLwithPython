import 'package:cloth/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:collection/collection.dart';

class WeatherApi {
  final BASE_URL = "http://apis.data.go.kr";
  final String key =
      "SNYlvIZrtJilWTOW%2FuYb2FGBo08uJfU60HeiVVBvZbY%2FU%2FSz3Br6oX11XQnnVulip2rK5yyv%2FoaiU0%2BX7zuhBA%3D%3D";

  Future<List<Weather>?> getWeather(
      int x, int y, int date, String base_time) async {
    String url =
        "${BASE_URL}/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?"
        "serviceKey=${key}"
        "&pageNo=100&numOfRows=130&dataType=JSON&"
        "base_date=${date}&base_time=${base_time}&nx=${x}&ny=${y}";
    print(url);

    final response = await http.get(Uri.parse(url));

    List<Weather> weather = [];

    if (response.statusCode == 200) {
      /* 정상으로 진행됨 */
      String body = utf8.decode(response.bodyBytes);
      print(body);

      var res = json.decode(body) as Map<String, dynamic>;

      List<dynamic> _data = [];

      _data = res["response"]["body"]["items"]["item"] as List<dynamic>;

      final data =
          groupBy(_data, (obj) => "${obj["fcstTime"]}").entries.toList();

      for (final _r in data) {
        final _data = {
          "fcstTime": _r.key,
          "fcstDate": _r.value.first["fcstDate"],
        };

        for (final _d in _r.value) {
          _data[_d["category"]] = _d["fcstValue"];
        }

        final w = Weather.fromJson(_data);
        weather.add(w);

        return weather;
      }
    } else {
      return [];
    }
  }
}
