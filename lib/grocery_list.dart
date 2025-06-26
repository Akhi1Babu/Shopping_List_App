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
  bool isEmpty=false;
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
      isEmpty=true;
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
      body: isEmpty ? const Center(
        child: Text('No items in the list. Please add some items.'),
      ) : _groceryItems.isEmpty ? const Center(
        child: Text('No items in the list. Please add some items.'),
      ) :
      
      ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context,index){
        return Dismissible(
          key: ValueKey(_groceryItems[index].name),
           direction: DismissDirection.endToStart, // Swipe right-to-left
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        setState(() {
          _groceryItems.removeAt(index);
          if(_groceryItems.isEmpty) {
            isEmpty=true;
          }
        });
      }
      ,
          child: ListTile(
              title: Text(_groceryItems[index].name ),
              leading: CircleAvatar(
                backgroundColor: _groceryItems[index].category.color,
                child: Text(_groceryItems[index].quantity.toString()),
              ),
              trailing: Text(
                _groceryItems[index].quantity.toString()
              ),
          ),
        );
      })
    );
  }
}