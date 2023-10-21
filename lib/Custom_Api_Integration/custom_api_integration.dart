import 'package:assinment_of_spondonit/Api_Model_Class/movie_list_model_class.dart';
import 'package:dio/dio.dart';

class CustomApi_integration{
   fetchData(context) async {
     List<Movie_list_model_class> Movie_list=[];
     final dio = Dio();
    try {
      /// Define the URL of the JSON API
      final apiUrl = 'https://jsonplaceholder.typicode.com/photos'; // Replace with your API URL
      /// Make a GET request to the API
      final response = await dio.get(apiUrl);
      /// Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        /// Parse the JSON data
        final List<dynamic> data = response.data;
        /// Loop through the data and process it as needed
        for (var item in data) {
          Movie_list.add(
              Movie_list_model_class(
                albumId: item['albumId'],
                id: item['id'],
                thumbnailUrl: item['thumbnailUrl'],
                title: item['title'],
                url: item['url'],
              )
          );
        }
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
    return Movie_list;
  }
}