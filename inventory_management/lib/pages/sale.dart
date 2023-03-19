import 'package:flutter/material.dart';

import '../db/database.dart';
import '../models/goods.dart';

class SalePage extends StatefulWidget {
  final Goods? selectedGoods;
  const SalePage({
    Key? key,
    this.selectedGoods,
  }) : super(key: key);

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  int? selectGoodsValue;

  List<Goods> goodsList = [];

  List<DataRow> rows = [];

  double amount = 0;
  double profit = 0;

  final _formKey = GlobalKey<FormState>();
  late String name;
  late double quantity;
  late double salesPrice;

  List<Widget> addedItems = [];

  @override
  void initState() {
    super.initState();
    _getGoodsList();
    name = widget.selectedGoods?.name ?? '';
    quantity = widget.selectedGoods?.quantity ?? 0.0;
    salesPrice = widget.selectedGoods?.salesPrice ?? 0.0;

  }

  Future<void> _getGoodsList() async {
    final List<Goods> goods = await MyDatabase.instance.readGoods(); // replace 'Goods' with the name of your goods class
    setState(() {
      goodsList = goods.where((g) => g.name.isNotEmpty).toList(); // populate the goodsList with the names of the goods
      selectGoodsValue = goodsList.first.id; // set the default value for the dropdown to the first item in the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
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
                child: DropdownButton<int>(
                  value: selectGoodsValue,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectGoodsValue = newValue!;
                    });
                  },
                  items: goodsList
                    .map<DropdownMenuItem<int>>((Goods goods) {
                      return DropdownMenuItem<int>(
                        value: goods.id,
                        child: Text(goods.name),
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
              child: TextFormField(
                initialValue: quantity != 0 ? quantity.toString() : null,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter quantity'
                ),
                validator:(value) {
                  if( value == null || value == ''){
                    return "Enter a quantity value";
                  } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return "It is not a valid quantity value";
                  }
                  return null;
                },
                onSaved: (value) {
                  quantity = double.parse(value!);
                },
              ),
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
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Purchase price is 15 and Sale price is 20'
                ),
                validator:(value) {
                  if( value == null || value == ''){
                    return "Enter a sales value";
                  } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
                    return "It is not a valid sales value";
                  }
                  return null;
                },
                onSaved: (value) {
                  salesPrice = double.parse(value!);
                },
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
                onPressed: add,
                child: const Text('+', style: TextStyle(fontSize: 20),),
              )
            ),
            Column(
              children: addedItems,
            )
          ],
        ),
      ),
    );
  }

  Future add() async {

    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      final selectedGoods = await MyDatabase.instance.readSingleGoods(selectGoodsValue);

      amount += (quantity * salesPrice);
      profit += (salesPrice - selectedGoods.purchasePrice);

      final newRow = DataRow(
        cells: [
          DataCell(Text(selectedGoods.name, style: const TextStyle(fontSize: 16))),
          DataCell(Text(quantity.toString(), style: const TextStyle(fontSize: 16))),
          DataCell(Text(salesPrice.toString(), style: const TextStyle(fontSize: 16))),
          DataCell(Text((salesPrice - selectedGoods.purchasePrice).toString(), style: const TextStyle(fontSize: 16))),
        ],
      );
      setState(() {
        rows.add(newRow);

        addedItems = [
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
                    ], rows: rows
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
            children: [
              const Text("Amount: ", style: TextStyle(
              color: Color.fromRGBO(26, 28, 74, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          ),
            Text(amount.toString(), style: const TextStyle(
                color: Color.fromRGBO(63, 124, 255, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text("Profit: ", style: TextStyle(
              color: Color.fromRGBO(26, 28, 74, 1),
              fontSize: 20,
              fontWeight: FontWeight.w500
            ),
          ),
            Text(profit.toString(), style: TextStyle(
                color: profit >= 0 ? const Color.fromRGBO(41, 187, 25, 1): const Color.fromRGBO(187, 25, 25, 1),
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
          
        ];
      });
    }
  }
}