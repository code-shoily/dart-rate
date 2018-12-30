import 'package:backend/backend.dart';

import "comment.dart";
import "link.dart";

class User extends ManagedObject<_User>
    implements _User, ManagedAuthResourceOwner<_User> {
  @Serialize(input: true, output: false)
  String password;
}

class _User extends ResourceOwnerTableDefinition {
  ManagedSet<Link> links;
  ManagedSet<Comment> comments;
}
