import 'package:book_reading_flutter/models/book_model.dart';
import 'package:book_reading_flutter/utils/enums/book_enums.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier {
  List<BookModel> books = [];
  int? bookDetailIndex;

  void add({required String name, required String author}) {
    final BookModel book = BookModel(
      name: name,
      author: author,
      category: BookType.adventure,
    );
    books.add(book);
    notifyListeners();
  }

  void delete({required int index}) {
    books.removeAt(index);
    notifyListeners();
  }

  void update({required String name, required String author}) {
    books[bookDetailIndex!].name = name;
    books[bookDetailIndex!].author = author;
    notifyListeners();
  }
}
