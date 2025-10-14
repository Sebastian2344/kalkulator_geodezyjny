import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/cubit/wciecie_katowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/model/wciece_katowe_model.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/ui/wciecie_katowe.dart';
import 'package:mocktail/mocktail.dart';

class MockWciecieKatoweCubit extends Mock
    implements WciecieKatoweCubit {}

void main() {
  late MockWciecieKatoweCubit mockCubit;

  setUp(() {
    mockCubit = MockWciecieKatoweCubit();
  });

  Widget _buildTestableWidget() {
    return MaterialApp(
      home: BlocProvider<WciecieKatoweCubit>.value(
        value: mockCubit,
        child: const WciecieKatowe(),
      ),
    );
  }

  group('WciecieKatowe widget tests', () {
    testWidgets('Powinien wyświetlić wszystkie pola tekstowe i przycisk "Oblicz"', (tester) async {
      when(() => mockCubit.state).thenReturn(WciecieKatoweInitial());
      when(() => mockCubit.stream).thenAnswer((_)=> Stream.empty());

      await tester.pumpWidget(_buildTestableWidget());

      // 7 pól tekstowych + 1 przycisk + tytuł
      expect(find.byType(TextField), findsNWidgets(6));
      expect(find.text('Oblicz'), findsOneWidget);
      expect(find.text('Wcięcie Kątowe'), findsOneWidget);
    });

    testWidgets('Powinien wywołać oblicz() po kliknięciu przycisku', (tester) async {
      when(() => mockCubit.state).thenReturn(WciecieKatoweInitial());
      when(() => mockCubit.stream).thenAnswer((_)=> Stream.empty());
      when(() => mockCubit.oblicz(any(), any(), any(), any(), any(), any())).thenAnswer((_) async {});

      await tester.pumpWidget(_buildTestableWidget());

      await tester.enterText(find.byType(TextField).at(0), '100');
      await tester.enterText(find.byType(TextField).at(1), '200');

      await tester.tap(find.text('Oblicz'));
      await tester.pump();

      verify(() => mockCubit.oblicz(any(), any(), any(), any(), any(), any())).called(1);
    });

    testWidgets('Powinien pokazać dane w tabeli po stanie sukcesu', (tester) async {
      final mockModel = WciecieKatoweModel(1,1,1,1,1,1,
         123.45,
         678.9,
         44.5,
        44.6,
      );

      when(() => mockCubit.state)
          .thenReturn(WciecieKatoweSuccesful(mockModel));
      when(() => mockCubit.stream).thenAnswer((_)=> Stream.empty());

      await tester.pumpWidget(_buildTestableWidget());
      await tester.pumpAndSettle();

      expect(find.text('123.45'), findsOneWidget);
      expect(find.text('678.9'), findsOneWidget);
      expect(find.text('44.5'), findsOneWidget);
      expect(find.text('44.6'), findsOneWidget);
    });

    testWidgets('Powinien pokazać komunikat błędu po stanie błędu', (tester) async {
      when(() => mockCubit.state).thenReturn(WciecieKatoweError(''));
      when(() => mockCubit.stream).thenAnswer((_)=> Stream.empty());

      await tester.pumpWidget(_buildTestableWidget());
      await tester.pumpAndSettle();

      expect(
        find.textContaining('Podałeś złe dane w polach'),
        findsOneWidget,
      );
    });

    testWidgets('Powinien wywołać resetState() po kliknięciu w strzałkę w AppBarze', (tester) async {
      when(() => mockCubit.state).thenReturn(WciecieKatoweInitial());
      when(() => mockCubit.stream).thenAnswer((_)=> Stream.empty());
      when(() => mockCubit.resetState()).thenReturn(null);

      await tester.pumpWidget(_buildTestableWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      verify(() => mockCubit.resetState()).called(1);
    });
  });
}