// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:crudsqlite/core/bloc/notes/note_cubit.dart';
import 'package:crudsqlite/core/bloc/notes/notes_states.dart';
import 'package:crudsqlite/core/models/item_model.dart';
import 'package:crudsqlite/ui/screens/addNotes/add_notes.dart';
import 'package:crudsqlite/ui/widgets/app_size_boxes.dart';
import 'package:crudsqlite/ui/widgets/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsBackground extends StatelessWidget {
   DetailsBackground({required this.child, this.items});
  final Widget child;
  final Items? items;
  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesLoaded) {
          Navigator.of(context).pop();
        }
      },
      child: Stack(
        children: [
          _buildBackgorund(),
          _buildLeftButton(context),
          _buildRightButton(context),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBackgorund() {
    return SafeArea(
      child: Image.file(
        File(items!.image!),
        fit: BoxFit.contain,
        height: 350.h,
        width: double.infinity,
      ),
    );
  }

  Widget _buildLeftButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: SafeArea(
          child: Align(
        alignment: AlignmentDirectional.topStart,
        child: Container(
          height: 60.h,
          width: 60.w,
          // ignore: prefer_const_constructors
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.arrow_back),
          ),
        ),
      )),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: 305.h),
      child: Container(
        width: 1.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(70.r)),
        ),
        child: child,
      ),
    );
  }

  _buildRightButton(BuildContext context) {
    return Row(
      children: [
        290.widthBox,
        // ignore: sized_box_for_whitespace
        GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) =>
                      AddNotes(isEdit: true, note: items!)));
            },
            child: const Icon(Icons.edit)),

        GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('This action cannot be undone.'),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('CANCEL'),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          NotesCubit.get(context).delete(items!.id!);
                        },
                        child: const Text('DELETE'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.delete)),
      ],
    );
  }
}
