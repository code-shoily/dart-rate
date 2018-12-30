import "package:aqueduct/aqueduct.dart";

import "badge.dart";
import "base.dart";
import "link.dart";
import "user.dart";

class Award extends ManagedBase<_Award> implements _Award {}

class _Award extends Base {
  @Relate(#awards)
  Badge badge;
  @Relate(#awards)
  User user;
  @Relate(#awards)
  Link link;
}
