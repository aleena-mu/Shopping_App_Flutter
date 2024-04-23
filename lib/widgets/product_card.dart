import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProductCard extends StatelessWidget {
  final int id;
  final String title;
  final double price;
  final String imageUrl;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),

        color:id.isEven?const Color.fromRGBO(216, 240, 253, 1)
            :const Color.fromRGBO(245, 247, 249, 1),

      ),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [

          Text(title,style:GoogleFonts.lato(
              textStyle:Theme.of(context).textTheme.titleMedium),
          ),
         const  SizedBox(height: 5),
          Text('\$$price',
            style:GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 5),
          Center(child: Image(image: AssetImage(imageUrl),height: 175,))

        ],
      ),

    );
  }
}
