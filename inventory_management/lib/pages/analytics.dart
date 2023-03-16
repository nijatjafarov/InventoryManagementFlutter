import 'package:flutter/material.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Report for the current month", style: TextStyle(
              color: Color.fromRGBO(26, 28, 74, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),),
          Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith((states) => const Color.fromRGBO(26, 28, 74, 1)),
                  columnSpacing: 20.0,
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  columns: const [
                    DataColumn(label: Text('Day', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Purchase amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Sales amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Profit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                  ], rows: const [
                    DataRow(cells: [
                      DataCell(
                        Text('1', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('125', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('245', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('120', style: TextStyle(fontSize: 16),)),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Text('2', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('123', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('236', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('113', style: TextStyle(fontSize: 16),)),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Text('3', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('231', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('245', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('14', style: TextStyle(fontSize: 16),)),
                    ]),]
                ),
              )
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 20),
            child: const Text("Report on the months of the current year", style: TextStyle(
              color: Color.fromRGBO(26, 28, 74, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith((states) => const Color.fromRGBO(26, 28, 74, 1)),
                  columnSpacing: 20.0,
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  columns: const [
                    DataColumn(label: Text('Month', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Purchase amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Sales amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Profit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                  ], rows: const [
                    DataRow(cells: [
                      DataCell(
                        Text('January', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('125', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('245', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('120', style: TextStyle(fontSize: 16),)),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Text('February', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('123', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('236', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('113', style: TextStyle(fontSize: 16),)),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Text('March', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('231', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('245', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('14', style: TextStyle(fontSize: 16),)),
                    ]),]
                ),
              )
          ),
        ),
      ]);
  }
}