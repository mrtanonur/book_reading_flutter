import 'package:book_reading_flutter/utils/enums/book_enums.dart';

class BookModel {
  String name;
  String author;
  bool isRead;
  BookType category;

  BookModel(
      {required this.name,
      required this.author,
      this.isRead = false,
      required this.category});

  @override
  String toString() {
    return "BookModel: Ad:$name  Yazar:$author isRead:$isRead  Category:$category";
  }
}
