import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import '../lib/pages/user.dart';
import '../lib/pages/user_drawers/friends.dart';
import '../lib/pages/user_drawers/addFriend.dart';
import '../lib/tools/routes.dart';
import './elements.dart';
import '../lib/main.dart' as app;
import '../lib/tools/account.dart';
import './unihelper.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('integration test', () {
    testWidgets('login test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(username, findsOneWidget);
      expect(password, findsOneWidget);
      expect(singin, findsOneWidget);

      await tester.enterText(username, 'Jane');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      //await Future.delayed(Duration(seconds: 2));
      //await tester.ensureVisible(password);

      await tester.enterText(password, 'password2');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      await tester.tap(singin);
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
    }, skip: true);

    testWidgets('home page test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(username, findsOneWidget);
      expect(password, findsOneWidget);
      expect(singin, findsOneWidget);

      await tester.enterText(username, 'Jane');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      //await Future.delayed(Duration(seconds: 2));
      //await tester.ensureVisible(password);

      await tester.enterText(password, 'password2');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.ensureVisible(singin);
      await tester.tap(singin);
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
      //now is home page
      // await tester.tap(userTitle);
      // await tester.pumpAndSettle();
    }, skip: true);

    testWidgets('click friends, go to friends page',
        (WidgetTester tester) async {
      await tester.pumpUserPage();
      await tester.pumpAndSettle();
      expect(find.text('My Account'), findsOneWidget);
      //expect(find.byType(Drawer), findsOneWidget);
      //await tester.ensureVisible(userDrawer);
      //await tester.tap(userDrawer);
      await tester.tap(find.byIcon(Icons.menu));
      await Future.delayed(Duration(seconds: 2));
      await tester.pumpAndSettle();
      expect(find.text('Friends'), findsOneWidget);
      await tester.tap(find.text('Friends'));
       await tester.pumpAndSettle();
      expect(find.text('My Friends'), findsOneWidget);
    });

    testWidgets('test Friends page', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'User Management',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
            useMaterial3: true,
          ),
          //home: UserPage(arguments: {'user': userList[1]}),
          initialRoute: '/friends',
          onGenerateRoute: onGenerateRoute,
        ),
      );
      //await Future.delayed(Duration(seconds: 2));

      await tester.pumpAndSettle();
      expect(find.text('My Friends'), findsOneWidget);
      await tester.tap(addFriendBtn);
      await tester.pumpAndSettle();
      expect(find.text('Add New Friend'), findsOneWidget);
    }, skip: true);

    testWidgets('test add friend', (WidgetTester tester) async {
      await tester.pumpFriendsPage();
      //now in friends page
      await tester.pumpAndSettle();
      expect(find.text('My Friends'), findsOneWidget);
      expect(find.text('Jennifer'), findsNothing);
      expect(find.text('Jennifer'), findsNothing);
      await tester.tap(addFriendBtn);
      await tester.pumpAndSettle();
      //now in add friend page
      expect(find.text('Add New Friend'), findsOneWidget);
      await tester.enterText(friendNameText, 'Jennifer');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(friendEmail1Text, 'Jennifer@outlook.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.enterText(friendEmail2Text, 'Jennifer@outlook.com');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.ensureVisible(friendAddBtn);
      await tester.pumpAndSettle();
      //expect(friendAddBtn, findsOneWidget);
      await tester.tap(find.byType(ElevatedButton));
      await Future.delayed(Duration(seconds: 3));
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 4));
      //now in friends page
      expect(find.text('My Friends'), findsOneWidget);
      await tester.ensureVisible(find.text('Jennifer'));
      expect(find.text('Jennifer'), findsOneWidget);
    }, skip: true);
  });
}
