import 'package:digitaldesignstudy_ui/data/services/database.dart';
import 'package:digitaldesignstudy_ui/domain/db_model.dart';
import 'package:digitaldesignstudy_ui/domain/model/post.dart';
import 'package:digitaldesignstudy_ui/domain/model/post_content.dart';
import 'package:digitaldesignstudy_ui/domain/model/post_model.dart';
import 'package:digitaldesignstudy_ui/domain/model/user.dart';

class DataService {
  Future cuUser(User user) async {
    await DB.instance.createUpdate(user);
  }

  Future rangeUpdateEntities<T extends DbModel>(Iterable<T> elems) async {
    await DB.instance.createUpdateRange(elems);
  }

  Future<List<PostModel>> getPosts() async {
    var res = <PostModel>[];
    var posts = await DB.instance.getAll<Post>();
    for (var post in posts) {
      var author = await DB.instance.get<User>(post.userId);
      var contents =
          (await DB.instance.getAll<PostContent>(whereMap: {"postId": post.id}))
              .toList();
      if (author != null) {
        res.add(PostModel(
            id: post.id,
            author: author,
            contens: contents,
            createdDate: post.createdDate,
            description: post.description));
      }
    }

    return res;
  }
}
