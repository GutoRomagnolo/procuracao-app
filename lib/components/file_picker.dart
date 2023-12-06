import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PickAFile extends StatefulWidget {
  final Function(Uint8List?)? onSaved;
  final Function(Uint8List?)? validator;

  const PickAFile({super.key, this.onSaved, this.validator});

  @override
  State<PickAFile> createState() => _PickAFileState();
}

class _PickAFileState extends State<PickAFile> {
  Uint8List? fileBytes;

  @override
  Widget build(BuildContext context) {
    return FormField(
      onSaved: (newValue) {
        if (widget.onSaved != null) {
          widget.onSaved!(fileBytes);
        }
      },
      validator: (value) {
        if (widget.validator != null) {
          return widget.validator!(fileBytes);
        }
        return null;
      },
      builder: (field) {
        return MaterialButton(
          color: Colors.blue,
          onPressed: pickAFile,
          child: fileBytes != null
              ? const Text(
                  'Imagem carregada',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const Text(
                  'Escolha uma foto do animal',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ), // fileBytes != null ? Image.memory(fileBytes!) :
        );
      },
    );
  }

  pickAFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      withData: true,
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'gif', 'png'],
    );

    if (result != null) {
      setState(() {
        fileBytes = result.files.first.bytes;
      });
    } else {
      setState(() {
        fileBytes = null;
      });
    }
  }
}
