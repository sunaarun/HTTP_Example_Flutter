import 'dart:convert';

import 'package:http/http.dart'  as http;
import 'package:rest_api_example/photo_class.dart';

class HTTPHandler{
  String url = "https://jsonplaceholder.typicode.com/photos";
  Future<List<Photo>> fetchData() async{
    List<Photo> myList =[];
    final respond = await http.get(Uri.parse(url));
    if(respond.statusCode==200)
      {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        var data = jsonDecode(respond.body);
        for(Map<String, dynamic> d in data)
          {
            Photo photo= Photo.fromJSON(d);
            myList.add(photo);
          }
          return myList;
      }
    else{
      // If the server did not return a 200 OK response,
      // then throw an exception.
        throw Exception('${respond.statusCode}');
    }
  }
}


