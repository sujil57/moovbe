// import 'package:editable/editable.dart';
// import 'package:flutertabledesign/provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers:[
//         ChangeNotifierProvider(create: (context) => ProviderValue(),)
//       ],
//       child: MaterialApp(
//         title: 'Editable example',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           primaryColor: Colors.blue,
//           accentColor: Colors.white,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: MyHomePage(title: 'Editable example'),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key ? key,  required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   /// Create a Key for EditableState
//   final _editableKey = GlobalKey<EditableState>();

//   // List rows = [
//   //   {
//   //     "name": 'James LongName Joe',
//   //     "date": '23/09/2020',
//   //     "month": 'June',
//   //     "status": 'completed'
//   //   },
//   //   {
//   //     "name": 'Daniel Paul',
//   //     "month": 'March',
//   //     "status": 'new',
//   //     "date": '12/4/2020',
//   //   },
//   //   {
//   //     "month": 'May',
//   //     "name": 'Mark Zuckerberg',
//   //     "date": '09/4/1993',
//   //     "status": 'expert'
//   //   },
//   //   {
//   //     "name": 'Jack',
//   //     "status": 'legend',
//   //     "date": '01/7/1820',
//   //     "month": 'December',
//   //   },
//   // ];
//   List cols = [
//     {"title": 'Name', 'widthFactor': 0.2, 'key': 'name', },
//     {"title": 'Date', 'widthFactor': 0.4, 'key': 'date'},
//     {"title": 'Month', 'widthFactor': 0.2, 'key': 'month',},
//     {"title": 'Status', 'key': 'status',},
//     {"title": 'Salary', 'key': 'salary',},
//   ];

//   /// Function to add a new row
//   /// Using the global key assigined to Editable widget
//   /// Access the current state of Editable
//   void _addNewRow() {
//     setState(() {
//       _editableKey.currentState!.createRow();
//     });
//   }

//   ///Print only edited rows.
//   void _printEditedRows() {
//     List editedRows = _editableKey.currentState!.editedRows;
//     Provider.of<ProviderValue>(context,listen: false).rows.add(editedRows);
//     print(Provider.of<ProviderValue>(context,listen: false).rows[0]["name"]);

//     print("##########$editedRows");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leadingWidth: 200,
//         leading: TextButton.icon(
//             onPressed: () => _addNewRow(),
//             icon: Icon(Icons.add),
//             label: Text(
//               'Add',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             )),
//        // title: Text(widget.title),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextButton(
//                 onPressed: () => _printEditedRows(),
//                 child: Text('Print Edited Rows',
//                     style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))),
//           )
//         ],
//       ),
//       body: Editable(
//         key: _editableKey,
//         columns: cols,
//         rows:Provider.of<ProviderValue>(context).rows,
//         // rows,
//         zebraStripe: true,
//         stripeColor1: Colors.blue[50]!,
//         stripeColor2: Colors.grey[200]!,
//         onRowSaved: (value) {
//           print(value);
//         },
//         onSubmitted: (value) {
//           print("&&&&&&&&&&&&&value");
//         },
//         borderColor: Colors.blueGrey,
//         tdStyle: TextStyle(fontWeight: FontWeight.bold),
//         trHeight: 80,
//         thStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//         thAlignment: TextAlign.center,
//         thVertAlignment: CrossAxisAlignment.end,
//         thPaddingBottom: 3,
//         showSaveIcon: true,
//         saveIconColor: Colors.black,
//         showCreateButton: true,
//         tdAlignment: TextAlign.left,
//         tdEditableMaxLines: 100, // don't limit and allow data to wrap
//         tdPaddingTop: 0,
//         tdPaddingBottom: 14,
//         tdPaddingLeft: 10,
//         tdPaddingRight: 8,
//         focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.blue),
//             borderRadius: BorderRadius.all(Radius.circular(0))),
//       ),
//     );
//   }
// }








import 'package:flutter/material.dart';

import 'package:lazy_data_table/lazy_data_table.dart';

void main() {
  runApp(MaterialApp(
    title: 'Example',
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List  month = ["January", "February","March","Aprill","May","August","September"];
    List name = ["sujil","aravind","nuwaid","junaid","lakshmi","abi","shuhaib"];
    List qty = ['','24','34','45','55','65','7'];
    List qty1 = ['1','24','35','','53','63','74'];
     List qty2= ['1','24','35','','53','63','74'];
      List qty3 = ['1','24','35','45','53','63',''];
       List qty4 = ['1','24','35','78','','63','74'];
    return Scaffold(
      appBar: AppBar(title: const Text("Examples")),
      body: Column(
        children: <Widget>[
      SizedBox(
        height: 500,
        width: 405,
        child: LazyDataTable(
        
  rows: 7,
  columns: 7,
  tableTheme: LazyDataTableTheme(
    cornerColor: Colors.grey,
    alternateColumn: false,
    columnHeaderColor: Colors.grey.withOpacity(0.5),
    rowHeaderColor: Colors.grey,
    alternateRow: false,
   // cellColor: Colors.green,
    cellBorder: Border.fromBorderSide(BorderSide(color:
     Colors.black,style: BorderStyle.solid))
    //alternateCellColor: qty[1]==""?Colors.amber:Colors.green


  ),
  tableDimensions: const LazyDataTableDimensions(
    customCellWidth:{1:150},
    customCellHeight: {1:100},
    cellHeight: 50,
    cellWidth: 100,
    topHeaderHeight: 50,
    leftHeaderWidth: 75,
  ),
  topHeaderBuilder: (i) => Center(child: Text(month[i])),
  leftHeaderBuilder: (i) => Center(child: Text(name[i])),
  dataCellBuilder: (i, j) {
    
    return
     j==1?Center(child: TextFormField()
   //Text("Cell: $i, $j")
   ):
   j==2?Container(
      height: 50,
    width: 100,
    color:qty[i]==''? Colors.red:Colors.white,
     child: Center(child:
      Text(qty[i])),
   ):j==3?

   Container(
    height: 50,
    width: 100,
    color:qty1[i]==''? Colors.red:Colors.white,
     child: Center(child:
      Text(qty1[i])),
   ):j==4?
   Container(
    height: 50,
    width: 100,
    color:qty2[i]==''? Colors.red:Colors.white,
     child:qty2[i]!=''? Center(child:
      Text(qty2[i])):TextFormField(),
   ):j==5?
   Container(
    height: 50,
    width: 100,
    color:qty3[i]==''? Colors.red:Colors.white,
     child:qty3[i]!=''? Center(child:
      Text(qty3[i])):TextFormField()
   ):Container(
    height: 50,
    width: 100,
    color:qty4[i]==''? Colors.red:Colors.white,
     child: qty4[i]!=''?Center(child:
      Text(qty4[i])):TextFormField(),
   )
   ;},
  
  
  topLeftCornerWidget: const Center(child: Text("Corner")),
),
      )
        ],
      ),
    );
  }
}





 

