import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_court/core/router/router.dart';
import 'package:food_court/src/widgets/widgets.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  CheckoutPageState createState() => CheckoutPageState();
}

class CheckoutPageState extends State<CheckoutPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: theme.textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 40,
              ),
              color: theme.colorScheme.surface,
              child: const CuponCard(),
            ),
            // User Information
            const Text(
              'User Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                labelStyle: theme.textTheme.labelLarge!.copyWith(
                  color: theme.textTheme.labelLarge!.color!.withOpacity(0.7),
                ),
              ),
            ),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: theme.textTheme.labelLarge!.copyWith(
                  color: theme.textTheme.labelLarge!.color!.withOpacity(0.7),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Delivery Address
            const Text(
              'Delivery Address',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                labelStyle: theme.textTheme.labelLarge!.copyWith(
                  color: theme.textTheme.labelLarge!.color!.withOpacity(0.7),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // List of items
            Expanded(
              child: ListView(
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text('Item 1'),
                    subtitle: Text('Quantity: 1'),
                    trailing: Text('\$10.00'),
                  ),
                  ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text('Item 2'),
                    subtitle: Text('Quantity: 2'),
                    trailing: Text('\$20.00'),
                  ),
                  // Add more items as needed
                ],
              ),
            ),
            const SizedBox(height: 16.0),

            // Total and Payment Button
            Text(
              'Total: \$30.00',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final address = _addressController.text;
                final phone = _phoneController.text;
                // Implement payment logic
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Payment Processing'),
                    content: Text(
                      'Processing payment for $name.\nAddress: $address\nPhone: $phone',
                    ),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.go(PathName.products);
                        },
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Proceed to Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
