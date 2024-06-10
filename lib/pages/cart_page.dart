import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp/models/drink.dart';
import 'package:myapp/models/shop.dart';

import 'package:myapp/components/drink_tile.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // remove drink from cart
  void removeFromCart(Drink drink) {
    Provider.of<BubbleTeaShop>(
      context,
      listen: false,
    ).removeFromCart(drink);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BubbleTeaShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            children: [
              // heading
              Text(
                'Your Cart',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 10),

              // list of cart items
              Expanded(
                child: ListView.builder(
                  itemCount: value.cart.length,
                  itemBuilder: (context, index) {
                    // get individual drink in cart first
                    Drink drink = value.cart[index];

                    return DrinkTile(
                      drink: drink,
                      onTap: () => removeFromCart(drink),
                      trailing: Icon(Icons.delete),
                    );
                  },
                ),
              ),

              // pay button
              MaterialButton(
                color: Colors.brown,
                onPressed: () {},
                child: Text(
                  'PAY',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
