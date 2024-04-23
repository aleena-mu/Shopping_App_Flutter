import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body:cart.isEmpty?const Center(child: Text('Cart is Empty')) :ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return  ListTile(
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Delete Product',
                              style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                            ),
                            content: const Text('Are you sure you want to remove this product from the cart?'),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.of(context).pop();
                              }, child: const Text('Cancel',style:TextStyle(
                                color: Colors.blue,
                                 ),
                               ),
                              ),
                              TextButton(onPressed: (){
                                Provider.of<CartProvider>(context,listen: false).removeProduct(cartItem);
                                Navigator.of(context).pop();
                              },
                                child: const Text('Yes',style:TextStyle(
                                color: Colors.red,
                                ),
                               ),
                              ),

                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(cartItem['imageUrl'].toString()),
                ),
                title: Text(
                  cartItem['title'].toString(),
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
                ),
                subtitle: Text('Size :${cartItem['size']}'),
              );
            }));
  }
}
