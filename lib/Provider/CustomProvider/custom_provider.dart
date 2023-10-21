
import 'package:assinment_of_spondonit/Api_Model_Class/movie_list_model_class.dart';
import 'package:assinment_of_spondonit/Custom_Api_Integration/custom_api_integration.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CustomProvider with ChangeNotifier{
 late  List<Movie_list_model_class> Movie_list=[];
  Get_Movie_list(context) async {
    Movie_list =await CustomApi_integration().fetchData(context);
    notifyListeners();
  }
}