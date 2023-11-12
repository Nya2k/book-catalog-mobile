import 'package:book_catalog/screens/daftar_buku.dart';
import 'package:flutter/material.dart';
import 'package:book_catalog/screens/menu.dart';
import 'package:book_catalog/screens/book_form.dart';
import 'package:book_catalog/models/book_model.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Column(
              children: [
                Text(
                  'Book Catalog',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Catat seluruh wishlist bukumu di sini!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Buku'),
            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BookFormPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text('Daftar Buku'),
            onTap: () {
              List<Book> books = [
                Book(name: 'Buku 1', amount: 10, description: 'Description'),
                Book(name: 'Buku 2', amount: 15, description: 'Description'),
              ];
              Navigator.push(context, MaterialPageRoute(builder: (context) => BookListPage(books: books)));
            },
          ),
        ],
      ),
    );
  }
}