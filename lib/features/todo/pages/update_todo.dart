import 'package:flutter/material.dart';
import 'package:todo/common/utils/constants.dart';
import 'package:todo/common/widgets/height_spacer.dart';

import '../../../common/widgets/custom_textfield.dart';
import '../../../common/widgets/reusable_btn.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            CustomTextField(
              hintText: 'To do name',
              controller: title,
              keyboardType: TextInputType.text,
              textStyle: const TextStyle(
                  color: AppConstant.aBgDark, fontWeight: FontWeight.bold),
            ),
            const HeightSpacer(height: 20),
            CustomTextField(
              hintText: 'Description',
              controller: desc,
              keyboardType: TextInputType.text,
              textStyle: const TextStyle(
                  color: AppConstant.aBgDark, fontWeight: FontWeight.normal),
            ),
            const HeightSpacer(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomeOutlineBtn(
                  color: AppConstant.aBgBrown,
                  height: 50,
                  text: 'Update',
                  width: 70,
                  onTap: () {},
                ),
                CustomeOutlineBtn(
                  color: AppConstant.aBgBrown,
                  height: 50,
                  text: 'Cancel',
                  width: 70,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
