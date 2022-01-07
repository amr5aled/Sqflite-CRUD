import 'package:crudsqlite/ui/resources/index.dart';
import 'package:crudsqlite/ui/widgets/app_size_boxes.dart';
import 'package:crudsqlite/ui/widgets/app_text_display.dart';
import 'package:crudsqlite/ui/widgets/form_fields/app_input_text_field.dart';
import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  final bool? isEdit;

  const AddNotes({Key? key, this.isEdit = false}) : super(key: key);

  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _DateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(text: widget.isEdit! ? AppStrings.edit : AppStrings.add),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildImageNote(),
          10.heightBox,
          _buildTitleNote(),
          _buildDescription(),
          _buildDateTime(),
          _buildTime(),
          _buildStatus(),
          _buildSaveButton(),
        ],
      ),
    );
  }

  _buildImageNote() {}

  _buildTitleNote() {
    return AppTextInputField(
      controller: _titleController,
      hintText: AppStrings.title,
    );
  }

  _buildDescription() {
    return AppTextInputField(
       controller: _descriptionController,
      hintText: AppStrings.description,
    );
  }

  _buildDateTime() {
    return AppTextInputField(
      hintText: AppStrings.date,
    );
  }

  _buildTime() {
    return AppTextInputField(
      hintText: AppStrings.time,
    );
  }

  _buildStatus() {
    return AppTextInputField(
      hintText: AppStrings.status,
    );
  }

  _buildSaveButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      onPressed: () {},
      child: AppText(
        text: widget.isEdit! ? AppStrings.update : AppStrings.save,
      ),
    );
  }
}
