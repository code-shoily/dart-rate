import "package:aqueduct/aqueduct.dart";

import "base.dart";
import "user.dart";

class Timezone extends ManagedBase<_Timezone> implements _Timezone {}

class _Timezone extends Base {
  String countryCode;
  String tzDatabaseName;
  String utcOffset;

  ManagedSet<User> users;
}

class Country extends ManagedBase<_Country> implements _Country {}

class _Country extends Base {
  String code;
  String name;

  ManagedSet<User> users;
}
