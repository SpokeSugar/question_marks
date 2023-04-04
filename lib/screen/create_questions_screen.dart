import 'package:flutter/material.dart';
import 'package:question_marks/component/back_home_button.dart';

class CreateQuesionsScreen extends StatelessWidget {
  const CreateQuesionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: BackHomeButton(),
            title: Text("Create Questions"),
          ),
          SliverFillRemaining(
            child: Placeholder(),
          )
        ],
      ),
    );
  }
}
