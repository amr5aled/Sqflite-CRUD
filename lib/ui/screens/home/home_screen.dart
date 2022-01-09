// ignore_for_file: deprecated_member_use, sized_box_for_whitespace
import 'package:crudsqlite/core/bloc/notes/note_cubit.dart';
import 'package:crudsqlite/core/bloc/notes/notes_states.dart';
import 'package:crudsqlite/core/models/item_model.dart';
import 'package:crudsqlite/core/repository/sql_helper.dart';
import 'package:crudsqlite/ui/helper/navigator.dart';
import 'package:crudsqlite/ui/resources/index.dart';
import 'package:crudsqlite/ui/screens/addNotes/add_notes.dart';
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
  void initState() {
    NotesCubit.get(context).getNotes();
    super.initState();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesCubit>(
      create: (_) => NotesCubit()..getNotes(),
      child: Scaffold(
          appBar: AppBar(
            title: const AppText(
              text: AppStrings.home,
            ),
          ),
          body: _buildBody(),
          floatingActionButton: _buildFloatingActionButton()),
    );
  }

  _buildFloatingActionButton() {
    return FloatingActionButton(
      elevation: 10.h,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const AddNotes()),
        );
      },
      child: const Icon(Icons.add),
    );
  }

  _buildBody() {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      final items = NotesCubit.get(context).items;

      return items.isNotEmpty && state is NotesLoaded
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0.w,
                  mainAxisSpacing: 10.0.h,
                  childAspectRatio: .8,
                  children: List.generate(items.length, (index) {
                    return _buildNotes(items[index]);
                  })),
            )
          : const Center(
              child: Text("No Notes"),
            );
    });
  }

  _buildNotes(Items note) {
    return AppCard(
      child: Column(
        children: [
          20.heightBox,
          Expanded(
            child: AppText(
              text: note.title!,
              style:
                  AppTextStyles.title2.copyWith(fontWeight: FontWeight.normal),
            ),
          ),
          Expanded(
            flex: 2,
            child: AppText(
              text: note.description!,
              style:
                  AppTextStyles.title2.copyWith(fontWeight: FontWeight.normal),
            ),
          ),
          12.heightBox,
          Expanded(
            child: AppText(
              text: note.status!,
              style: AppTextStyles.meduim_14
                  .copyWith(color: AppPalette.errorColor),
            ),
          ),
          4.heightBox,
          _buildDetailsNote(note),
        ],
      ),
    );
  }

  _buildDetailsNote(Items note) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: () {
          pushName(context, AppRoute.details, arguments: note);
        },
        child: const AppText(
          text: AppStrings.viewMore,
        ),
      ),
    );
  }
}
