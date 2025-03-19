import 'package:flutter/material.dart';
class grade extends StatefulWidget {
  const grade({super.key});

  @override
  State<grade> createState() => _gradeState();
}

class _gradeState extends State<grade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Grade'),
        backgroundColor:Color(0xFFA8E6CF),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('Books Grades',style: TextStyle(fontSize: 30),),
          SizedBox(height: 5,),
          Padding(
              padding: EdgeInsets.all(15),
              child: Table(
                columnWidths: {
                  0:FlexColumnWidth(1),
                  1:FlexColumnWidth(1),
                  2:FlexColumnWidth(1),

                },
                border: TableBorder.all(),
                children: [

                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey[300]),
                    children: [
                      TableCell(child: Text('Name',style:TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
                      TableCell(child: Text('Semester',style:TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center)),
                      TableCell(child: Text('Grade',style:TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center))
                    ]
                  ),
                  tableRow('Hamza', '6th', '--A'),
                  tableRow('Ahmed Mosa', '6th', 'E'),
                  tableRow('Adullah', '6th', 'A+'),
                  tableRow('Shoaib Liaqat', '6th', 'A++'),
                  
                  

                ],

              ),
            ),
        ],
      ),

    );
  }
  TableRow tableRow (String name,String semester,String grade){
    return TableRow(children: [
      Container(
          padding: EdgeInsets.all(10),
          child: Center(child: Text(name),)) ,
      Container(
          padding: EdgeInsets.all(10),
          child: Center(child: Text(semester),)) ,
      Container(
          padding: EdgeInsets.all(10),
          child: Center(child: Text(grade),)) ,

    ]);
  }
}
