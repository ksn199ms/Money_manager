import 'package:flutter/material.dart';

import '../db/category/category_db.dart';
import '../models/category/category_model.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().incomeCategoryListListener,
      builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final Category = newList[index];
            return Card(
              child: ListTile(
                title: Text(Category.name),
                trailing: IconButton(
                    onPressed: () {
                      CategoryDB.instence.deleteCategory(Category.id);
                    },
                    icon: const Icon(Icons.delete)),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: newList.length,
        );
      },
    );
  }
}
