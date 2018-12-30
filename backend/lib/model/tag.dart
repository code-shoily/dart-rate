import "package:aqueduct/aqueduct.dart";

import "link_tag.dart";

class Tag extends ManagedObject<_Tag> implements _Tag {}

class _Tag {
  @primaryKey
  int id;

  String name;

  ManagedSet<LinkTag> linkTags;
}
