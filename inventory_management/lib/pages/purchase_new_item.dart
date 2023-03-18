import 'package:flutter/material.dart';
import 'package:inventory_management/common_widgets/app_bar.dart';
import 'package:inventory_management/db/database.dart';
import 'package:inventory_management/models/goods.dart';

class PurhaseNewItemPage extends StatefulWidget {
  final Goods? goods;

  const PurhaseNewItemPage({
    Key? key,
    this.goods,
  }) : super(key: key);

  @override
  State<PurhaseNewItemPage> createState() => _PurhaseNewItemPageState();
}

class _PurhaseNewItemPageState extends State<PurhaseNewItemPage> {
  List<String> measurementUnits = ['inch', 'foot', 'meter', 'centimeter', 'millimeter', 'square foot', 'square meter', 'square inch', 'hectare', 'acre', 'gallon', 'liter', 'milliliter', 'cubic feet', 'cubic meter', 'pound', 'kilogram', 'gram', 'ounce', 'second', 'minute', 'hour', 'day', 'week', 'month', 'year', 'dozen', 'gross', 'unit', 'piece'];
  String? selectUnitValue = 'inch';

  final _formKey = GlobalKey<FormState>();
  late String name;
  late String measurementUnit;
  late double quantity;
  late double purchasePrice;
  late double salesPrice;

  @override
  void initState() {
    super.initState();

    name = widget.goods?.name ?? '';
    measurementUnit = widget.goods?.measurementUnit ?? measurementUnits[0];
    quantity = widget.goods?.quantity ?? 0.0;
    purchasePrice = widget.goods?.purchasePrice ?? 0.0;
    salesPrice = widget.goods?.salesPrice ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: const MyAppBar(titl: Text('Purchase of out-of-stock goods')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Name", style: TextStyle(
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
              initialValue: name,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter name'
              ),
              validator: (value) {
                if(value == null || value == '') {
                  return "Enter a value";
                }
                return null;
              },
            )
          ),
          const SizedBox(height: 20),
          const Text("Unit of measurement", style: TextStyle(
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
                value: selectUnitValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectUnitValue = newValue!;
                  });
                },
                items: measurementUnits
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
          const Text("Quantity", style: TextStyle(
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
            )
          ),
          const SizedBox(height: 20),
          const Text("Purchase price", style: TextStyle(
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
              initialValue: purchasePrice != 0 ? purchasePrice.toString() : null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter purchase price per unit'
              ),
              
              validator:(value) {
                if( value == null || value == ''){
                  return "Enter a price value";
                } else if (double.tryParse(value) == null || double.parse(value) <= 0) {
                  return "It is not a valid price value";
                }
                return null;
              },
            )
          ),
          const SizedBox(height: 20),
          const Text("Sale price", style: TextStyle(
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
              initialValue: salesPrice != 0 ? salesPrice.toString() : null,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter sale price per unit'
              ),
              validator:(value) {
                if( value != null && value != ''){
                  if (double.tryParse(value) == null  || double.parse(value) <= 0) {
                  return "It is not a valid price value";
                  }
                }
                return null;
              },
            )
          ),
        const SizedBox(height: 50),
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
              onPressed: addOrUpdateGoods,
              )
          ),
        ],
      ),
    ),
  );
  }

  void addOrUpdateGoods() async {
    if(_formKey.currentState!.validate()){
      final isUpdating = widget.goods != null;

      if(isUpdating) {
        await updateGoods();
      } else {
        await addGoods();
      }
      Navigator.of(context).pop();
    }
  }
  Future updateGoods() async {
    final goods = widget.goods!.copy(
      name: name,
      measurementUnit: measurementUnit,
      quantity: quantity,
      purchasePrice: purchasePrice,
      salesPrice: salesPrice
    );

    await MyDatabase.instance.updateGoods(goods);
  }

  Future addGoods() async {
    final goods = Goods(
      name: name,
      measurementUnit: measurementUnit,
      quantity: quantity,
      purchasePrice: purchasePrice,
      salesPrice: salesPrice
    );

    await MyDatabase.instance.createGoods(goods);
  }
}