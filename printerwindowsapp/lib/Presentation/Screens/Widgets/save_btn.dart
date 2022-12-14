
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printerwindowsapp/Presentation/Components/spacer.dart';
import 'package:printerwindowsapp/localstorage.dart';
import 'package:printerwindowsapp/model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'printable_data.dart';
import 'package:printing/printing.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:syncfusion_flutter_pdf/pdf.dart';

class SaveBtnBuilder extends StatefulWidget {
  const SaveBtnBuilder({Key? key}) : super(key: key);

  @override
  State<SaveBtnBuilder> createState() => _SaveBtnBuilderState();
}

class _SaveBtnBuilderState extends State<SaveBtnBuilder> {
   var timer;

   Directory _photoDir = Directory('');
   String ?sharedpref ;
@override
void initState() {
  super.initState();
  sharedpref == null?null:
  auto();
 //enable ?timer?.cancel:null;
//  timer= Timer.periodic(Duration(seconds: 3), (Timer t) {
//   print("object");
//  // printAutomatically();
//   } );
}

@override
void dispose() {
  timer?.cancel();
  super.dispose();
}


 void auto(){
  enable=true;
  timer= Timer.periodic(Duration(seconds: 3), (Timer t) {
  print("object");
 // printAutomatically();
  } );

 }


bool enable = false;
   //var pathorg ;
  File ? filedata;
late List<FileSystemEntity> _folders;
List expectedList =[];
List pathFromFolder =[];
List temp =[];
  String ? directory;
      List file =  [];


      void location()async{
             SharedPreferences prefs = await SharedPreferences.getInstance();
             sharedpref = prefs.getString('selectedDirectory');
             print(sharedpref);
             if(sharedpref=='null'){
              FileLocationDeniedPopUp(context);
             // var selectedDirectory = await FilePicker.platform.getDirectoryPath();
                      
           // prefs.setString("selectedDirectory", selectedDirectory.toString());
             }
             else{

             }

      }
  @override
  Widget build(BuildContext context) {
   location();
    
    var locRef = Provider.of<LocalFiles>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
       // onPrimary: Colors.indigo,
        primary: enable?Colors.red: Colors.indigo,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () async{  
       SharedPreferences? prefs = await SharedPreferences.getInstance();
      var location = prefs.getString('selectedDirectory');
      print("ocation$location");
      if(location!='null'){
        print("shared pref value ${prefs.getString('selectedDirectory')}");

                   if(enable!=true){
                    auto();
  //          timer= Timer.periodic(Duration(seconds: 3), (Timer t) {
  // print("object");
  // printAutomatically();
  // } );
         
          enable=true;
        }
        else{
           timer?.cancel();
          enable=false;
        }
  
        setState(() {
          
        });
  
     }
      else{
        FileLocationDeniedPopUp(context);
      }
        


 
     
       },
      child: Text(enable? "Stop ":"Start Print",
        style: const TextStyle(color: Colors.white, fontSize: 20.00),
      ),
    );
  }




FileLocationDeniedPopUp(BuildContext context) {
  showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => WillPopScope(
            onWillPop: () async => false,
            child: Dialog(
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2)),
                child: SizedBox(
                  height: 140,
                  width: 250,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                       const Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child:  Text(
                              "Please Select A File location",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Text(
                              "To Continue",
                              style:  TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                     const HeightSpacer(myHeight: 35),
                      GestureDetector(
                        onTap: () async {
 SharedPreferences prefs = await SharedPreferences.getInstance();
var selectedDirectory = await FilePicker.platform.getDirectoryPath();
                      
           prefs.setString("selectedDirectory", selectedDirectory.toString());
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 30,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.black87),
                          child: const Center(
                              child: Text(
                            "Ok",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      )
                    ],
                  ),
                )),
          ));
}






Future printAutomatically()async{
  temp.clear();
 var locRef = Provider.of<LocalFiles>(context,listen: false);
   await Provider.of<LocalFiles>(context,listen: false).getPrintList();
     // await  Provider.of<LocalFiles>(context,listen: false).clearPrintList();
      await getDir().whenComplete(() async{
            print("${locRef.localItems.length} length LocalStorage");
         pathFromFolder.clear();
        if(_folders.isNotEmpty){
             for(var item in _folders){
              if(item.path.toString().endsWith("pdf")){
                pathFromFolder.add( item.path.toString());

              }

              else{
                print("elseeeeeeeeeeeeee ${item.path}");
              }
          
          // pathFromFolder.add( item.path.toString());
        } 


        for(var item in Provider.of<LocalFiles>(context,listen: false).localItems){

              temp.add( item);
        }
        
        print("TempLength?????????${temp.length}");
        print("pathFromFolder $pathFromFolder");

        }
        

      if(pathFromFolder==temp){
        print("EQUALLL");

     }
       else{
         
       
        var expected = pathFromFolder.toSet().difference(temp.toSet()).toList();
         
         
          log("expectedList.........${expected}");

          if(expected.isNotEmpty){
               for(var item in expected){

        await filePickerfromInternalStorage(item).whenComplete(() async{
                   // await Provider.of<LocalFiles>(context,listen: false).addToRecent(LocalData(name:item));
       });
          

          }

          }
  
     }
      });


}

Future<void> getStorage() async {
    final directory = await getExternalStorageDirectory();
    print(" ${directory!.path}");
    //setState(() => externalDirectory = directory);
  }



  Future<void> printDoc(data) async {
    
  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => data,
  usePrinterSettings: true);
  // await Printing.directPrintPdf(printer: Printer(url: "EPSON L3150 series"),onLayout: (PdfPageFormat format) async => data,
  // usePrinterSettings: true);
  }





    //  void _listofFiles() async {
        
    //     var syncPath = directory = (
    //       await getApplicationDocumentsDirectory()).path;
    //       print("???????????????$syncPath");

    //  var result =  await File(syncPath).exists();
    //  print(result);
      
    //   }

  Future<List<int>> _readDocumentData( data) async { 

 
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

}

Future filePickerfromInternalStorage(path)async{
  print("path///////////////////$path");


  filedata = File(path);
   Uint8List bytes = filedata!.readAsBytesSync();
    var printData = await _readDocumentData(bytes);
    await printDoc(printData);
  //printDoc(printData);
  //(file);
// } 
// else {

// }

}



  Future<String> _getFilePath(String filename,String folder_name) async {
    final dir = await getApplicationDocumentsDirectory();
    final String folderName=folder_name;
 return "${dir.path}/$folderName/$filename";
    
  }


Future<void> getDir() async {
  SharedPreferences? prefs = await SharedPreferences.getInstance();
print("shared pref ${prefs.getString('selectedDirectory')}",);
  // final directory = await getApplicationDocumentsDirectory();
  // await directory.create(recursive: true);
  // final dir = directory.path;
  // String pdfDirectory = '$dir/Test';
 // final myDir =  Directory(pdfDirectory);
 String? selectedDirectory = prefs.getString('selectedDirectory');
 // await FilePicker.platform.getDirectoryPath();

if (selectedDirectory != null) {
  _photoDir = Directory(selectedDirectory);
  print(selectedDirectory);
  // User canceled the picker
}
  setState(() {
    _folders =
    // myDir.
    _photoDir.listSync(recursive: true, followLinks: false);
    print("folderLength////////${_folders.length}");
  });
  print(_folders);
}



}
