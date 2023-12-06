import 'dart:typed_data';

class PostModel {
  String _name = "";
  String _description = "";
  String _path = "";
  List<double> _coordenates = [];
  Uint8List? _fileBytes;

  PostModel() {
    _name = "";
    _description = "";
    _path = "";
    _coordenates = [];
  }

  PostModel.withData(
      {name = "", description = "", path = "", coordenates, fileBytes}) {
    _name = name;
    _description = description;
    _path = path;
    _coordenates = coordenates;
    _fileBytes = fileBytes;
  }

  PostModel.fromMap(map) {
    _name = map["name"];
    _description = map["description"];
    _path = map["path"];
    _coordenates = map["coordenates"];
  }

  String get name => _name;
  String get description => _description;
  String get path => _path;
  List<double> get coordenates => _coordenates;
  Uint8List? get fileBytes => _fileBytes;

  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    }
  }

  set description(String newDescription) {
    if (newDescription.isNotEmpty) {
      _description = newDescription;
    }
  }

  set path(String newPath) {
    if (newPath.isNotEmpty) {
      _path = newPath;
    }
  }

  set coordenates(List<double> newCoordenates) {
    if (newCoordenates.isNotEmpty) {
      _coordenates = newCoordenates;
    }
  }

  set fileBytes(Uint8List? newFileBytes) {
    if (newFileBytes != null) {
      _fileBytes = newFileBytes;
    }
  }

  toMap() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["description"] = _description;
    map["path"] = _path;
    map["coordenates"] = _coordenates;
    return map;
  }
}
