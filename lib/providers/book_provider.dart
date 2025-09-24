import 'package:book_reading_flutter/models/book_model.dart';
import 'package:book_reading_flutter/utils/enums/book_enums.dart';
import 'package:flutter/material.dart';

class BookProvider extends ChangeNotifier {
  List<BookModel> books = [];
  int? bookDetailIndex;

  void add({required String ad, required String yazar}) {
    final BookModel book = BookModel(
      ad: ad,
      yazar: yazar,
      category: BookType.adventure,
    );
    books.add(book);
    notifyListeners();
  }

  void delete({required int index}) {
    books.removeAt(index);
    notifyListeners();
  }

  void update({required String ad, required String yazar}) {
    books[bookDetailIndex!].ad = ad;
    books[bookDetailIndex!].yazar = yazar;
    print(books[bookDetailIndex!].toString());
    notifyListeners();
  }
}
