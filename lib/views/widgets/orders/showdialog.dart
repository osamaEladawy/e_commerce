import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../controller/orders/archiveorder_controller.dart';


// show the dialog
showDialogRating(BuildContext context ,int orderid){
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title:const Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style:  TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message:const Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style:  TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset("assets/images/logo1.png",height: 100,width: 100,),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');
        ArchiveOrdersControllerImp controllerImp = Get.find();
        controllerImp.rating(orderid, response.rating, response.comment);

      },
    )
  );
}