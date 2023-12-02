import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/bloc/post_bloc.dart';
import 'package:procuracaoapp/components/menu_component.dart';
import 'package:procuracaoapp/mock.dart';
import 'package:procuracaoapp/model/post_model.dart';
import 'package:procuracaoapp/model/share_location_model.dart';

class ViewNewPost extends StatefulWidget {
  const ViewNewPost({super.key});

  @override
  State<ViewNewPost> createState() => _ViewNewPostState();
}

class _ViewNewPostState extends State<ViewNewPost> {
  final ShareLocationModel shareLocationModel = ShareLocationModel();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  MaterialButton(
                    color: Colors.blue,
                    child: const Text(
                      'Escolha uma foto do animal',
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Switch(
                    value: shareLocationModel.shareLocation,
                    onChanged: (bool? inValue) {
                      if (inValue != null) {
                        setState(() {
                          shareLocationModel.shareLocation = inValue;
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
                    BlocProvider.of<PostBloc>(context).add(
                      CreatePost(
                        post: PostModel(
                          '4d02c255-5dcf-400a-9bef-b5b95615a782-pa',
                          usersMock[0],
                          'Maiuri',
                          'Fêmea, 3 anos, bastante assustada, porém mansa.',
                          './assets/maiuri.jpg',
                          [42.1234, 54.2342],
                        ),
                      ),
                    );
                    Navigator.pop(context);
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
