import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/bloc/post_bloc.dart';
import 'package:procuracaoapp/components/file_picker.dart';
import 'package:procuracaoapp/model/post_model.dart';
import 'package:procuracaoapp/model/share_location_model.dart';

class ViewNewPost extends StatefulWidget {
  const ViewNewPost({super.key});

  @override
  State<ViewNewPost> createState() => _ViewNewPostState();
}

class _ViewNewPostState extends State<ViewNewPost> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = "";
  String description = "";
  Uint8List? fileBytes;
  ShareLocationModel coordenates = ShareLocationModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Criar nova postagem',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(0, 0, 0, 1),
        ),
        backgroundColor: Colors.white, // Cor do appbar
      ),
      body: Container(
        color: const Color.fromRGBO(240, 241, 223, 1),
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (String? inValue) {
                  if (inValue != null) {
                    if (inValue.isEmpty) {
                      return 'Insira o nome do animal';
                    }
                  }
                  return null;
                },
                onChanged: (String? inValue) {
                  name = inValue ?? '';
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(97, 164, 80, 1),
                    ),
                  ),
                  labelText: 'Nome do animal',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: (String? inValue) {
                  if (inValue != null) {
                    if (inValue.isEmpty) {
                      return 'Descreva o que aconteceu com o animal';
                    }
                  }
                  return null;
                },
                onChanged: (String? inValue) {
                  description = inValue ?? '';
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(97, 164, 80, 1),
                    ),
                  ),
                  labelText: 'Descreva brevemente a situação',
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  PickAFile(
                    validator: (Uint8List? fileBytes) {
                      if (fileBytes == null) {
                        return "Escolha uma foto do animal";
                      }
                      return null;
                    },
                    onSaved: (Uint8List? inValue) {
                      fileBytes = inValue;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Switch(
                    value: coordenates.shareLocation,
                    onChanged: (bool? inValue) {
                      if (inValue != null) {
                        setState(() {
                          coordenates.shareLocation = inValue;
                        });
                      }
                    },
                  ),
                  const Text('Compartilhar localização'),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     backgroundColor: Colors.green,
                    //     duration: Duration(seconds: 5),
                    //     content: Text('Postagem cadastrada com sucesso!'),
                    //   ),
                    // );
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      BlocProvider.of<PostBloc>(context).add(
                        CreatePost(
                          post: PostModel.withData(
                            name: name,
                            description: description,
                            path: '',
                            coordenates: [0.00, 0.00],
                            fileBytes: fileBytes,
                          ),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                  child: const Text(
                    'SALVAR',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
