import "package:aqueduct/aqueduct.dart";

import "link.dart";
import "tag.dart";

class LinkTag extends ManagedObject<_LinkTag> implements _LinkTag {}

class _LinkTag {
  @primaryKey
  int id;

  @Relate(#linkTags, onDelete: DeleteRule.cascade)
  Tag tag;

  @Relate(#linkTags, onDelete: DeleteRule.cascade)
  Link link;
}
