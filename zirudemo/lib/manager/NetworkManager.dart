import 'package:dio/dio.dart';

class NetworkManager {
  

  final dio = Dio();

  Future<String> requestData(String serviceUrl, String method, dynamic data, String strContentType) async {
    if (method == '0') {//cdo
      
      return "";

    } else if(method == '1'){//get

      var response = await dio.get(serviceUrl);
      
      return response.data.toString();

    }else if(method == '2'){//post

      if (strContentType == null || strContentType.length == 0) {
        strContentType = 'application/x-www-form-urlencoded';
      }
      
      var response = await dio.post(serviceUrl, 
                                    data: data, 
                                    options: Options(contentType: strContentType));

      return response.data.toString();

    }
  }

}
