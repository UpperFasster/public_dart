import 'package:flutter/material.dart';
import 'package:food_court/src/clippers/clippers.dart';

class CuponCard extends StatelessWidget {
  const CuponCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: ClipPath(
          clipper: NotchShapeClipper(),
          child: Container(
            color: Colors.yellow[600],
            padding: const EdgeInsets.all(30),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Amount',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '\$04.00',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Divider(color: Colors.black),
                SizedBox(height: 8),
                Text(
                  'Total Amount',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'USD 38.00',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Image.network(
                //         'https://via.placeholder.com/50',
                //         width: 50,
                //       ),
                //       Image.network(
                //         'https://via.placeholder.com/50',
                //         width: 50,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
