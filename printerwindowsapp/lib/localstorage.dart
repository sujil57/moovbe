import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:printerwindowsapp/model.dart';
// import 'package:localstorage/localstorage.dart';
// import 'package:print_flutterapp/model.dart';

class LocalFiles with ChangeNotifier {
  List
  //<LocalData>
   localItems = [];

  addToRecent(LocalData item) async {
    print("ADDING RECENT PRODUCT");
    notifyListeners();
    print("adding...............");
    LocalData data = LocalData.copyValues(item);
    print("<<<<<<<<<<<<<${data.name}");
    localItems.add(data.name );
    //print("//////${localItems[0].name}");
    print("lengthhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh//////${localItems.length}");
    notifyListeners();
    await savePrintList();
    notifyListeners();
  }

  Future<void> savePrintList() async {
    final LocalStorage storage = LocalStorage("printItem");
    try {
      final ready = await storage.ready;
      if (ready) {
        print("READY TO SAVE");
        await storage.setItem("prints", localItems);
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> clearPrintList() async {
    final LocalStorage storage = LocalStorage("printItem");
    storage.clear();
    localItems.clear;
    notifyListeners();
    await savePrintList();
    notifyListeners();
  }


  Future<void> getPrintList() async {
    print("getPrintList*****************${localItems.length}");
    final LocalStorage storage = LocalStorage("printItem");
    //recentItem
    localItems.clear();
    try {
      final ready = await storage.ready;
      if (ready) {
        print("Ready");
        final json = storage.getItem("prints");
        // recents
        print("sssssssss $json");
        //.map((e) => LocalData.fromLocalJson(e))
        for (var item in json) {
         // List<LocalData> testing = [];
          print("***********###############$item");
          localItems.add( item);
          print(localItems.length);
          //testing.add(item);
          
          
          
          notifyListeners();
        }
        print("<<<<<<<<<<<<<< ${localItems[0].name}");
        notifyListeners();
      }
      print("||||||||||||||||||${localItems.length}");
    } catch (err) {
      print(err);
    }
  }
}
















// class LocalFiles with ChangeNotifier {
//   List<LocalData> localItems = [];

//   addToRecent(LocalData item) async {
//     print("ADDING RECENT PRODUCT");
//     notifyListeners();
//     print("adding...............");
//     LocalData data = LocalData.copyValues(item);
//     print("<<<<<<<<<<<<<${data.name}");
//     localItems.add(LocalData(name:data.name ));
//     //print("//////${localItems[0].name}");
//     print("//////${localItems.length}");
//     notifyListeners();
//     await savePrintList();
//     notifyListeners();
//   }

//   Future<void> savePrintList() async {
//     final LocalStorage storage = LocalStorage("printItem");
//     try {
//       final ready = await storage.ready;
//       if (ready) {
//         print("READY TO SAVE");
//         await storage.setItem("prints", localItems);
//       }
//     } catch (err) {
//       print(err);
//     }
//   }

//   Future<void> clearPrintList() async {
//     final LocalStorage storage = LocalStorage("printItem");
//     storage.clear();
//     localItems.clear;
//     notifyListeners();
//     await savePrintList();
//     notifyListeners();
//   }


//   Future<void> getPrintList() async {
//     final LocalStorage storage = LocalStorage("printItem");
//     //recentItem
//     localItems.clear();
//     try {
//       final ready = await storage.ready;
//       if (ready) {
//         print("Ready");
//         final json = storage.getItem("prints");
//         // recents
//         print("sssssssss $json");
//         for (var item in json.map((e) => LocalData.fromLocalJson(e))) {
//           List<LocalData> testing = [];
//           testing.add(item);
//           localItems.add(LocalData(name: item));
          
          
//           notifyListeners();
//         }
//         print("<<<<<<<<<<<<<< ${localItems[0].name}");
//         notifyListeners();
//       }
//       print("||||||||||||||||||${localItems.length}");
//     } catch (err) {
//       print(err);
//     }
//   }
// }

