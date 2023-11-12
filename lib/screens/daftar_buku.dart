import 'package:flutter/material.dart';
import 'package:book_catalog/models/book_model.dart';
import 'package:book_catalog/widgets/left_drawer.dart';

class BookListPage extends StatelessWidget {
  final List<Book> books;

  const BookListPage({required this.books, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Daftar Buku',
          ),
        ),
        backgroundColor: Colors.deepPurple.shade700,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          Book book = books[index];
          return ListTile(
            title: Text(book.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Amount: ${book.amount.toString()}'),
                Text('Description: ${book.description}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
