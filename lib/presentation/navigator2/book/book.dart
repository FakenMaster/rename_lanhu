import 'package:flutter/material.dart';

class Book {
  final String title;
  final String author;

  Book(this.title, this.author);
}

class BooksPage extends StatefulWidget {
  @override
  _BooksPageState createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  bool show404 = false;
  Book _selectedBook;

  List<Book> books = [
    Book('Stranger in a Strange Land', 'Robert A. Heinlein'),
    Book('Foundation', 'Isaac Asimov'),
    Book('Fahrenheit 451', 'Ray Bradbury'),
  ];
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          key: Key('BooksListPage'),
          child: BookListScreen(
            books: books,
            onTapped: _handleBookTapped,
          ),
        ),
        if(show404)
        MaterialPage(key: Key('UnknownPage'),child: Text('404'))
        else if (_selectedBook != null) BookDetailsPage(book: _selectedBook)
      ],
      onPopPage: (route, result) {
        print('返回: route: $route,result: $result');
        if (!route.didPop(result)) {
          return false;
        }

        setState(() {
          _selectedBook = null;
        });
        return true;
      },
    );
  }

  void _handleBookTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
  }
}

class BookListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  const BookListScreen({Key key, this.books, this.onTapped}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            )
        ],
      ),
    );
  }
}

class BookDetailsPage extends Page {
  final Book book;

  BookDetailsPage({this.book}) : super(key: ValueKey(book));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (context) {
          return BookDetailsScreen(book: book);
        });
  }
}

class BookDetailsScreen extends StatelessWidget {
  final Book book;

  const BookDetailsScreen({Key key, this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book != null) ...[
              Text(book.title, style: Theme.of(context).textTheme.headline6),
              Text(book.author, style: Theme.of(context).textTheme.subtitle1),
            ],
          ],
        ),
      ),
    );
  }
}
