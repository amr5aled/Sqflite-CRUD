// ignore_for_file: deprecated_member_use
import 'package:crudsqlite/core/bloc/notes/note_cubit.dart';
import 'package:crudsqlite/core/bloc/notes/notes_states.dart';
import 'package:crudsqlite/core/models/item_model.dart';
import 'package:crudsqlite/ui/helper/navigator.dart';
import 'package:crudsqlite/ui/resources/index.dart';
import 'package:crudsqlite/ui/widgets/app_card.dart';
import 'package:crudsqlite/ui/widgets/app_size_boxes.dart';
import 'package:crudsqlite/ui/widgets/app_text_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          text: AppStrings.home,
        ),
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        elevation: 10.h,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      final items = NotesCubit.get(context).items;
      return items.isNotEmpty
          ? GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0.w,
              mainAxisSpacing: 8.0.h,
              children: List.generate(items.length, (index) {
                return _buildNotes(items[index]);
              }))
          : const Center(
              child: Text("No Notes"),
            );
    });
  }

  _buildNotes(Items note) {
    return AppCard(
      child: Column(
        children: [
          AppText(
            text: note.title!,
          ),
          4.heightBox,
          AppText(
            text: note.description!,
          ),
          4.heightBox,
          AppText(
            text: note.status!,
          ),
          4.heightBox,
          _buildDetailsNote(note),
        ],
      ),
    );
  }

  _buildDetailsNote(Items note) {
    return RaisedButton(
      onPressed: () {
        pushName(context, AppRoute.details);
      },
      child: const AppText(
        text: AppStrings.viewMore,
      ),
    );
  }
}
