import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Pastikan import ini sesuai dengan nama folder dan file yang sudah kita buat
import 'cubit/cart_cubit.dart';
import 'screens/product_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Kita membungkus MaterialApp dengan BlocProvider 
    // agar CartCubit (State Management) bisa diakses di seluruh halaman aplikasi
    return BlocProvider(
      create: (context) => CartCubit(),
      child: MaterialApp(
        title: 'Tugas Modul 15 - State Management',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        // Halaman pertama yang akan tampil adalah daftar produk
        home: ProductListScreen(), 
        // Menghilangkan tulisan "DEBUG" di pojok kanan atas
        debugShowCheckedModeBanner: false, 
      ),
    );
  }
}