import "package:aqueduct/aqueduct.dart";

import "award.dart";
import "base.dart";

class Badge extends ManagedBase<_Badge> implements _Badge {}

class _Badge extends Base {
  String name;
  String icon;
  int value;

  ManagedSet<Award> awards;
}
