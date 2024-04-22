// ignore_for_file: deprecated_member_use

import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/assetsImages.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return
    statusRequest == StatusRequest.loading ?
      Center(child: Lottie.asset(AssetsImages.loading,height: 120,),) :
    statusRequest == StatusRequest.offlineFailure ?
    Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Haye!",style: Theme.of(context).textTheme.headline1!.copyWith(
          color: Colors.teal[800]
        ),),
        const SizedBox(height: 15,),
        Text("please check internet",style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: Colors.teal[700]
        ),),
        Lottie.asset(AssetsImages.offline),
      ],
    )):
    statusRequest == StatusRequest.serverFailure ?
    Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("please,wating!",style: Theme.of(context).textTheme.headline1!.copyWith(
            color: Colors.blue[400],
           letterSpacing: 1.2,
        ),),
        const SizedBox(height: 15,),
        Text("Found Error in Server...",style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: Colors.blue[300],
           letterSpacing: 1.5,
        ),),
        Lottie.asset(AssetsImages.serverFailure,height: 300),
      ],
    )) :
    statusRequest == StatusRequest.failure ?
    Center(child: Lottie.asset(AssetsImages.notData),) :widget;


  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return
      statusRequest == StatusRequest.loading ?
      Center(child: Lottie.asset(AssetsImages.loading,height: 150),) :
      statusRequest == StatusRequest.offlineFailure ?
      Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("!Haye",style: Theme.of(context).textTheme.headline1!.copyWith(
              color: Colors.teal[800]
          ),),
          const SizedBox(height: 15,),
          Text("please check internet",style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.teal[700]
          ),),
          Lottie.asset(AssetsImages.offline),
        ],
      )):
      statusRequest == StatusRequest.serverFailure ?
      Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("!please,waiting",style: Theme.of(context).textTheme.headline1!.copyWith(
            color: Colors.blue[400],
            letterSpacing: 1.2,
          ),),
          const SizedBox(height: 15,),
          Text("...Found Error in Server",style: Theme.of(context).textTheme.bodyText1!.copyWith(
            color: Colors.blue[300],
            letterSpacing: 1.5,
          ),),
          Lottie.asset(AssetsImages.serverFailure,height: 300),
        ],
      )) :widget;

  }
}

