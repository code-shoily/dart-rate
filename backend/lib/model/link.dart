import "package:aqueduct/aqueduct.dart";

import "base.dart";
import "comment.dart";
import "link_tag.dart";
import "rating.dart";
import "user.dart";

class Link extends ManagedBase<_Link> implements _Link {}

class _Link extends Base {
  String title;

  @Column(nullable: true)
  String description;

  @Relate(#links, isRequired: true, onDelete: DeleteRule.cascade)
  User owner;

  String link;

  ManagedSet<LinkTag> linkTags;
  ManagedSet<Rating> ratings;
  ManagedSet<Comment> comments;
}
