import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cart_cubit.dart';
import '../models/product.dart';
import 'cart_screen.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final List<Product> products = [
    const Product(id: '1', name: 'Laptop Gaming', price: 15000000),
    const Product(id: '2', name: 'Mouse Wireless', price: 250000),
    const Product(id: '3', name: 'Keyboard Mekanikal', price: 750000),
    const Product(id: '4', name: 'Monitor 24 Inch', price: 2000000),
    const Product(id: '5', name: 'Headset Bluetooth', price: 500000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Memberikan warna latar belakang yang lembut
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Daftar Produk', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, size: 28),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CartScreen()),
                  );
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    if (state.items.isEmpty) return const SizedBox.shrink();
                    return CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.redAccent,
                      child: Text(
                        '${state.items.length}',
                        style: const TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          // Membatasi lebar maksimal agar tidak melar di browser PC
          constraints: const BoxConstraints(maxWidth: 600), 
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                elevation: 2,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Rp ${product.price.toStringAsFixed(0)}', 
                      style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.w600),
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add_shopping_cart, color: Colors.blue),
                      onPressed: () {
                        context.read<CartCubit>().addToCart(product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} ditambahkan!'),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}