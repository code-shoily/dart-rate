import "package:aqueduct/aqueduct.dart";

import "base.dart";
import "link.dart";
import "rating.dart";
import "user.dart";

class Comment extends ManagedBase<_Comment> implements _Comment {}

class _Comment extends Base {
  @Relate(#comments, isRequired: true, onDelete: DeleteRule.cascade)
  Link link;

  @Relate(#comments, isRequired: true, onDelete: DeleteRule.cascade)
  User commenter;

  String title;
  String body;
  @Relate(#replies)
  Comment replyOf;

  ManagedSet<Comment> replies;
  ManagedSet<Rating> ratings;
}
