class ApiLink {
  //192.168.1.103
  static const String server = "http://10.0.2.2/shoppingnowphp";
  static const String test = "$server/test.php";
  static const String notification = "$server/notification.php";
  static const String deleteNotification = "$server/delete_notification.php";

  //auth
  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String resendCode = "$server/auth/resend.php";
  static const String verfiySignupdata = "$server/auth/verfycode.php";

  //forgetpassword
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String verifycodeforgetpassword = "$server/forgetpassword/verifycode.php";
  static const String resetpassword = "$server/forgetpassword/resetpassword.php";

  //home
static const String home = "$server/home.php";
//offers
static const String offers = "$server/offers.php";
//search
  static const String search = "$server/items/search.php";

//items
static const String items = "$server/items/items.php";
//favourite
static const String addFav = "$server/favourite/add.php";
static const String removeFav = "$server/favourite/remove.php";
static const String viewFav = "$server/favourite/view.php";
static const String deleteFromFav = "$server/favourite/deletefromfavourite.php";
//cart
static const String addCart = "$server/cart/add.php";
static const String deleteCart = "$server/cart/delete.php";
static const String viewCart = "$server/cart/view.php";
static const String getcountitems = "$server/cart/getcountitems.php";
//copon
static const String copon = "$server/copons/copon.php";
static const String coponview = "$server/copons/view.php";
//adress
static const String viewAddress = "$server/address/view.php";
static const String addAddress = "$server/address/add.php";
static const String removeAddress = "$server/address/remove.php";
//orders
static const String addorder = "$server/orders/checkout.php";
static const String pendingOrders = "$server/orders/pending.php";
static const String deleteOrders = "$server/orders/delete.php";
static const String ordersDetials = "$server/orders/detials.php";
static const String archiveOrders = "$server/orders/archive.php";
//rating
static const String rating = "$server/rating.php";

}