import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:money_manager_flutter/db/category/category_db.dart';
import 'package:money_manager_flutter/models/category/category_model.dart';

class ExpensesCategoryList extends StatelessWidget {
  const ExpensesCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expenseCategoryListListener,
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
