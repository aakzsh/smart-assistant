import 'package:http/http.dart' as http;

fetchPatients() async {
  var jsondata = await http
      .get(Uri.parse("http://192.168.29.183:5000/static/all-patients-data.json"));
  print(jsondata.body.length);
  return jsondata.body;
}
