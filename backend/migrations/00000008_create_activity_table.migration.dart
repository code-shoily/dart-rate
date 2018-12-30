import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration8 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_Activity", [
      SchemaColumn("verb", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("points", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("extra", ManagedPropertyType.document,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: false),
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("createdAt", ManagedPropertyType.datetime,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: true,
          isNullable: false,
          isUnique: false),
      SchemaColumn("updatedAt", ManagedPropertyType.datetime,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: true,
          isNullable: false,
          isUnique: false)
    ]));
    database.addColumn(
        "_Activity",
        SchemaColumn.relationship("user", ManagedPropertyType.bigInteger,
            relatedTableName: "_User",
            relatedColumnName: "id",
            rule: DeleteRule.cascade,
            isNullable: false,
            isUnique: false));
    database.addColumn(
        "_Activity",
        SchemaColumn.relationship("link", ManagedPropertyType.bigInteger,
            relatedTableName: "_Link",
            relatedColumnName: "id",
            rule: DeleteRule.cascade,
            isNullable: false,
            isUnique: false));
    database.addColumn(
        "_Activity",
        SchemaColumn.relationship(
            "associatedRating", ManagedPropertyType.bigInteger,
            relatedTableName: "_Rating",
            relatedColumnName: "id",
            rule: DeleteRule.nullify,
            isNullable: true,
            isUnique: false));
    database.addColumn(
        "_Activity",
        SchemaColumn.relationship(
            "associatedBadge", ManagedPropertyType.bigInteger,
            relatedTableName: "_Badge",
            relatedColumnName: "id",
            rule: DeleteRule.nullify,
            isNullable: true,
            isUnique: false));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {}
}
