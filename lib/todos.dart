import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> todos=[
    "Team Meeting Agenda",
    "Review LinkedIn Profile",
    "Project Proposal Outline",
    "Research Industry Trends",
  ];
  TextEditingController textController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Todos List"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context,index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade900,
                      offset: const Offset(4.0,4.0),
                      blurRadius: 8,
                      spreadRadius: 1.0,
                    ),
                    const BoxShadow(
                      color: Colors.white10,
                      offset: Offset(-4.0,-4.0),
                      blurRadius: 8,
                      spreadRadius: 1.0,
                    ),
                  ]
                ),
                child: ListTile(
                  title: Text(todos[index]),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: (){
                          _editTodo(context,index);
                        },
                        icon: const Icon(Icons.edit_note_rounded),
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            todos.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete_rounded),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _addTodo(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  void _addTodo(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Add Todo"),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: "Enter your Todo:"),
          ),
          actions: [
            TextButton(
              onPressed: (){
                textController.clear();
                Navigator.of(context).pop();
              },
              child: const Text("Cancel")
            ),
            TextButton(
              onPressed: (){
                setState(() {
                  if(textController.text.isNotEmpty) {
                    todos.add(textController.text);
                  }
                });
                textController.clear();
                Navigator.of(context).pop();
              },
              child: const Text("Add")
            ),
          ],
        );
      }
    );
  }

  void _editTodo(BuildContext context,int index){
    textController.text=todos[index];
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text("Edit Todo"),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: "Edit your Todo:"),
          ),
          actions: [
            TextButton(
                onPressed: (){
                  textController.clear();
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel")
            ),
            TextButton(
              onPressed: (){
                setState(() {
                  if(textController.text.isNotEmpty) {
                    todos[index]=textController.text;
                  }
                });
                textController.clear();
                Navigator.of(context).pop();
              },
              child: const Text("Edit")
            ),
          ],
        );
      }
    );
  }

}
