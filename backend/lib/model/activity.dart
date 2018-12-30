import "package:aqueduct/aqueduct.dart";

import "badge.dart";
import "base.dart";
import "link.dart";
import "rating.dart";
import "user.dart";

class Activity extends ManagedBase<_Activity> implements _Activity {}

class _Activity extends Base {
  @Relate(#activities, isRequired: true, onDelete: DeleteRule.cascade)
  User user;
  String verb;
  @Relate(#activities, isRequired: true, onDelete: DeleteRule.cascade)
  Link link;
  @Relate(#activities)
  Rating associatedRating;
  @Relate(#activities)
  Badge associatedBadge;

  int points;

  @Column(nullable: true)
  Document extra;
}
