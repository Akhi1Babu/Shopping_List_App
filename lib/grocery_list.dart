import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_items.dart';
import 'package:shopping_list_app/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addNewItem() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  NewItem() ),) ;// Logic to add a new grocery item
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Action to add a new grocery item
              _addNewItem();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context,index){
        return ListTile(
            title: Text(groceryItems[index].name ),
            leading: CircleAvatar(
              backgroundColor: groceryItems[index].category.color,
              child: Text(groceryItems[index].quantity.toString()),
            ),
            trailing: Text(
              groceryItems[index].quantity.toString()
            ),
        );
      })
    );
  }
}