import 'package:auto_manager_list/ui/changePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/firebase_firestore.dart';

class OtherPage extends StatelessWidget {
  const OtherPage({super.key});

  final String category = "other";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: Text("Неопределенные", style: TextStyle(color: Colors.white),),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestoreService().getProblemsOther(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Ошибка: ${snapshot.error}"),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final problem =
                      snapshot.data?[index]; // Access problem from list
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => ChangePage(), arguments: {
                        "id": problem?.id,
                        "description": problem?.description,
                        "category": category,
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.black26,
                            border: const Border.symmetric(),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
                            child: ListTile(
                                title: Text(
                              problem?.description ?? "",
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 24),
                            )),
                          )),
                    ),
                  );
                });
          }),
    );
  }
}
