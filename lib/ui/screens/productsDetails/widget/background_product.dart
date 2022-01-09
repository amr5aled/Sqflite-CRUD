// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:crudsqlite/core/bloc/notes/note_cubit.dart';
import 'package:crudsqlite/core/bloc/notes/notes_states.dart';
import 'package:crudsqlite/core/models/item_model.dart';
import 'package:crudsqlite/ui/helper/navigator.dart';
import 'package:crudsqlite/ui/resources/app_palette.dart';
import 'package:crudsqlite/ui/resources/app_routes.dart';
import 'package:crudsqlite/ui/screens/addNotes/add_notes.dart';
import 'package:crudsqlite/ui/widgets/app_size_boxes.dart';
import 'package:crudsqlite/ui/widgets/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsBackground extends StatefulWidget {
  DetailsBackground({required this.child, this.items});
  final Widget child;
  final Items? items;

  @override
  State<DetailsBackground> createState() => _DetailsBackgroundState();
}

class _DetailsBackgroundState extends State<DetailsBackground> {
  // @override
  // void dispose() {
  //   NotesDatabase.instance.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesDeleteLoaded) {
          pushName(context, AppRoute.home);
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: SafeArea(
        child: Image.file(
          File(widget.items!.image!),
          fit: BoxFit.contain,
          height: 350.h,
          width: 220.w,
        ),
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
          height: 80.h,
          width: 50.w,
          // ignore: prefer_const_constructors
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back,
              size: 30.sp,
            ),
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
        child: widget.child,
      ),
    );
  }

  _buildRightButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 30.h),
      child: SafeArea(
        child: Row(
          children: [
            280.widthBox,
            // ignore: sized_box_for_whitespace
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) =>
                          AddNotes(isEdit: true, note: widget.items!)));
                },
                child: const Icon(Icons.edit)),
            10.widthBox,

            InkWell(
                onTap: () {
                  NotesCubit.get(context).delete(widget.items!.id!);
                },
                child: Icon(
                  Icons.delete,
                  color: AppPalette.errorColor,
                )),
          ],
        ),
      ),
    );
  }
}
