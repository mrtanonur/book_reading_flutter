import 'package:book_reading_flutter/pages/book_detail_page.dart';
import 'package:book_reading_flutter/providers/book_provider.dart';
import 'package:book_reading_flutter/providers/main_provider.dart';
import 'package:book_reading_flutter/utils/enums/book_enums.dart';
import 'package:book_reading_flutter/widgets/alert/br_alert_dialog.dart';
import 'package:book_reading_flutter/widgets/dropdown/br_dropdown.dart';
import 'package:book_reading_flutter/widgets/switch/br_switch.dart';
import 'package:book_reading_flutter/widgets/texfield/br_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants/constants.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  TextEditingController adController = TextEditingController();
  TextEditingController yazarController = TextEditingController();

  String dropdownValue = BookType.values[1].name;
  int selectedValue = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    adController.dispose();
    yazarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(
            horizontal: PaddingConstants.p16, vertical: PaddingConstants.p6),
        scrollDirection: Axis.vertical,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Dark Theme"),
              BRSwitch(
                  value: context.watch<MainProvider>().isDark,
                  onChanged: (value) {
                    context.read<MainProvider>().changeTheme(value);
                  }),
            ],
          ),
          const SizedBox(height: SizesConstants.s20),
          header(),
          const SizedBox(
            height: SizesConstants.s20,
          ),
          form(),
          const SizedBox(
            height: SizesConstants.s30,
          ),
          registeredBooks(),
        ],
      )),
    );
  }

  Widget form() {
    return Column(children: [
      BRTextfield(
        controller: adController,
        hintText: "ad",
      ),
      const SizedBox(height: SizesConstants.s10),
      BRTextfield(
        controller: yazarController,
        hintText: "yazar",
      ),
      const SizedBox(height: SizesConstants.s20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "Book Type:",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          BRDropdownMenu(
              valueMaterial: dropdownValue,
              liste: BookType.values.map((e) => e.name).toList(),
              dropdownValueSetMaterial: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              valueCupertino: selectedValue,
              dropdownValueSetCupertino: (int? selectedItem) {
                setState(() {
                  selectedValue = selectedItem!;
                });
              }),
        ],
      ),
      SizedBox(
        width: SizesConstants.doubleInfinity,
        height: SizesConstants.s50,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(ColorConstants.accent),
              elevation: WidgetStateProperty.all(SizesConstants.s2),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizesConstants.s8))),
            ),
            onPressed: () {
              if (adController.text.isNotEmpty &&
                  yazarController.text.isNotEmpty) {
                context.read<BookProvider>().add(
                      ad: adController.text,
                      yazar: yazarController.text,
                    );
                // bool bookExists =
                //     books.any((book) => book.ad == adController.text);
                //   if (!bookExists) {
                //   } else {
                //     brAlertDialog(
                //       context: context,
                //       title: "Uyarı",
                //       description: "Kitap mevcuttur",
                //     );
                //   }
                // } else {
                //   brAlertDialog(
                //       context: context,
                //       title: "Uyarı",
                //       description: "Tüm alanlar zorunlu");
                // }
              }
            },
            child: const Text(
              "Kaydet",
              style: TextStyle(color: ColorConstants.white),
            )),
      ),
    ]);
  }

  Widget registeredBooks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Kayıtlı Kitaplar",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: SizesConstants.s10,
        ),
        ListView.separated(
            itemCount: context.watch<BookProvider>().books.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            separatorBuilder: (context, index) {
              return const SizedBox(height: SizesConstants.s14);
            },
            itemBuilder: (context, index) {
              return Dismissible(
                key: GlobalKey(),
                direction: DismissDirection.endToStart,
                confirmDismiss: (direction) async {
                  brAlertDialog(
                      context: context,
                      title: "Uyarı",
                      description: "Silmek istediğinizden emin misiniz",
                      confirmText: "Sil",
                      confirmOnPressed: () {
                        context.read<BookProvider>().delete(index: index);
                        Navigator.pop(context);
                      },
                      isDestructive: true);
                  return null;
                },
                background: Container(
                  padding: const EdgeInsets.only(right: PaddingConstants.p16),
                  alignment: Alignment.centerRight,
                  width: SizesConstants.s80,
                  height: SizesConstants.s80,
                  decoration: BoxDecoration(
                      color: ColorConstants.red,
                      borderRadius: BorderRadius.circular(SizesConstants.s5)),
                  child: const Icon(
                    Icons.delete,
                    color: ColorConstants.white,
                  ),
                ),
                child: ListTile(
                    onTap: () {
                      context.read<BookProvider>().bookDetailIndex = index;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BookDetailPage(),
                          ));
                    },
                    shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(SizesConstants.s5),
                        side: const BorderSide(
                            color: ColorConstants.grey, width: .1)),
                    title: Text(
                      context.watch<BookProvider>().books[index].ad,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                        context
                            .watch<BookProvider>()
                            .books[index]
                            .category
                            .name,
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    leading: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(PaddingConstants.p6),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstants.pastelAccent),
                      width: SizesConstants.s30,
                      height: SizesConstants.s30,
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(color: ColorConstants.accent),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.person,
                          size: SizesConstants.s18,
                          color: ColorConstants.grey,
                        ),
                        const SizedBox(
                          width: SizesConstants.s8,
                        ),
                        Text(context.watch<BookProvider>().books[index].yazar,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    )),
              );
            })
      ],
    );
  }

  Widget header() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          AssetsConstants.bookReadingImage,
          height: SizesConstants.s150,
          width: SizesConstants.s350,
        ),
        const SizedBox(
          height: SizesConstants.s10,
        ),
        Text(
          "Kitaplar",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: SizesConstants.s5,
        ),
        Text(
            "İnsanın kendi kendine yapabildiği üç harika ritüelden biri kitap okumaktır.",
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
