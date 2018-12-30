import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration3 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("_Tag", [
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("name", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
    database.createTable(SchemaTable("_LinkTag", [
      SchemaColumn("id", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
    database.addColumn(
        "_LinkTag",
        SchemaColumn.relationship("tag", ManagedPropertyType.bigInteger,
            relatedTableName: "_Tag",
            relatedColumnName: "id",
            rule: DeleteRule.cascade,
            isNullable: true,
            isUnique: false));
    database.addColumn(
        "_LinkTag",
        SchemaColumn.relationship("link", ManagedPropertyType.bigInteger,
            relatedTableName: "_Link",
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
