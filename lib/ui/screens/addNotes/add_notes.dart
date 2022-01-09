// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:crudsqlite/core/bloc/notes/note_cubit.dart';
import 'package:crudsqlite/core/bloc/notes/notes_states.dart';
import 'package:crudsqlite/core/models/item_model.dart';
import 'package:crudsqlite/core/repository/image_picker.dart';
import 'package:crudsqlite/core/repository/sql_helper.dart';
import 'package:crudsqlite/ui/helper/app_validator.dart';
import 'package:crudsqlite/ui/helper/navigator.dart';
import 'package:crudsqlite/ui/resources/index.dart';
import 'package:crudsqlite/ui/widgets/app_size_boxes.dart';
import 'package:crudsqlite/ui/widgets/app_text_display.dart';
import 'package:crudsqlite/ui/widgets/form_fields/app_input_text_field.dart';
import 'package:crudsqlite/ui/widgets/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

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
  final TextEditingController _dateController = TextEditingController();
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
      _dateController.text = widget.note!.createdAt!;
    }

    super.initState();
  }

  @override
  void dispose() {
    NotesDatabase.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesState>(
      listener: (context, state) {
        if (state is NotesGetLoaded) {
          pushName(context, AppRoute.home);
        }
        if (state is NotesEditLoaded) {
          pushName(context, AppRoute.home);
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
            16.heightBox,
            _buildDescription(),
            16.heightBox,
            _buildDate(),
            16.heightBox,
            _buildStatus(),
            20.heightBox,
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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: _currentSelectedValue ?? '',
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
          isEmpty: _currentSelectedValue == '',
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
                      createdAt: _dateController.text),
                )
              : NotesCubit.get(context).insert(
                  Items(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      image: imagePath,
                      status: _currentSelectedValue,
                      createdAt: _dateController.text),
                );
        }
      },
      child: AppText(
        text: widget.isEdit! ? AppStrings.update : AppStrings.save,
      ),
    );
  }

  _buildDate() {
    return AppFormField(
        hintText: 'Date',
        controller: _dateController,
        onTap: () {
          DatePicker.showDateTimePicker(
            context,
            showTitleActions: true,
            onChanged: (dynamic date) {
              _dateController.text =
                  DateFormat("yyyy-MM-dd").add_jms().format(date);
            },
            onConfirm: (date) {
              _dateController.text =
                  DateFormat("yyyy-MM-dd").add_jms().format(date);
            },
            currentTime: DateTime.now(),
          );
        },
        validator: (dynamic value) =>
            AppValidator.validatorRequired(value, context));
  }

  Widget _previewImages(String path) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 140.w,
      // height: 100.h,
      child: Image.file(File(path)),
    );
  }
}
