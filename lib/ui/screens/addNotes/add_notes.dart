// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:crudsqlite/core/bloc/notes/note_cubit.dart';
import 'package:crudsqlite/core/bloc/notes/notes_states.dart';
import 'package:crudsqlite/core/models/item_model.dart';
import 'package:crudsqlite/core/repository/image_picker.dart';
import 'package:crudsqlite/ui/helper/app_validator.dart';
import 'package:crudsqlite/ui/resources/index.dart';
import 'package:crudsqlite/ui/widgets/app_size_boxes.dart';
import 'package:crudsqlite/ui/widgets/app_text_display.dart';
import 'package:crudsqlite/ui/widgets/form_fields/app_input_text_field.dart';
import 'package:crudsqlite/ui/widgets/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotes extends StatefulWidget {
  final bool? isEdit;
  final Items? note;

  const AddNotes({Key? key, this.isEdit = false, this.note}) : super(key: key);

  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? _currentSelectedValue;
  bool isLoading = false;
  String? imagePath;
  final List<String> _currencies = ["open", "Closed"];
  @override
  void initState() {
    if (widget.isEdit!) {
      _titleController.text = widget.note!.title!;
      _descriptionController.text = widget.note!.description!;
      imagePath = widget.note!.image!;
      _currentSelectedValue = widget.note!.status!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesLoaded) {
          Navigator.of(context).pop();
        }   
      
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: AppText(
                text: widget.isEdit! ? AppStrings.edit : AppStrings.add),
          ),
          body: _buildBody(),
        );
      },
    );
  }

  _buildBody() {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageNote(),
            20.heightBox,
            _buildTitleNote(),
            10.heightBox,
            _buildDescription(),
            10.heightBox,
            _buildStatus(),
            10.heightBox,
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  _buildImageNote() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null) _previewImages(imagePath!),
          const Spacer(),
          RaisedButton(
            onPressed: () {
              ImagePick.uploadFile().then((value) {
                if (value != null) {
                  setState(() {
                    imagePath = value.path;
                  });
                }
              });
            },
            child: const AppText(
              text: AppStrings.selectImage,
            ),
          ),
        ],
      ),
    );
  }

  _buildTitleNote() {
    return AppTextInputField(
      controller: _titleController,
      hintText: AppStrings.title,
      validator: (value) => AppValidator.validatorRequired(value!, context),
    );
  }

  _buildDescription() {
    return AppTextInputField(
      maxLines: 5,
      controller: _descriptionController,
      hintText: AppStrings.description,
      validator: (value) => AppValidator.validatorRequired(value!, context),
    );
  }

  _buildStatus() {
    return FormField<String>(
      validator: (value) => AppValidator.validatorRequired(value!, context),
      initialValue: _currentSelectedValue,
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
              // errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.sp),
              labelText: 'Please select status',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppPalette.borderColor,
                ),
                borderRadius: AppCorners.xlgBorder,
              )),

          // isEmpty: _currentSelectedValue == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _currentSelectedValue,
              isDense: true,
              onChanged: (String? newValue) {
                setState(() {
                  _currentSelectedValue = newValue;
                });
              },
              items: _currencies.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  _buildSaveButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      onPressed: () {
        if (formKey.currentState!.validate() && imagePath != null) {
          widget.isEdit!
              ? NotesCubit.get(context).update(
                  Items(
                      id: widget.note!.id,
                      title: _titleController.text,
                      description: _descriptionController.text,
                      image: imagePath,
                      status: _currentSelectedValue,
                      createdAt: widget.note!.createdAt),
                )
              : NotesCubit.get(context).insert(
                  Items(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      image: imagePath,
                      status: _currentSelectedValue,
                      createdAt: DateTime.now()),
                );
        }
      },
      child: AppText(
        text: widget.isEdit! ? AppStrings.update : AppStrings.save,
      ),
    );
  }

  Widget _previewImages(String path) {
    return Container(
      width: 140.w,
      // height: 100.h,
      child: Image.file(File(path)),
    );
  }
}
