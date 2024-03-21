import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/firebase_firestore.dart';

class ChangePage extends StatefulWidget {
  ChangePage({super.key});

  @override
  State<ChangePage> createState() => _ChangePageState();
}

class _ChangePageState extends State<ChangePage> {
  TextEditingController controller = TextEditingController();
   String selectedValue = Get.arguments["category"];
  var items = [
    'other',
    'engine',
    'body',
    'chassis',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: const Text(
          "Изменить",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              hintStyle: const TextStyle(color: Colors.white),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(color: Colors.white)),
            ),
            controller: controller
              ..text = Get.arguments["description"].toString(),
          ),
          const SizedBox(height: 24,),
          DropdownButton(
              value: selectedValue,
              onChanged: (String? newValue){
                setState(() {
                  selectedValue = newValue!;
                });
              },
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items, style: TextStyle(color: Colors.black26, fontSize: 24),),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 48,
          ),
          TextButton(
              onPressed: () {
                if (selectedValue != Get.arguments["category"]) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(

                        backgroundColor: Colors.white,
                        content: Text("перемещение из " +  Get.arguments["category"].toString() + " в " + selectedValue + " выполнено успешно", style: TextStyle(color:Colors.black, fontSize: 24),),
                      )
                  );
                  FirebaseFirestoreService().moveProblem(
                      id: Get.arguments["id"],
                      category: Get.arguments["category"],
                      newCategory: selectedValue);
                  Navigator.pop(context);

                }
                else
                  {
                    Navigator.pop(context);
                  }
              },
              child: const Text(
                "Переместить",
                style: TextStyle(color: Colors.white, fontSize: 24),
              )),
          const SizedBox(
            height: 24,
          ),
          TextButton(
              onPressed: () {
                FirebaseFirestoreService().removeFromDB(Get.arguments["id"].toString(), Get.arguments["category"]);
                Navigator.pop(context);
              },
              child: const Text(
                "Удалить",
                style: TextStyle(color: Colors.white, fontSize: 24),
              )),
        ],
      ),
    );
  }
}
