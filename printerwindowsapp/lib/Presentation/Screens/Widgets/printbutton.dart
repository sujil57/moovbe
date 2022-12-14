import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:printerwindowsapp/Presentation/Screens/Widgets/save_btn.dart';

class PrintButton extends StatefulWidget {
  const PrintButton({Key? key}) : super(key: key);

  @override
  State<PrintButton> createState() => _PrintButtonState();
}

class _PrintButtonState extends State<PrintButton> {
  var timer;
  bool enable =false;
  @override
  Widget build(BuildContext context) {
    return
     ElevatedButton(
      style: ElevatedButton.styleFrom(
       // onPrimary: Colors.indigo,
        primary: enable?Colors.red: Colors.green,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () async{

        
        if(enable!=true){
           timer= Timer.periodic(Duration(seconds: 3), (Timer t) {
  print("object");
 //printAutomatically();
  } );
          //SaveBtnBuilder();
          enable=true;
        }
        else{
           timer?.cancel();
          enable=false;
        }
        // enable?
        // enable=false:enable=true;
        setState(() {
          
        });

   
     
       },
      child: Text(enable? "Stop ":"Start Print",
        style: TextStyle(color: Colors.white, fontSize: 20.00),
      ),
    );
  }
}