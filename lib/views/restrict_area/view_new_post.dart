import 'package:flutter/material.dart';
import 'package:procuracaoapp/components/menu_component.dart';
import 'package:procuracaoapp/model/share_location_model.dart';

class ViewNewPost extends StatefulWidget {
  const ViewNewPost({super.key});

  @override
  State<ViewNewPost> createState() => _ViewNewPostState();
}

class _ViewNewPostState extends State<ViewNewPost> {
  final ShareLocationModel shareLocationModel = ShareLocationModel();

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
          child: Column(
            children: [
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
                  onPressed: () => {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 5),
                        content: Text('Postagem cadastrada com sucesso!'),
                      ),
                    ),
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
