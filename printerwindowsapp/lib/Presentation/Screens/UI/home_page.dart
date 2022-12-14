import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/image_builder.dart';
import '../../Components/spacer.dart';
import '../Widgets/save_btn.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedDirectory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
       SingleChildScrollView(
         child: Column(mainAxisAlignment: MainAxisAlignment.start,
           children:  [
         const SizedBox(height: 20,),
             
            // Divider(),
             // Align(
             //   alignment: Alignment.topCenter,
             //  child:
                Stack(
                  children: [
                   
                    const Align(
                      alignment: Alignment.center,
                      child: ImageBuilder(
                       imagePath:
                        "assets/Images/OdoxLogo (2).png",
                       imgWidth: 220,
                       imgheight: 220,
               ),
                    ),
                Padding(
                  padding:  const EdgeInsets.only(top:80,right: 100 ),
                  child: Align(
                        alignment: Alignment.topCenter,
                        child: Text("Powered By",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w400,color: Colors.grey.shade600),)
                        ),
                ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Lottie.asset('assets/Images/111525-printer-paper-print.json')),
            
            
          Container(
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(2)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                   Expanded(child: Text(selectedDirectory==null?"":selectedDirectory!)),
                ],
              ),
            )
            ),
            const HeightSpacer(myHeight: 20),
           
                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
      style: ElevatedButton.styleFrom(
       // onPrimary: Colors.indigo,
        primary:  Colors.green,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        //prefs.clear();
        selectedDirectory = await FilePicker.platform.getDirectoryPath();
       print(selectedDirectory);
       if(selectedDirectory!=null){
        
        prefs.setString("selectedDirectory", selectedDirectory.toString());
       }
       
        // enable?
        // enable=false:enable=true;
        setState(() {
          
        });

   
     
       },
      child: const Text("Select File Location",
        style: TextStyle(color: Colors.white, fontSize: 20.00),
      ),
    ),
                ),
                const HeightSpacer(myHeight: 30),
            
             const SizedBox(
               height: 50,
               width: 300,
               child: SaveBtnBuilder()),
           ],
         ),
       ),
    );
  }
}
