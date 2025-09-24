import 'package:book_reading_flutter/utils/enums/book_enums.dart';

class BookModel {
  String ad;
  String yazar;
  bool isRead;
  BookType category;

  BookModel(
      {required this.ad,
      required this.yazar,
      this.isRead = false,
      required this.category});

  @override
  String toString() {
    return "BookModel: Ad:$ad  Yazar:$yazar isRead:$isRead  Category:$category";
  }
}
