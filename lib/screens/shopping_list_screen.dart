import 'package:flutter/material.dart';
import 'package:flutter_todo_v2/core/constants/app_constants.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> shoppingList = [];

  @override
  void dispose() {
    //belleği temizlemeye yardımcı olur.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: AppSizes.appbarHeight,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.appBarColor,
            borderRadius: AppSizes.appbarBorder,
          ),
          child: AppBar(
            title: Text(
              Strings.appBarTitle,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: AppColors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child:
                shoppingList.isEmpty
                    ? const Center(
                      //liste boşsa ekrana no context yazısını getir.
                      child: Text(
                        Strings.noContext,
                        style: TextStyle(
                          color: AppColors.notitemscolor,
                          fontSize: 16,
                        ),
                      ),
                    )
                    : ListView.builder(
                      //False ise ekrana listedeki elemanları listele.
                      padding: const EdgeInsets.only(bottom: 10),
                      itemCount: shoppingList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12, //sağ ve soldan bosluk
                            vertical: 8, //yukarıdan ve aşağıdan boşluk verir
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.cardColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: shoppingList[index]['bought'],
                                onChanged: (value) {
                                  setState(() {
                                    shoppingList[index]['bought'] =
                                        value!; //value! null gelme ihtimali yok demek.
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  shoppingList[index]['title'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    decoration:
                                        shoppingList[index]['bought']
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none,
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: AppColors.deleteColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    shoppingList.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: Strings.textfileLabel,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                if (_controller.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text(Strings.errorBar)),
                  );
                  return;
                }
                setState(() {
                  shoppingList.add({
                    'title': _controller.text,
                    'bought': false,
                  });
                  _controller.clear();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF8A65),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                Strings.addText,
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
