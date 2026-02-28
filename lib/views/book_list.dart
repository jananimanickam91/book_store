import 'package:flutter/material.dart';
import 'package:flutter_book_task/model/book_model.dart';

class BookList extends StatefulWidget {
  const BookList({super.key});

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final List<Book> _books = [
    Book(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', coverUrl: 'assets/images/The_Great_Gatsby.jpg'),
    Book(title: 'To Kill a Mockingbird', author: 'Harper Lee', coverUrl: 'assets/images/To_Kill_a_Mockingbird.jpg'),
    Book(title: '1984', author: 'George Orwell', coverUrl: 'assets/images/1984.jpg'),
  ];

  final List<Book> _newBooks = [
    Book(title: 'Brave New World', author: 'Aldous Huxley', coverUrl: 'assets/images/Brave_New_World.jpg'),
    Book(title: 'The Catcher in the Rye', author: 'J.D. Salinger', coverUrl: 'assets/images/The_Catcher_in_the_Rye.png'),
    Book(title: 'The Hobbit', author: 'J.R.R. Tolkien', coverUrl: 'assets/images/The_Hobbit.jpg'),
    Book(title: "Harry Potter and the Philosopher's Stone", author: 'J.K. Rowling', coverUrl: 'assets/images/Harry_Potter.jpg'),
  ];

  int _newBookIndex = 0;

  void _addBook() {
    if (_newBookIndex >= _newBooks.length) return;
    setState(() {
      _books.add(_newBooks[_newBookIndex]);
      _newBookIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text('Book List', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22, letterSpacing: 1.2)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(20)),
                child: Text('${_books.length} Books', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13)),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(28), bottomRight: Radius.circular(28)),
            ),
            child: const Text(
              'Tap the button below to add more books!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
              itemCount: _books.length,
              itemBuilder: (context, index) => _buildBookCard(index),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _newBookIndex >= _newBooks.length ? null : _addBook,
        backgroundColor: _newBookIndex >= _newBooks.length ? Colors.grey : Colors.blue,
        foregroundColor: Colors.white,
        elevation: 6,
        icon: const Icon(Icons.add),
        label: Text(
          _newBookIndex >= _newBooks.length ? 'All Books Added' : 'Add Book',
          style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
    );
  }

  Widget _buildBookCard(int index) {
    final book = _books[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.07), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child:
                  book.coverUrl != null
                      ? Image.asset(
                        book.coverUrl!,
                        width: 52,
                        height: 72,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => _coverPlaceholder(),
                      )
                      : _coverPlaceholder(),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1A1A2E))),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.person_outline, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          book.author,
                          style: TextStyle(fontSize: 13, color: Colors.grey[700], fontStyle: FontStyle.italic),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Icon(Icons.menu_book_rounded, color: Colors.blue, size: 28),
          ],
        ),
      ),
    );
  }

  Widget _coverPlaceholder() {
    return Container(
      width: 52,
      height: 72,
      decoration: BoxDecoration(color: Colors.blue.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
      child: const Icon(Icons.book, color: Colors.blue, size: 28),
    );
  }
}
