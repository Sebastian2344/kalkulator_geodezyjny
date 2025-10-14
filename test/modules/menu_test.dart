import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/menu/menu.dart';

void main() {
  late final GoRouter router;
  setUpAll(() {
    router = GoRouter(routes: <RouteBase>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const MainMenu();
          }),
      GoRoute(
          path: '/biegunowa',
          builder: (context, state) {
            return const Scaffold(
                body: Center(child: Text('Metoda Biegunowa')));
          }),
      GoRoute(
          path: '/ortogonalna',
          builder: (context, state) {
            return const Scaffold(
                body: Center(child: Text('Metoda Ortogonalna')));
          }),
      GoRoute(
          path: '/kat',
          builder: (context, state) {
            return const Scaffold(body: Center(child: Text('Wcięcie Kątowe')));
          }),
      GoRoute(
          path: '/linia',
          builder: (context, state) {
            return const Scaffold(body: Center(child: Text('Wcięcie Liniowe')));
          }),
    ]);
  });
  group('MainMenu tests', () {
    testWidgets('MainMenu has a title and four buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp.router(
        routerConfig: router,
      ));

      expect(find.text('Program Geodezyjny'), findsOneWidget);
      expect(find.text('Metoda Biegunowa'), findsOneWidget);
      expect(find.text('Metoda Ortogonalna'), findsOneWidget);
      expect(find.text('Wcięcie Kątowe'), findsOneWidget);
      expect(find.text('Wcięcie Liniowe'), findsOneWidget);
    });
    group('click to button and navigate', () {
      testWidgets('click to button and navigate metoda biegunowa',
          (tester) async {
        await tester.pumpWidget(MaterialApp.router(
          routerConfig: router,
        ));

        await tester.tap(find.text('Metoda Biegunowa'));
        await tester.pumpAndSettle();
        expect(find.text('Metoda Biegunowa'), findsOneWidget);
      });

      testWidgets('click to button and navigate metoda ortogonalna',
          (tester) async {
        await tester.pumpWidget(MaterialApp.router(
          routerConfig: router,
        ));
        await tester.tap(find.text('Metoda Ortogonalna'));
        await tester.pumpAndSettle();
        expect(find.text('Metoda Ortogonalna'), findsOneWidget);
      });

      testWidgets('click to button and navigate wcięcie kątowe',
          (tester) async {
        await tester.pumpWidget(MaterialApp.router(
          routerConfig: router,
        ));
        await tester.tap(find.text('Wcięcie Kątowe'));
        await tester.pumpAndSettle();
        expect(find.text('Wcięcie Kątowe'), findsOneWidget);
      });

      testWidgets('click to button and navigate wcięcie liniowe',
          (tester) async {
        await tester.pumpWidget(MaterialApp.router(
          routerConfig: router,
        ));
        await tester.tap(find.text('Wcięcie Liniowe'));
        await tester.pumpAndSettle();
        expect(find.text('Wcięcie Liniowe'), findsOneWidget);
      });
    });
  });
}
