import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp/models/drink.dart';
import 'package:myapp/models/shop.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;

  OrderPage({super.key, required this.drink});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  // customize sweetness
  double sweetValue = 0.5;
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  // customize ice
  double iceValue = 0.25;
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  // customize pearls
  double pearlsValue = 0.75;
  void customizePearls(double newValue) {
    setState(() {
      pearlsValue = newValue;
    });
  }

  // add to cart
  void addToCart() {
    // firstly, add to cart
    Provider.of<BubbleTeaShop>(
      context,
      listen: false,
    ).addToCart(widget.drink);

    // direct user back to shop page
    Navigator.pop(context);

    // let user know it has been successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Successfully added to cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text(
          widget.drink.name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          // drink image
          Image.asset(widget.drink.imagePath, scale: 2),

          // sliders to customize the drink
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                // sweetness slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text('Sweet'),
                    ),
                    Expanded(
                      child: Slider(
                        value: sweetValue,
                        label: sweetValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeSweet(value),
                        thumbColor: Colors.brown,
                        activeColor: Colors.brown,
                        inactiveColor: Colors.brown[300],
                      ),
                    ),
                  ],
                ),

                // ice slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text('Ice'),
                    ),
                    Expanded(
                      child: Slider(
                        value: iceValue,
                        label: iceValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizeIce(value),
                        thumbColor: Colors.brown,
                        activeColor: Colors.brown,
                        inactiveColor: Colors.brown[300],
                      ),
                    ),
                  ],
                ),

                // pearls slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 100,
                      child: Text('Pearls'),
                    ),
                    Expanded(
                      child: Slider(
                        value: pearlsValue,
                        label: pearlsValue.toString(),
                        divisions: 4,
                        onChanged: (value) => customizePearls(value),
                        thumbColor: Colors.brown,
                        activeColor: Colors.brown,
                        inactiveColor: Colors.brown[300],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // add to cart button
          MaterialButton(
            color: Colors.brown,
            onPressed: addToCart,
            child: Text(
              'Add to cart',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
