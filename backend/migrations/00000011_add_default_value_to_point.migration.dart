import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration11 extends Migration { 
  @override
  Future upgrade() async {
   		database.addColumn("_Link", SchemaColumn("isNSFW", ManagedPropertyType.boolean, isPrimaryKey: false, autoincrement: false, defaultValue: "false", isIndexed: false, isNullable: false, isUnique: false));
		database.alterColumn("_Activity", "points", (c) {c.defaultValue = "0";});
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    