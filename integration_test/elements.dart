import 'package:flutter_test/flutter_test.dart';
import 'package:user_management/consts/router_keys.dart';

final Finder singin = find.byKey(RouterKeys.signinBtn);
final Finder username = find.byKey(RouterKeys.usernameText);
final Finder password = find.byKey(RouterKeys.passwordText);
final Finder userTitle = find.byKey(RouterKeys.accessUserTitle);
final Finder userDrawer = find.byKey(RouterKeys.userDrawer);
final Finder friends = find.byKey(RouterKeys.friends);
final Finder addFriendBtn = find.byKey(RouterKeys.addFriendBtn);
final Finder friendNameText = find.byKey(RouterKeys.friend_name);
final Finder friendEmail1Text = find.byKey(RouterKeys.friend_email1);
final Finder friendEmail2Text = find.byKey(RouterKeys.friend_email2);
final Finder friendAddBtn = find.byKey(RouterKeys.friend_add);

