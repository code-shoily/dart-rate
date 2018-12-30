import "package:aqueduct/aqueduct.dart";

import "base.dart";
import "link.dart";
import "user.dart";

class Follow extends ManagedBase<_Follow> implements _Follow {}

class _Follow extends Base {
  @Relate(#follows)
  User follower;

  @Relate(#followers)
  User followedUser;

  @Relate(#followers)
  Link followedLink;
}
