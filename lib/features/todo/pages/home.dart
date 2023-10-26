import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/common/utils/constants.dart';
import 'package:todo/common/widgets/width.dart';
import 'package:todo/features/todo/bloc/todo_bloc.dart';
import 'package:todo/features/todo/pages/add_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

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
            return Container();
          } else if (state.status == TodoStatus.initial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        }),
        // child: SizedBox(
        //   height: 70,
        //   width: AppConstant.aWidth,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Column(
        //             children: [
        //               Title(
        //                   color: AppConstant.aBgDark,
        //                   child: const Text(
        //                     'Title',
        //                     style: TextStyle(fontWeight: FontWeight.bold),
        //                   )),
        //               Title(
        //                   color: AppConstant.aBgDark,
        //                   child: const Text(
        //                     'Description',
        //                     style: TextStyle(fontWeight: FontWeight.w900),
        //                   )),
        //               const Text(
        //                 "school",
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.normal,
        //                   color: Colors.black,
        //                 ),
        //               )
        //             ],
        //           ),
        //           IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodoPage()));
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
}
