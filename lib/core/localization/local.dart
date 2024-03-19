

import 'package:get/get.dart';

class MyLocal implements Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>>

  get keys =>
      {
        "ar":{
          "serviceName":"اسم الخدمة",
          "freelancer":"عامل حر",
            "selectAccType":"اختر نوع الحساب ",

          "user":'مستخدم',


          "servicePrice":"سعر الخدمة",
          "serviceUpdate":"تم تعديل الخدمة",
          'serviceDetails':"وصف الخدمة",
          "selectCat":'اختر القسم',
          'addService':"اضافة خدمة",
          "search":'بحث',
          "email":'البريد الالكتروني',
          "password":'كلمة المرور',
          "login":'تسجيل الدخول',
          "register":'تسجيل',
            "addServiceImage":"اضافة صورة الخدمة",

            "edit":"تعديل",
            "delete":"حذف",
            "add":"اضافة",
 "editServiceImage":"تعديل صورة الخدمة",

 "selectCountry":"اختر الدولة",

 "from":"طلبت الخدمة من : "


        },

        
        "en":{

           "serviceName":"Service Name",
           "editServiceImage":"Edit Service Image",
          "servicePrice":"Service Price",
          'serviceDetails':"Service Details",
            "serviceUpdate":"Service Updated",
          "selectCat":'Select Category',
          'addService':"Add Service",
          "search":'Search',
          "email":'Email',
          "password":'Password',
          "login":'Login',
          "register":'Register',
          "addServiceImage":"Add Service Image",
           "edit":"Edit",
            "delete":"Delete",
            "add":"Add",
            "selectCountry":"Select Country",
             "freelancer":"Freelancer",
          "user":'User',
          "selectAccType":"Select Account Type",
          "from":"Service requested from : "

        }
      };
}