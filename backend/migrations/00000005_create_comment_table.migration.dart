import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration5 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_Comment", [
      SchemaColumn("title", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("body", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
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
        "_Comment",
        SchemaColumn.relationship("link", ManagedPropertyType.bigInteger,
            relatedTableName: "_Link",
            relatedColumnName: "id",
            rule: DeleteRule.cascade,
            isNullable: false,
            isUnique: false));
    database.addColumn(
        "_Comment",
        SchemaColumn.relationship("commenter", ManagedPropertyType.bigInteger,
            relatedTableName: "_User",
            relatedColumnName: "id",
            rule: DeleteRule.cascade,
            isNullable: false,
            isUnique: false));
    database.addColumn(
        "_Comment",
        SchemaColumn.relationship("replyOf", ManagedPropertyType.bigInteger,
            relatedTableName: "_Comment",
            relatedColumnName: "id",
            rule: DeleteRule.nullify,
            isNullable: true,
            isUnique: false));
    database.addColumn(
        "_Rating",
        SchemaColumn.relationship("comment", ManagedPropertyType.bigInteger,
            relatedTableName: "_Comment",
            relatedColumnName: "id",
            rule: DeleteRule.cascade,
            isNullable: true,
            isUnique: false));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {}
}
