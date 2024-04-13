import 'package:get/get.dart';


/*when i want to change or controller in to application,steps
1-create class  transaction, used to initialize language,
2-create class  controller,used to  change the language in application
 */


//this class used to initialize languages and used in main,
class MyTransactions extends Translations{

  @override
  Map<String, Map<String, String>> get keys => {
    'ar':{
      "1":"اختر اللغه ",
      "2":"العربيه",
      "3":"الانكليزيه",
      "4":"لدينا 100 ألف منتج، اختر منتجك من متجر التجارة الإلكترونية الخاص بنا",
      "5":"الدفع الشرقي وطريقة الدفع الآمنة.\n موثوق بها من قبل عملائنا من جميع أنحاء العالم",
      "6":"تم استخدام أفضل أداة تعقب لتتبع طلبك.\n ستعرف مكان منتجاتك في الوقت الحالي",
      "7":"تسليم موثوق وسريع. نحن\n نقوم بتسليم منتجك بأسرع\n طريقة ممكنة",
      "8":"أختر المنتج",
      "9":"دفع سهل وآمن",
      "10":"أتبع طلبك",
      "11":"توصيل سريع",
      "12":"أستمرار",
      //auth
      //sign In
      "13":"تسجيل الدخول",
      "14":"مرحبا بك",
      "15":"  قم بتسجيل ايميلك والرقم السري \n او اكمل عملية التسجيل من خلال برامج التواصل الاجتماعي ",
      "16":'ايميل ',
      "17":'الرقم السري',
      "18":'ادخل ايميلك',
      "19":'ادخل الرقم السري',
      "20":'نسيت كلمة السر',
      "21":'تسجيل الدخول',
      "22":" الا تمتلك حساب؟",
      "23":'انشاء حساب',
      "24":"تذاكر كلمة المرور",
      //sign up
      "25":"انشاء حساب",
      "26":"مرحبا بك",
      "27":" قم بانشاء حساب من خلال ايميلك والرقم السري",
      "28":'ايميل ',
      "29":'كلمة السر',
      "30":'ادخل ايميلك',
      "31":'ادخل الرقم السري',
      "32":"اسم المستخدم",
      "33": "الهاتف",
      "34":"ادخل رقم الهاتف",
      "35":"ادخل اسم المستخدم",
      "36":"حفظ",
      "37":"هل تمتلك حساب بالفعل",
      "38":"تسجيل دخول",
      //VerficationSignUp
      "39":"تسجيل رمز التحقق",
      "40":"تحقق من رمز التحقق",
      "41":"أدخل الرمز، سيتم إرساله إلى بريدك الإلكتروني",
      //SuccessSignUp
      "42" :"عملية التحقق من البريد الإلكتروني ناجحه",
      "43":"تود الذهاب لصفحة تسجيل الدخول",
      "44":"الذهاب لتسجيل الدخول",
      //ForgetPassword
      "45":"نسيت كلمة السر",
      "46":"افحص الايميل",
      "47":"قم بحفص ايميلك لتستطيع التسجيل من جديد من خلال هذا الحساب",
      "48":"ادخل البريد الالكتروني",
      "49":"تحقق",
      //resetPassword
      "50":"إعادة تعيين كلمة المرور",
      "51":"اختر كلمة سر جديده قويه",
      "52":"كلمة سر جديده",
      "53":"ادخل كلمة السر الجديده",
      "54":"اعد كتابة كلمة السر",
      "55":"حفظ",
      "56":"عملية اعادة تعيين كلمة السر تمت بنجاح",
      //home
      "57":"الصفحه الرئيسية",
      "58":"تخطي"
    },
    "en":{
      "1":"Choose a language",
      "2":"Arabic",
      "3":"English",
      "4":"We Have a 100K Products Choose\n Your Product from our E-\n commerce shop",
      "5":"East Checkout & Safe payment \n method.Trusted by our Customers\n from all over the world",
      "6":"best tracker has been used for track your order.\n you will know where your products at the moment",
      "7":"Reliable And Fast Deleviry.We\n Deliver your product the fastest\n way possible",
      "8":"Choose Product",
      "9":"Esay & Safe Payment",
      "10":"Track Your Order",
      "11":"Fast Delivery",
      "12":"Continue",
      //auth
      "13":'Sign In',
      "14":'Wellcome Back',
      "15":'Sign in With your email and password\n or contunue with social media',
      "16":'Email',
      "17":'Password',
      "18":'Enter your email',
      "19":'Enter your password',
      "20":'Forget Password',
      "21":'Sign In',
      "22":"Don't have a account?",
      "23":'Sign Up',
      "24":"Remember me",
      //sign up,
      "25" : "Sign Up",
      "26":'Wellcome Back',
      "27":'Sign in With your email and password\n or contunue with social media',
      "28":'Email',
      "29":'Password',
      "30":'Enter your email',
      "31":'Enter your password',
      "32":"User Name",
      "33": "Phone",
      "34": "Enter Your phone number",
      "35":"Enter Your username ",
      "36":"Sign Up",
      "37":"Are You have an account ?",
      "38":"Sign In",
      //VerficationSignUp
      "39":"verifcation code sign up",
      "40":"Check Code",
      "41":"Enter the code,\n it is sent to the your email ",
      //SuccessSignUp
      "42":"Check Email is Successful",
      "43":"Want to log in, Now",
      "44":"Login Now",
      //ForgetPassword
      "45":"Forget Password",
      "46":"Check Email",
      "47":"check your email, \n to can sign in with your account",
      "48":"Enter your email",
      "49":"Check",
      //reset
      "50":"Reset Password",
      "51":"choose a new strong password",
      "52":"New Pass",
      "53":"Enter a new password",
      "54":"Enter a new password again",
      "55":"Save",
      "56":"Success Reset Password",
      //home
      "57":"Home Page",
      "58":"Skip",
    },
  };

}