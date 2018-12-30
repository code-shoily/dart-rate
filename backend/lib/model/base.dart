import "package:aqueduct/aqueduct.dart";

import "user.dart";

class ManagedBase<T extends Base> extends ManagedObject<T> implements Base {
  @override
  void willUpdate() {
    updatedAt = DateTime.now().toUtc();
  }

  @override
  void willInsert() {
    createdAt = DateTime.now().toUtc();
    updatedAt = DateTime.now().toUtc();
  }
}

class Base {
  @primaryKey
  int id;

  @Column(indexed: true)
  DateTime createdAt;

  @Column(indexed: true)
  DateTime updatedAt;
}

class Rateable extends Base {
  String title;

  @Column(nullable: true)
  String description;
}
