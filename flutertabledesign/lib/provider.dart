import 'package:flutter/cupertino.dart';

class ProviderValue extends ChangeNotifier{

  List rows =[
    //     {
    //   "name": 'James LongName Joe',
    //   "date": '23/09/2020',
    //   "month": 'June',
    //   "status": 'completed'
    // },
    // {
    //   "name": 'Daniel Paul',
    //   "month": 'March',
    //   "status": 'new',
    //   "date": '12/4/2020',
    // },
    // {
    //   "month": 'May',
    //   "name": 'Mark Zuckerberg',
    //   "date": '09/4/1993',
    //   "status": 'expert'
    // },
    // {
    //   "name": 'Jack',
    //   "status": 'legend',
    //   "date": '01/7/1820',
    //   "month": 'December',
    // },
  ];
  List <Values>qtyvalues = [];
   List  month = ["January", "February","March","Aprill","May","August","September"];
    List name = ["sujil","aravind","nuwaid","junaid","lakshmi","abi","shuhaib"];
    List qty =
    //[];
     ['','24','34','45','55','65','7'];
    List qty1 = ['1','24','35','','53','63','74'];
     List qty2= ['1','24','35','','53','63','74'];
      List qty3 = ['1','24','35','45','53','63',''];
       List qty4 = ['1','24','35','78','','63','74'];
}

class Values{
  String ? qty;
  Values(
   { this.qty}
  );
}