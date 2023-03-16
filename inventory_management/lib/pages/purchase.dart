import 'package:flutter/material.dart';
import 'package:inventory_management/pages/purchase_new_item.dart';
import 'package:inventory_management/pages/purchase_existing_item.dart';

class PurchasePage extends StatelessWidget {
  const PurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PurhaseNewItemPage()),
              );
            },
            child: const Text('purchase of out-of-stock goods', 
              style: TextStyle(color: Color.fromRGBO(63, 124, 255, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500)),
          ),
          const Text('or', style: TextStyle(fontSize: 16),),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PurchaseExistingItemPage()),
              );
            },
            child: const Text('purchase of goods in stock', 
              style: TextStyle(color: Color.fromRGBO(63, 124, 255, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}