import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Menyamakan warna latar dengan daftar produk
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Keranjang Belanja', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: ConstrainedBox(
          // Membatasi lebar agar tetap rapi di tengah layar
          constraints: const BoxConstraints(maxWidth: 600), 
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              // Tampilan jika keranjang kosong
              if (state.items.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.remove_shopping_cart_outlined, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        'Keranjang masih kosong',
                        style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                );
              }
              
              // Tampilan jika ada produk di keranjang
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  final product = state.items[index];
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
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.delete_outline, color: Colors.red),
                          onPressed: () {
                            // Menghapus item dan memunculkan notifikasi (SnackBar)
                            context.read<CartCubit>().removeFromCart(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('${product.name} dihapus dari keranjang!'),
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
              );
            },
          ),
        ),
      ),
    );
  }
}