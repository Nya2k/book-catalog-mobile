import 'package:flutter/material.dart';
import 'package:book_catalog/screens/daftar_buku.dart';
import 'package:book_catalog/screens/book_form.dart';
import 'package:book_catalog/models/book_model.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          if (item.name == "Tambah Buku") {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const BookFormPage()));
          } else if (item.name == "Lihat Buku") {
            List<Book> books = [
                Book(name: 'Buku 1', amount: 10, description: 'Description'),
                Book(name: 'Buku 2', amount: 15, description: 'Description'),
            ];
            Navigator.push(context, MaterialPageRoute(builder: (context) => BookListPage(books: books)));
          }
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}