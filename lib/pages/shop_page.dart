import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp/models/shop.dart';
import 'package:myapp/models/drink.dart';

import 'package:myapp/components/drink_tile.dart';

import 'package:myapp/pages/order_page.dart';

class ShopPage extends StatefulWidget {
  ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // user selected a drink, go to order page
  void goToOrderPage(Drink drink) {
    // navigate to order page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderPage(
          drink: drink,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext build) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // heading
              Text(
                "Bubble Tea Shop",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 10),

              // list of drinks for sale
              Expanded(
                child: ListView.builder(
                  itemCount: value.shop.length,
                  itemBuilder: (context, index) {
                    // get individual drink from shop
                    Drink individualDrink = value.shop[index];

                    // return that drink as a nice tile
                    return DrinkTile(
                      drink: individualDrink,
                      onTap: () => goToOrderPage(individualDrink),
                      trailing: const Icon(Icons.arrow_forward),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
