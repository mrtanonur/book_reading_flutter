import 'package:book_reading_flutter/providers/book_provider.dart';
import 'package:book_reading_flutter/utils/constants/constants.dart';
import 'package:book_reading_flutter/widgets/texfield/br_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({super.key});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _yazarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BookProvider provider = context.read<BookProvider>();
    _nameController.text = provider.books[provider.bookDetailIndex!].ad;
    _yazarController.text = provider.books[provider.bookDetailIndex!].yazar;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _yazarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        title: const Text("Kitap Güncelleme"),
        backgroundColor: ColorConstants.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: PaddingConstants.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BRTextfield(controller: _nameController, hintText: "Name"),
              const SizedBox(height: SizesConstants.s15),
              BRTextfield(controller: _yazarController, hintText: "Yazar"),
              const SizedBox(height: SizesConstants.s20),
              SizedBox(
                width: SizesConstants.doubleInfinity,
                height: SizesConstants.s50,
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(ColorConstants.accent),
                      elevation: WidgetStateProperty.all(SizesConstants.s2),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(SizesConstants.s8))),
                    ),
                    onPressed: () {
                      context.read<BookProvider>().update(
                          ad: _nameController.text,
                          yazar: _yazarController.text);
                    },
                    child: const Text(
                      "Güncel",
                      style: TextStyle(color: ColorConstants.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
