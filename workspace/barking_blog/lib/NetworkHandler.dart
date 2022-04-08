import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkHandler {
//  String baseurl = "http://192.168.1.55:5000/";
  String baseurl = "http://localhost:5000/";
  var logger = Logger();

  Future<dynamic> get(String getUrl) async {
    // /user/register
    getUrl = formatter(getUrl);
    logger.i(getUrl);
    var response = await http.get(Uri.parse(getUrl));
    logger.i(response.body);
    logger.i(response.statusCode);
  }

  String formatter(String url) {
    return baseurl + url;
  }
}
