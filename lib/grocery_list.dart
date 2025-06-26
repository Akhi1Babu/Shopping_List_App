import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/dummy_items.dart';
import 'package:shopping_list_app/models/grocery_items.dart';
import 'package:shopping_list_app/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
   List<GroceryItem> _groceryItems = [];
  void _addNewItem() async {
    final  newitem= await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(builder: (context)=>  NewItem() ),) ;
    // Logic to add a new grocery item
    if(newitem != null) {
      setState(() {
        _groceryItems.add(newitem);
      });
    }
    else{
      return;
    }
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
        itemCount: _groceryItems.length,
        itemBuilder: (context,index){
        return ListTile(
            title: Text(_groceryItems[index].name ),
            leading: CircleAvatar(
              backgroundColor: _groceryItems[index].category.color,
              child: Text(_groceryItems[index].quantity.toString()),
            ),
            trailing: Text(
              _groceryItems[index].quantity.toString()
            ),
        );
      })
    );
  }
}