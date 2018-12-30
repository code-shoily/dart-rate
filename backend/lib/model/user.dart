import 'package:backend/backend.dart';

import "award.dart";
import "comment.dart";
import "common.dart";
import "link.dart";

class User extends ManagedObject<_User>
    implements _User, ManagedAuthResourceOwner<_User> {
  @Serialize(input: true, output: false)
  String password;
}

class _User extends ResourceOwnerTableDefinition {
  String firstName;
  String lastName;
  DateTime dateOfBirth;
  String email;
  @Column(nullable: true)
  String bio;
  @Column(nullable: true)
  String phoneNumber;
  @Relate(#users)
  Timezone timezone;
  @Relate(#users)
  Country country;

  ManagedSet<Award> awards;
  ManagedSet<Link> links;
  ManagedSet<Comment> comments;
}
