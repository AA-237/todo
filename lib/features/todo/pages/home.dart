import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/common/utils/constants.dart';
import 'package:todo/common/widgets/width.dart';
import 'package:todo/features/todo/bloc/todo_bloc.dart';
import 'package:todo/features/todo/pages/add_todo.dart';

import '../../../common/models/todo_model.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../common/widgets/height_spacer.dart';
import '../../../common/widgets/reusable_btn.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  addTodo(TodoModel todo) {
    context.read<TodoBloc>().add(AddTodo(todo));
  }

  deletTodo(TodoModel todo) {
    context.read<TodoBloc>().add(AddTodo(todo));
  }

  updateTodo(TodoModel todo) {
    context.read<TodoBloc>().add(UpdateTodo(todo));
  }

  final List<Widget> _screens = [
    // TODO: Add a screens to be displayed
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'To-Do List',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const WidthSpacer(wid: 60),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month),
            ),
          ],
        ),
        backgroundColor: AppConstant.aBgBrown,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          if (state.status == TodoStatus.success) {
            return ListView.builder(
                itemCount: state.todos.length,
                
                itemBuilder: (context, int i) {
                  print(state.todos);
                  return Card(
                    color: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(state.todos[i].title),
                      subtitle: Text(state.todos[i].desc),
                      
                    ),
                  );
                });
          } else if (state.status == TodoStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const AddTodoPage()));
          customDailog(context);
        },
        backgroundColor: AppConstant.aBgBrown,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.book_online_rounded), label: ''),
              BottomNavigationBarItem(
                  icon: Icon(Icons.book_online_rounded), label: '')
            ],
            currentIndex: _selectedIndex,
            elevation: 10,
            backgroundColor: AppConstant.aLight,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  Future<dynamic> customDailog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          final TextEditingController title = TextEditingController();
          final TextEditingController desc = TextEditingController();
          final TextEditingController isCompleted = TextEditingController();
          final TextEditingController end = TextEditingController();
          final TextEditingController start = TextEditingController();
          return AlertDialog(
            title: const Text("Add Todo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  icon: const Icon(Icons.abc),
                  hintText: 'To do name',
                  controller: title,
                  keyboardType: TextInputType.text,
                  textStyle: const TextStyle(
                      color: AppConstant.aBgDark, fontWeight: FontWeight.bold),
                ),
                const HeightSpacer(height: 20),
                CustomTextField(
                  icon: const Icon(Icons.abc),
                  hintText: 'Description',
                  controller: desc,
                  keyboardType: TextInputType.text,
                  textStyle: const TextStyle(
                      color: AppConstant.aBgDark,
                      fontWeight: FontWeight.normal),
                ),
                const HeightSpacer(height: 20),
                CustomTextField(
                  icon: const Icon(Icons.abc),
                  hintText: 'Tags',
                  controller: desc,
                  keyboardType: TextInputType.text,
                  textStyle: const TextStyle(
                      color: AppConstant.aBgDark,
                      fontWeight: FontWeight.normal),
                ),
                const HeightSpacer(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomeOutlineBtn(
                      color: AppConstant.aBgBrown,
                      height: 50,
                      text: 'Cancel',
                      width: 70,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    CustomeOutlineBtn(
                      color: AppConstant.aBgBrown,
                      height: 50,
                      text: 'Save',
                      width: 70,
                      onTap: () {
                        addTodo(TodoModel(
                          title: title.text,
                          desc: desc.text,
                          id: 1,
                          isCompleted: false,
                          startDate: start.text,
                          endDate: end.text,
                        ));
                        // title.text = '';
                        // desc.text = '';
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
