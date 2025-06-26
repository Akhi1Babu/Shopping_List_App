import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          
               key: _formkey,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
         
              decoration: InputDecoration(
                labelText: 'Item Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an item name';
                }
                if (value.length < 3) {
                  return 'Item name must be at least 3 characters long';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    initialValue: "1",
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a quantity';
                      } else if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      } else if (int.parse(value) <= 0) {
                        return 'Quantity must be greater than 0';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: DropdownButtonFormField(items: [
                  for (var category in categories.entries)
                    DropdownMenuItem(
                      value: category.value,
                      child: Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            color: category.value.color,
                          ),
                          SizedBox(width: 8),
                          Text(category.value.name),
                        ],
                      ),
                    ),
                ], onChanged: (value) {}))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                _formkey.currentState!.reset();
              },
              child: Text("Reset"),
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 30, 133, 193),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                _formkey.currentState!.validate();
              },
              child: Text("Add Item"),
              style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 30, 133, 193),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
            )
          ],
        )),
      ),
    );
  }
}
