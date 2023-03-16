import 'package:flutter/material.dart';

import '../db/database.dart';
import '../models/goods.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late List<Goods> goods;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshGoods();
  }

  @override
  void dispose() {
    MyDatabase.instance.close();

    super.dispose();
  }

  Future refreshGoods() async {
    setState(() => isLoading = true);

    goods = await MyDatabase.instance.readGoods();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 20),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.all(5),
              child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search item',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                // Perform search operation
              },
            ),
            )
          ),
          const Text("List of your goods", style: TextStyle(
              color: Color.fromRGBO(26, 28, 74, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
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
                    DataColumn(label: Text('Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Unit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Quantity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Purchase price', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Sale price', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)))
                  ], rows: const [
                    DataRow(cells: [
                      DataCell(
                        Text('Product 1')),
                      DataCell(
                        Text('kg')),
                      DataCell(
                        Text('120')),
                      DataCell(
                        Text('10')),
                      DataCell(
                        Text('15')),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Text('Product 2')),
                      DataCell(
                        Text('m')),
                      DataCell(
                        Text('15')),
                      DataCell(
                        Text('12')),
                      DataCell(
                        Text('17')),
                    ]),
                    DataRow(cells: [
                      DataCell(
                        Text('Product 3')),
                      DataCell(
                        Text('l')),
                      DataCell(
                        Text('10')),
                      DataCell(
                        Text('1')),
                      DataCell(
                        Text('2')),
                    ]),
                  ]
                ),
              )
          )
        )],
      );
  }
}