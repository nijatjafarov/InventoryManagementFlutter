import 'package:flutter/material.dart';
import 'package:inventory_management/db/database.dart';
import '../common_widgets/app_bar.dart';
import '../models/goods.dart';

class PurchaseExistingItemPage extends StatefulWidget {
  final Goods? selectedGoods;
  const PurchaseExistingItemPage({
    Key? key,
    this.selectedGoods,
  }) : super(key: key);

  @override
  State<PurchaseExistingItemPage> createState() => _PurchaseExistingItemPageState();
}

class _PurchaseExistingItemPageState extends State<PurchaseExistingItemPage> {
  int? selectGoodsValue;

  List<Goods> goodsList = [];

  final _formKey = GlobalKey<FormState>();
  late String name;
  late double quantity;

  @override
  void initState() {
    super.initState();
    _getGoodsList();
    name = widget.selectedGoods?.name ?? '';
    quantity = widget.selectedGoods?.quantity ?? 0.0;

  }

  // function to fetch the goods list from the database
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
      child: Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      appBar: const MyAppBar(titl: Text('Purchase of goods in stock')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text("Item", style: TextStyle(
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
              onSaved: (value) {
                quantity = double.parse(value!);
              },
            ),
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
              onPressed: update,
              child: const Text('Confirm', style: TextStyle(fontSize: 20),),
              )
          ),
        ],
      ),
    ),
  );
  }

  Future update() async {
    if(_formKey.currentState!.validate()){
      //final isUpdating = widget.goods != null;
      _formKey.currentState!.save();
      final selectedGoods = await MyDatabase.instance.readSingleGoods(selectGoodsValue);
      final updatedGoods = selectedGoods.copy(quantity: selectedGoods.quantity + quantity);
      await MyDatabase.instance.updateGoods(updatedGoods);
      Navigator.of(context).pop(selectedGoods);
    }
  }
}