import 'package:http/http.dart' as http;

fetchSOS() async {
  var jsondata = await http
      .get(Uri.parse("http://192.168.29.183:5000/static/sos-data.json"));
  print(jsondata.body.length);
  return jsondata.body;
}
