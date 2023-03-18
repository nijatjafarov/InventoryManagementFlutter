import 'package:flutter/material.dart';

import '../db/database.dart';
import '../models/report.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<AnalyticsPage> createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  late List<Report> reports;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshReports();
  }

  @override
  void dispose() {
    MyDatabase.instance.close();

    super.dispose();
  }

  Future refreshReports() async {
    setState(() => isLoading = true);

    reports = await MyDatabase.instance.readReports();

    setState(() => isLoading = false);
  }

  List<DataRow> buildDataRows() {
    List<DataRow> rows = [];

    for(int i = 0; i < reports.length; i++) {
      rows.add(
        DataRow(cells: [
          DataCell(Text(reports[i].date.toString())),
          DataCell(Text(reports[i].purchaseAmount.toString())),
          DataCell(Text(reports[i].salesAmount.toString())),
          DataCell(Text(reports[i].benefit.toString())),
        ]),
      );
    }
    return rows;
  }

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
            padding: const EdgeInsets.only(top: 40),
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