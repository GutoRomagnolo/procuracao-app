class CommentModel {
  String _content = "";
  List<dynamic> _coordenates = [];
  bool _viewed = false;

  CommentModel() {
    _content = "";
    _coordenates = [];
    _viewed = false;
  }

  CommentModel.withData({content = "", coordenates, viewed}) {
    _content = content;
    _coordenates = coordenates;
    _viewed = viewed;
  }

  CommentModel.fromMap(map) {
    _content = map["content"];
    _coordenates = map["coordenates"];
    _viewed = map["viewed"];
  }

  String get content => _content;
  List<dynamic> get coordenates => _coordenates;
  bool get viewed => _viewed;

  set content(String newName) {
    if (newName.isNotEmpty) {
      _content = newName;
    }
  }

  set coordenates(List<dynamic> newCoordenates) {
    if (newCoordenates.isNotEmpty) {
      _coordenates = newCoordenates;
    }
  }

  set viewed(bool newViewed) {
    if (newViewed) {
      _viewed = newViewed;
    }
  }

  toMap() {
    var map = <String, dynamic>{};
    map["content"] = _content;
    map["coordenates"] = _coordenates;
    map["viewed"] = _viewed;
    return map;
  }
}
