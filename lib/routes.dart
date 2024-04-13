import 'package:e_commerce_app/views/address/add_adreess.dart';
import 'package:e_commerce_app/views/address/completeinfo_address.dart';
import 'package:e_commerce_app/views/address/edit_adress.dart';
import 'package:e_commerce_app/views/address/view_address.dart';
import 'package:e_commerce_app/views/auth/forget_password.dart';
import 'package:e_commerce_app/views/auth/login.dart';
import 'package:e_commerce_app/views/auth/reset_password.dart';
import 'package:e_commerce_app/views/auth/sign_up.dart';
import 'package:e_commerce_app/views/auth/succesresetpassword.dart';
import 'package:e_commerce_app/views/auth/successresetwithsignup.dart';
import 'package:e_commerce_app/views/auth/verfication_page.dart';
import 'package:e_commerce_app/views/auth/verfication_signup.dart';
import 'package:e_commerce_app/views/home/home_screen.dart';
import 'package:e_commerce_app/views/items/items_detiales.dart';
import 'package:e_commerce_app/views/items/items_page.dart';
import 'package:e_commerce_app/views/orders/detiales_orders.dart';
import 'package:e_commerce_app/views/orders/orders_archive.dart';
import 'package:e_commerce_app/views/orders/orderview.dart';
import 'package:e_commerce_app/views/screens/cart.dart';
import 'package:e_commerce_app/views/screens/checkout.dart';
import 'package:e_commerce_app/views/screens/languages.dart';
import 'package:e_commerce_app/views/screens/myfavourite.dart';
import 'package:e_commerce_app/views/screens/notification.dart';
import 'package:e_commerce_app/views/screens/offers.dart';
import 'package:e_commerce_app/views/screens/onboarding.dart';
import 'package:e_commerce_app/views/screens/tracking.dart';
import 'package:get/get.dart';
import 'core/constant/approutes.dart';
import 'core/middile_wares/my_middiles_wares.dart';

List<GetPage<dynamic>>? getPages = [
  //GetPage(name: "/", page: ()=>const MyTextApp()),
//auth
  GetPage(name: "/", page:()=> const LanguagesPage(),middlewares: [MyMiddleware(),]),
  GetPage(name: AppRoutes.login, page:()=> const Login()),
  GetPage(name: AppRoutes.onBoarding, page:()=> const OnBoarding()),
  GetPage(name: AppRoutes.signUp, page:()=> const SignUp()),
  GetPage(name: AppRoutes.forgetPassword, page:()=> const ForgetPassword()),
  GetPage(name: AppRoutes.verfiy, page:()=> const Verification()),
  GetPage(name: AppRoutes.resetPassword, page:()=> const ResetPassword()),
  GetPage(name: AppRoutes.succesResetPass, page:()=> const SuccessResetPassword()),
  GetPage(name: AppRoutes.successSignUp, page:()=> const SuccessSignUp()),
  GetPage(name: AppRoutes.verficationSignUp, page:()=> const VerficationSignUp()),
  //
  GetPage(name: AppRoutes.homePage, page:()=> const HomeScreen()),
  GetPage(name: AppRoutes.items, page:()=> const ItemsPage()),
  GetPage(name: AppRoutes.productDetiales, page:()=> const ItemsDetails()),
  GetPage(name: AppRoutes.myFavourite, page:()=> const MyFavourite()),
  GetPage(name: AppRoutes.cart, page:()=> const CartPage()),
  //address
  GetPage(name: AppRoutes.addAddress, page:()=> const AddAdress()),
  GetPage(name: AppRoutes.editAddress, page:()=> const EditAdress()),
  GetPage(name: AppRoutes.viewAddress, page:()=> const ViewAddress()),
  GetPage(name: AppRoutes.completeAddress, page:()=> const CompleteInfoAdress()),
  GetPage(name: AppRoutes.checkout, page:()=> const CheckOut()),
  //orders
  GetPage(name: AppRoutes.pendingOrders, page:()=> const OrdersView()),
  GetPage(name: AppRoutes.archiveOrders, page:()=> const OrdersArchive()),
  GetPage(name: AppRoutes.detialesOrders, page:()=> const DetailsOrder()),
  GetPage(name: AppRoutes.tracking, page:()=> const Tracking()),
  GetPage(name: AppRoutes.offers, page:()=> const OffersPage()),
  GetPage(name: AppRoutes.notification, page:()=> const NotificationPage()),

];