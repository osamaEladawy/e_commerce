/*
1-create from type polyline
2-create list from type latelong
3-instance from polylinepoint

4- create function and input four prameters (curent latlong ,end langlong)
5-first get the link ,
6-request the link using by http
7-convert the response to the dart object
8-get my data from the result (map)
9-convert the map to list ;
10- check for the list and loop and saves result into my list
11-add or create points with polyline and add into my set
*/
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http ;


Future getData(lat,long,endlat,endlong)async{
  Set<Polyline> polylineSet = {};
  List<LatLng> latlongs = [];
  PolylinePoints polylinePoints = PolylinePoints();

  String url ='https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$endlat,$endlong&key=AIzaSyBKwtbHYG_0ICtaDCGrZUaXbdI9LiKCqm0';
  var response = await http.post(Uri.parse(url));
  print('response ................................. ${response.statusCode}');
  var responseBody = jsonDecode(response.body);
  print('response ................................. ${response.body}');
  String myMaps = responseBody['routes'][0]['overview_polyline']['points'];
  print('myMaps ................................. ${myMaps}');
  List<PointLatLng> result = polylinePoints.decodePolyline(myMaps);
  print("===================================result");
  print(result);
  print("===================================result");

  if(result.isNotEmpty){
    result.forEach((PointLatLng pointLatLng) {
      latlongs.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });
  }

  Polyline poliyline = Polyline(polylineId:const PolylineId("uniqe"),color:Colors.blue,width:5,points: latlongs );

  polylineSet.add(poliyline);

  return polylineSet;

}