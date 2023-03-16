import 'package:flutter/material.dart';
import 'package:inventory_management/common_widgets/app_bar.dart';

class PurhaseNewItemPage extends StatefulWidget {
  const PurhaseNewItemPage({super.key});

  @override
  State<PurhaseNewItemPage> createState() => _PurhaseNewItemPageState();
}

class _PurhaseNewItemPageState extends State<PurhaseNewItemPage> {
  String? selectUnitValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter name'
              ),
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
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter quantity'
              ),
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
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter purchase price per unit'
              ),
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
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter sale price per unit'
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

              child: const Text('Confirm', style: TextStyle(fontSize: 20),),
              onPressed: () {},
              )
          ),
        ],
      ),
    );
  }
}