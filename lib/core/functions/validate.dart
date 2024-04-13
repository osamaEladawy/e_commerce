/*this functionn used to validate Forma*/

import 'package:get/get.dart';

//to use validation for entered for user

validateInput(String value,int min,int max,String type){
  if(type == "username"){
    if(!GetUtils.isUsername(value)){
      return "not valid username" ;
    }
  }
  if(type == "email"){
    if(!GetUtils.isEmail(value)){
      return "not valid email" ;
    }
  }
  if(type == "phone"){
    if(!GetUtils.isPhoneNumber(value)){
      return "not valid phone number" ;
    }
  }
  if(value.isEmpty){
   return "this field must not be empty" ;
  }
  if(value.length < min){
   return "this field must not be less than $min" ;
  }
  if(value.length > max){
 return "this field must not be greater than $max" ;
  }
}