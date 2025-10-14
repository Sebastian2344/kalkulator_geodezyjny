import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/cubit/history_ortogonalna_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/cubit/ortogonalna_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/ui/widgets/save_alert_dialog.dart';
import 'package:mocktail/mocktail.dart';

class MockOrtogonalnaCubit extends Mock
    implements OrtogonalnaCubit {}

class MockHistoryOrtogonalnaCubit extends Mock
    implements HistoryOrtogonalnaCubit {}

void main() {
  late MockOrtogonalnaCubit mockCubit;
  late MockHistoryOrtogonalnaCubit mockHistory;

  setUp(() {
    mockCubit = MockOrtogonalnaCubit();
    mockHistory = MockHistoryOrtogonalnaCubit();
  });

  Widget makeTestable(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrtogonalnaCubit>.value(value: mockCubit),
        BlocProvider<HistoryOrtogonalnaCubit>.value(value: mockHistory),
      ],
      child: MaterialApp(home: Scaffold(appBar: AppBar(actions: [child]))),
    );
  }

  group('SaveAlertDialogO', () {
    testWidgets('pokazuje dialog zapisu i wywołuje metody zapisu przy stanie Succesful',
        (tester) async {

      final dane = [1.0, 2.0];
      final azymut = 123.45;
      final przyrosty = [1.1, 2.2];
      final wynik = [10.0, 20.0];

      whenListen(
        mockCubit,
        Stream<OrtogonalnaState>.empty(),
        initialState: OrtogonalnaSuccesful(wynik,przyrosty,dane,azymut),
      );

      when(() => mockHistory.state).thenReturn(HistoryOrtogonalnaInitial());
      when(() => mockHistory.stream).thenAnswer((_) => Stream.empty());

      when(() => mockHistory.openDB()).thenAnswer((_) async {});
      when(() => mockHistory.saveToDb(any(), any(), any(), any(), any()))
          .thenAnswer((_) async {});
      when(() => mockHistory.getFromDb()).thenAnswer((_) async {});

      final controller = TextEditingController();

      await tester.pumpWidget(makeTestable(SaveAlertDialogO(controller7: controller)));

      await tester.tap(find.byIcon(Icons.save));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Nazwij zapis'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'Testowy zapis');
      await tester.pump();

      await tester.tap(find.text('Zapisz'));
      await tester.pumpAndSettle();

      verify(() => mockHistory.openDB()).called(1);
      verify(() => mockHistory.saveToDb(
            'Testowy zapis',
            dane,
            azymut,
            przyrosty,
            wynik,
          )).called(1);
      verify(() => mockHistory.getFromDb()).called(1);
    });

    testWidgets('pokazuje dialog informacyjny, gdy stan nie jest Succesful',
        (tester) async {
      whenListen(
        mockCubit,
        Stream<OrtogonalnaState>.empty(),
        initialState: OrtogonalnaInitial(),
      );

      when(() => mockHistory.state).thenReturn(HistoryOrtogonalnaInitial());
      when(() => mockHistory.stream).thenAnswer((_) => Stream.empty());

      when(() => mockHistory.openDB()).thenAnswer((_) async {});
      when(() => mockHistory.getFromDb()).thenAnswer((_) async {});

      final controller = TextEditingController();

      await tester.pumpWidget(makeTestable(SaveAlertDialogO(controller7: controller)));

      await tester.tap(find.byIcon(Icons.save));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Wybór'), findsOneWidget);

      await tester.tap(find.text('Powrót'));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}