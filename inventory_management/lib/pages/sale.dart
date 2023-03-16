import 'package:flutter/material.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  String? selectGoodsValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Select goods", style: TextStyle(
              color: Color.fromRGBO(26, 28, 74, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectGoodsValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectGoodsValue = newValue!;
                  });
                },
                items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  style: const TextStyle(color: Color.fromRGBO(26, 28, 74, 1),
                    fontSize: 16, fontWeight: FontWeight.w500), // Set text color
                    borderRadius: BorderRadius.circular(20),
              ),)
          ),
          const SizedBox(height: 20),
          const Text("Quantity of goods", style: TextStyle(
              color: Color.fromRGBO(26, 28, 74, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter quantity for kg'
              ),
            )
          ),
          const SizedBox(height: 20),
          const Text("Unit price of the goods", style: TextStyle(
              color: Color.fromRGBO(26, 28, 74, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Purchase price is 15 and Sale price is 20'
              ),
            )
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(63, 124, 255, 1)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                )),
                minimumSize: MaterialStatePropertyAll(Size(70,70))
                ),

              child: const Text('+', style: TextStyle(fontSize: 20),),
              onPressed: () {},
              )
          ),
          const SizedBox(height: 20),
          const Text("Order list", style: TextStyle(
              color: Color.fromRGBO(26, 28, 74, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith((states) => const Color.fromRGBO(26, 28, 74, 1)),
                  columnSpacing: 30.0,
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  columns: const [
                    DataColumn(label: Text('Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Quantity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Price per unit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                    DataColumn(label: Text('Profit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white))),
                  ], rows: const [
                    DataRow(cells: [
                      DataCell(
                        Text('Jeu')),
                      DataCell(
                        Text('Jeu')),
                      DataCell(
                        Text('Jeu')),
                      DataCell(
                        Text('Jeu')),
                    ]),
                  ]
                ),
              )
          ),
        ),
        const SizedBox(height: 20),
          const Text("Discount", style: TextStyle(
              color: Color.fromRGBO(26, 28, 74, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Optional'
              ),
            )
          ),
        const SizedBox(height: 20),
        Row(
          children: const [
            Text("Amount: ", style: TextStyle(
            color: Color.fromRGBO(26, 28, 74, 1),
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
        ),
          Text("20", style: TextStyle(
              color: Color.fromRGBO(63, 124, 255, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: const [
            Text("Benefit: ", style: TextStyle(
            color: Color.fromRGBO(26, 28, 74, 1),
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
        ),
          Text("10", style: TextStyle(
              color: Color.fromRGBO(41, 187, 25, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: const [
            Text("Benefit: ", style: TextStyle(
            color: Color.fromRGBO(26, 28, 74, 1),
            fontSize: 20,
            fontWeight: FontWeight.w500
          ),
        ),
          Text("-10", style: TextStyle(
              color: Color.fromRGBO(187, 25, 25, 1),
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          ],
        ),
        const SizedBox(height: 20),
        Center(
            child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(63, 124, 255, 1)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                )),
                minimumSize: MaterialStatePropertyAll(Size(70,70))
                ),

              child: const Text('Confirm', style: TextStyle(fontSize: 20),),
              onPressed: () {},
              )
          ),
        ],
      ),
    );
  }
}