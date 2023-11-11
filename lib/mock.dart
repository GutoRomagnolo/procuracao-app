import 'package:procuracaoapp/model/comment_model.dart';
import 'package:procuracaoapp/model/post_model.dart';
import 'package:procuracaoapp/model/user_model.dart';

List<UserModel> usersMock = [
  UserModel('4d02c255-5dcf-400a-9bef-b5b95615a782-ua'),
  UserModel('4d02c255-5dcf-400a-9bef-b5b95615a782-ub'),
  UserModel('4d02c255-5dcf-400a-9bef-b5b95615a782-uc'),
];

List<PostModel> postsMock = [
  PostModel(
    '4d02c255-5dcf-400a-9bef-b5b95615a782-pa',
    usersMock[0],
    'Maiuri',
    'Fêmea, 3 anos, bastante assustada, porém mansa.',
    './assets/maiuri.jpg',
    [42.1234, 54.2342],
  ),
  PostModel(
    '4d02c255-5dcf-400a-9bef-b5b95615a782-pb',
    usersMock[2],
    'Frajole',
    'Fêmea, 1 anos, bastante assustada, porém mansa.',
    './assets/princesa.jpg',
    [42.1234, 54.2342],
  ),
];

List<CommentModel> commentsMock = [
  CommentModel(
    '4d02c255-5dcf-400a-9bef-b5b95615a782-ca',
    postsMock[0],
    'Vi ela próximo a área verde do CECAP, ela é filhote ainda?.',
    [42.1234, 54.2342],
    false,
  ),
  CommentModel(
    '4d02c255-5dcf-400a-9bef-b5b95615a782-ca',
    postsMock[0],
    'Estava próximo da rotatória, tentei pegar ela no colo, mas não deixou :(',
    [42.1234, 54.2342],
    false,
  ),
];
