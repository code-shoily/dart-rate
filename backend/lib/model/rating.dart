import "package:aqueduct/aqueduct.dart";

import "base.dart";
import "comment.dart";
import "link.dart";

class Rating extends ManagedBase<_Rating> implements _Rating {}

enum Reactions { awesome, love, funny, dontCare, sad, angry, disgusted }

class _Rating extends Base {
  int weight;
  Reactions reaction;

  @Relate(#ratings, onDelete: DeleteRule.cascade)
  Link link;

  @Relate(#ratings, onDelete: DeleteRule.cascade)
  Comment comment;
}
