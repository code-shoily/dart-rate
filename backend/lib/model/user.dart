import 'package:backend/backend.dart';

import "activity.dart";
import "award.dart";
import "comment.dart";
import "common.dart";
import "follow.dart";
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

  ManagedSet<Activity> activities;
  ManagedSet<Award> awards;
  ManagedSet<Follow> follows;
  ManagedSet<Follow> followers;
  ManagedSet<Link> links;
  ManagedSet<Comment> comments;
}
