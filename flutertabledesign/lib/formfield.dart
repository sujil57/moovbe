import 'package:flutertabledesign/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Formfields extends StatefulWidget {
   Formfields({ Key? key , required this.index}) : super(key: key);
   int index;

  @override
  State<Formfields> createState() => _FormfieldsState();
}

class _FormfieldsState extends State<Formfields> {
  TextEditingController controller =TextEditingController();
  //List values = ['','','','','','',''];
  List values = [];
  @override
  Widget build(BuildContext context) {
   print("${widget.index}");
  
    return TextFormField(
      onChanged: (value) {
        //print(value);
      },
      onFieldSubmitted: (value){
        // print(value);
      },
      onEditingComplete: (){
        setState(() {
          
        });
        
print(widget.index);
// print(values[widget.index]);
 //values[widget.index].qty = controller.text;
     // values[widget.index].add(Values(qty:controller.text));
        //values.insert(widget.index,controller.text);
        
       // print(values[widget.index]);
        Provider.of<ProviderValue>(context,listen: false).qty[widget.index]=controller.text;
          print("controller  ${controller.text}");
         print("fjgfjgfjg ${Provider.of<ProviderValue>(context,listen: false).qty}");

         // print( Provider.of<ProviderValue>(context,listen: false).qtyvalues[widget.index]);
      },
      // onSaved: (value){
      //   print(value);

      // },
      controller: controller,
    );
  }
}