import 'package:procuracaoapp/model/comment_model.dart';
import 'package:procuracaoapp/model/post_model.dart';
import 'package:procuracaoapp/model/user_model.dart';

List<UserModel> usersMock = [
  UserModel(uid: '4d02c255-5dcf-400a-9bef-b5b95615a782-ua'),
  UserModel(uid: '4d02c255-5dcf-400a-9bef-b5b95615a782-ub'),
  UserModel(uid: '4d02c255-5dcf-400a-9bef-b5b95615a782-uc'),
];

List<PostModel> postsMock = [
  PostModel.withData(
    name: 'Maiuri',
    description: 'Fêmea, 3 anos, bastante assustada, porém mansa.',
    path: './assets/maiuri.jpg',
    coordenates: [42.1234, 54.2342],
  ),
  PostModel.withData(
    name: 'Frajole',
    description: 'Fêmea, 1 anos, bastante assustada, porém mansa.',
    path: './assets/princesa.jpg',
    coordenates: [42.1234, 54.2342],
  ),
];

List<CommentModel> commentsMock = [
  CommentModel.withData(
    content: 'Vi ela próximo a área verde do CECAP, ela é filhote ainda?.',
    coordenates: [42.1234, 54.2342],
    viewed: false,
  ),
  CommentModel.withData(
    content:
        'Estava próximo da rotatória, tentei pegar ela no colo, mas não deixou :(',
    coordenates: [42.1234, 54.2342],
    viewed: false,
  ),
];
