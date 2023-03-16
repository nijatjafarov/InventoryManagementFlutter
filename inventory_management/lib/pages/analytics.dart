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
                    DataColumn(label: Text('Date', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Purchase amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Sales amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Profit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                  ], rows: const [
                    DataRow(cells: [
                      DataCell(
                        Text('Jeu', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('Jeu', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('Jeu', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('Jeu', style: TextStyle(fontSize: 16),)),
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
                    DataColumn(label: Text('Date', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Purchase amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Sales amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Profit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                  ], rows: const [
                    DataRow(cells: [
                      DataCell(
                        Text('Jeu', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('Jeu', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('Jeu', style: TextStyle(fontSize: 16),)),
                      DataCell(
                        Text('Jeu', style: TextStyle(fontSize: 16),)),
                    ]),]
                ),
              )
          ),
        ),
      ]);
  }
}