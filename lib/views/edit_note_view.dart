import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/note/cubit/note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_snake_bar.dart';
import 'package:note_app/widgets/custom_text_field.dart';
import 'package:note_app/widgets/search_icon_button.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Edit Mood'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
                lable: 'Note tilte',
                onChanged: (value) {
                  title = value;
                },
                text: widget.note.title),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              lable: 'Note description',
              onChanged: (value) {
                content = value;
              },
              text: widget.note.subTitle,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomIconButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                    customSnakeBar(
                      context,
                      text: 'Edit cancled',
                      color: Colors.red,
                    );
                  },
                  icon: Icons.cancel_outlined,
                ),
                CustomIconButton(
                  color: Colors.green,
                  onPressed: () {
                    widget.note.title = title ?? widget.note.title;
                    widget.note.subTitle = content ?? widget.note.subTitle;
                    widget.note.save();
                    BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                    customSnakeBar(
                      context,
                      text: 'Updated successfully',
                      color: Colors.green,
                    );
                  },
                  icon: Icons.check_rounded,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
