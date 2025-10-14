import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/cubit/save_wcecie_katowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/cubit/wciecie_katowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/model/save_wciecie_katowe.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/model/wciece_katowe_model.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/ui/wciecie_katowe_save_screen.dart';
import 'package:mocktail/mocktail.dart';

class MockWciecieKatoweCubit extends Mock implements WciecieKatoweCubit {}

class MockHistoryWciecieKatoweCubit extends Mock
    implements HistoryWciecieKatoweCubit {}

void main() {
  late MockWciecieKatoweCubit mockWciecieCubit;
  late MockHistoryWciecieKatoweCubit mockHistoryCubit;

  setUp(() {
    mockWciecieCubit = MockWciecieKatoweCubit();
    mockHistoryCubit = MockHistoryWciecieKatoweCubit();
    when(
      () => mockHistoryCubit.stream,
    ).thenAnswer((_) => Stream.empty());
    when(
      () => mockWciecieCubit.stream,
    ).thenAnswer((_) => Stream.empty());
  });

  Widget _buildTestableWidget() {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<WciecieKatoweCubit>.value(value: mockWciecieCubit),
          BlocProvider<HistoryWciecieKatoweCubit>.value(
              value: mockHistoryCubit),
        ],
        child: const WciecieKatoweHistory(),
      ),
    );
  }

  group('WciecieKatoweHistory widget tests', () {
    testWidgets(
        'Powinien wyświetlić CircularProgressIndicator w stanie początkowym',
        (tester) async {
      when(() => mockHistoryCubit.state)
          .thenReturn(HistoryWciecieKatoweInitial());

      await tester.pumpWidget(_buildTestableWidget());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'Powinien wyświetlić listę zapisanych obliczeń w stanie sukcesu',
        (tester) async {
      final mockModel = WciecieKatoweModel(
        100,
        200,
        300,
        400,
        45,
        60,
        150.5,
        250.8,
        75.5,
        76.0,
      );

      final mockSaveList = [
        WciecieKatoweSave("Test obliczenia", mockModel),
      ];

      when(() => mockHistoryCubit.state)
          .thenReturn(HistoryWciecieKatoweGetSuccesful(mockSaveList));

      await tester.pumpWidget(_buildTestableWidget());
      await tester.pumpAndSettle();

      expect(find.text('Historia obliczeń'), findsOneWidget);
      expect(find.text('Test obliczenia'), findsOneWidget);
      expect(find.textContaining('Stanowisko A'), findsOneWidget);
      expect(find.textContaining('Wyniki'), findsOneWidget);
    });

    testWidgets('Powinien wywołać deleteData() po przesunięciu elementu',
        (tester) async {
      final mockModel = WciecieKatoweModel(
        100,
        200,
        300,
        400,
        45,
        60,
        150.5,
        250.8,
        75.5,
        76.0,
      );

      final mockSaveList = [
        WciecieKatoweSave("Historia #1", mockModel),
      ];

      when(() => mockHistoryCubit.state)
          .thenReturn(HistoryWciecieKatoweGetSuccesful(mockSaveList));
      when(() => mockHistoryCubit.deleteData(any())).thenAnswer((_) async {});

      await tester.pumpWidget(_buildTestableWidget());
      await tester.pumpAndSettle();

      final dismissible = find.byType(Dismissible).first;
      await tester.drag(
          dismissible, const Offset(-500, 0));
      await tester.pumpAndSettle();

      verify(() => mockHistoryCubit.deleteData(any())).called(1);
    });

    testWidgets(
        'Powinien wyświetlić komunikat błędu i przycisk "Spróbuj ponownie"',
        (tester) async {
      when(() => mockHistoryCubit.state)
          .thenReturn(HistoryWciecieKatoweGetError("Błąd połączenia z bazą"));

      when(() => mockHistoryCubit.resetState()).thenReturn(null);

      await tester.pumpWidget(_buildTestableWidget());
      await tester.pumpAndSettle();

      expect(find.text('Błąd połączenia z bazą'), findsOneWidget);
      expect(find.text('Spróbuj ponownie'), findsOneWidget);

      await tester.tap(find.text('Spróbuj ponownie'));
      await tester.pump();

      verify(() => mockHistoryCubit.resetState()).called(1);
    });

    testWidgets(
        'Powinien wywołać resetState() i closeDB() po kliknięciu strzałki w AppBarze',
        (tester) async {
      when(() => mockHistoryCubit.state)
          .thenReturn(HistoryWciecieKatoweGetSuccesful([]));
      when(() => mockWciecieCubit.resetState()).thenReturn(null);
      when(() => mockHistoryCubit.closeDB()).thenAnswer((_) async {});

      await tester.pumpWidget(_buildTestableWidget());
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      verify(() => mockWciecieCubit.resetState()).called(1);
      verify(() => mockHistoryCubit.closeDB()).called(1);
    });
  });
}
