import 'package:e_commerce_app/core/class/status_request.dart';
import 'package:e_commerce_app/core/constant/approutes.dart';
import 'package:e_commerce_app/core/functions/handleStatus_response.dart';
import 'package:e_commerce_app/core/services/my_services.dart';
import 'package:e_commerce_app/data/data_source/data_remote/address/address_data.dart';
import 'package:e_commerce_app/data/data_source/data_remote/orders/orders_data.dart';
import 'package:e_commerce_app/data/model/address_model.dart';
import 'package:e_commerce_app/data/model/cart_model.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';

abstract class CheekOutController extends GetxController {
  back();

  paymetMethods(String value);

  chooseDeliveryType(String value);

  chooseAddress(int value);

  getData();

  checkOut();

  goToAddress();
}

class CheekOutControllerImp extends CheekOutController {
  MyServices services = Get.find();
  AddressData addressData = AddressData(curd: Get.find());
  OrdersData ordersData = OrdersData(curd: Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  List<AddressModel> models = [];
  List<CartModel> products = [];
  CartModel? cartModel;

  String? payment;
  String? ordertype;
  int addressId = 0;
  late int copondiscount;
  late int coponid;
  late double orderprice;
  int? itemPrice;
  int? itemid;
  int? order;


  @override
  back() {
    Get.back();
  }

  @override
  chooseAddress(value) {
    addressId = value;
    update();
  }

  @override
  chooseDeliveryType(value) {
    ordertype = value;
    update();
  }

  @override
  paymetMethods(value) {
    payment = value;
    if (value == '1') {
      Get.to(
        () => PaypalCheckout(
          sandboxMode: true,
          clientId:
              "AXhA1KfX7yrtAi5YmbvDUhNGmj6WgBSsy2eamGzi49NOkLLLA2y6PbeqruVRDyNBPivsFerkTMYvxIZx",
          secretKey:
              "EJ7UE7DhVMSwIFTZldZlIoH-1Eky9vCQrGuICvDk8tOv5d1QVyYsoeZi9N8KI7zpMQkpt7XA2WdFfP9T",
          returnURL: "success.snippetcoder.com",
          cancelURL: "cancel.snippetcoder.com",
           transactions:
          const [
            {
              "amount": {
                "total": '70',
                "currency": "USD",
                "details": {
                  "subtotal": '70',
                  "shipping": '0',
                  "shipping_discount": 0
                }
              },
              "description": "The payment transaction description.",
              // "payment_options": {
              //   "allowed_payment_method":
              //       "INSTANT_FUNDING_SOURCE"
              // },
              "item_list": {
                "items":
                [
                  {
                    "name": "Apple",
                    "quantity": 4,
                    "price": '5',
                    "currency": "USD"
                  },
                  {
                    "name": "Pineapple",
                    "quantity": 5,
                    "price": '10',
                    "currency": "USD"
                  }
                ],

                // shipping address is not required though
                //   "shipping_address": {
                //     "recipient_name": "Raman Singh",
                //     "line1": "Delhi",
                //     "line2": "",
                //     "city": "Delhi",
                //     "country_code": "IN",
                //     "postal_code": "11001",
                //     "phone": "+00000000",
                //     "state": "Texas"
                //  },
              }
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            print("onSuccess: $params");
          },
          onError: (error) {
            print("onError: $error");
            Get.back();
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
      );
    }
    update();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await addressData.getData(services.preferences!.getString("id")!);
    statusRequest = handleStatus(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        List lists = response["data"];
        models.addAll(lists.map((e) => AddressModel.fromJson(e)));
        addressId = models[0].addressId!;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    coponid = Get.arguments["coponid"];
    orderprice = Get.arguments["orderprice"];
    copondiscount = Get.arguments["copondiscount"];
    products = Get.arguments['listofproducts'];
    getData();
    super.onInit();
  }

  @override
  checkOut() async {
    if (payment == null) return Get.snackbar("Haye!", "plaese choose payment method");
    if (ordertype == null) return Get.snackbar("Haye!", "plaese choose order type");
    if (models.isEmpty) return Get.snackbar("Haye!", "plaese choose your address");

    statusRequest = StatusRequest.loading;
    update();
    products.forEach((element) {
      itemPrice= element.itemsPriceDiscount;
      itemid = element.itemsId;

    });
    Map data = {
      "userid": services.preferences!.getString("id").toString(),
      "orderaddress": addressId.toString(),
      "ordertype": ordertype.toString(),
      "orderpricedelivery": "10",
      "orderprice": orderprice.toString(),
      "ordercopon": coponid.toString(),
      "copondiscount": copondiscount.toString(),
      "orderpaymentmethod": payment.toString(),
      "cartitemprice": itemPrice.toString(),
      "itemid": itemid.toString(),
    };
    var response = await ordersData.checkout(data);
    statusRequest = handleStatus(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoutes.homePage);
        Get.snackbar("Hi", "The Operation Success");
        print("success");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "Try again");
      }
    }
    update();
  }

  @override
  goToAddress() {
    Get.toNamed(AppRoutes.addAddress);
  }
}
