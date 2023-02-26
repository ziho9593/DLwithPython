import 'dart:convert';

import 'package:mise/data/mise.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MiseApi {
  final BASE_URL = "http://apis.data.go.kr";
  final String key =
      "SNYlvIZrtJilWTOW%2FuYb2FGBo08uJfU60HeiVVBvZbY%2FU%2FSz3Br6oX11XQnnVulip2rK5yyv%2FoaiU0%2BX7zuhBA%3D%3D";

  Future<List<Mise>> getMiseData(String stationName) async {
    String url = "${BASE_URL}/B552584/ArpltnInforInqireSvc/"
        "getMsrstnAcctoRltmMesureDnsty?"
        "serviceKey=${key}"
        "returnType=json&numOfRows=100&"
        "pageNo=1&"
        "stationName=${Uri.encodeQueryComponent(stationName)}&dataTerm=DAILY&ver=1.0";

    final response = await http.get(Uri.parse(url));

    print(utf8.decode(response.bodyBytes));

    List<Mise> data = [];
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      var res = json.decode(body) as Map<String, dynamic>;
      for (final _res in res["response"]["body"]["items"]) {
        final m = Mise.fromJson(_res as Map<String, dynamic>);
        data.add(m);
      }
      return data;
    } else {
      return [];
    }
  }
}
