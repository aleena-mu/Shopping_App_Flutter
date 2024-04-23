import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';


class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;


  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize=0;
  
  void onTap() {
    if (selectedSize != 0) {
      Provider.of<CartProvider>(context, listen: false).addProduct(
        {
          'id': widget.product['id'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'imageUrl': widget.product['imageUrl'],
          'company': widget.product['company'],
          'size': selectedSize,
        },
      );
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Product Added To Cart')));

    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a size')));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: GoogleFonts.lato(),
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String,height: 200),
          ),
          const Spacer(),
          Container(
            height: 250,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: GoogleFonts.lato(
                    textStyle: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      itemBuilder: (context, index) {
                        final size = (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(onTap: (){
                            setState(() {
                           selectedSize=size;
                            });
                          },
                            child: Chip(
                              backgroundColor: selectedSize==size? Theme.of(context).colorScheme.primary :null,
                              label: Text(
                                size.toString(),
                                style: GoogleFonts.lato(),
                              ),
                              labelStyle: const TextStyle(fontSize: 16),
                            ),
                          ),
                        );
                      }),
                ),

                  Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        fixedSize: const Size(250, 50),
                      ),


                      onPressed: onTap,
                    icon:const Icon(Icons.shopping_cart,color: Colors.black,),
                      label: Text('Add To Cart',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(fontSize: 18,color: Colors.black),
                          ),
                      ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
