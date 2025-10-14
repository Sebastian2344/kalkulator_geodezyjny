import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/cubit/save_wcecie_katowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/cubit/wciecie_katowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/data/model/wciece_katowe_model.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/ui/save_alert_dailog_wk.dart';
import 'package:mocktail/mocktail.dart';

class MockWciecieKatoweCubit extends Mock
    implements WciecieKatoweCubit {}

class MockHistoryWciecieKatoweCubit extends Mock
    implements HistoryWciecieKatoweCubit {}

class FakeWciecieKatoweModel extends Fake implements WciecieKatoweModel {}

void main() {
  late MockWciecieKatoweCubit mockCubit;
  late MockHistoryWciecieKatoweCubit mockHistory;

  setUp(() {
    mockCubit = MockWciecieKatoweCubit();
    mockHistory = MockHistoryWciecieKatoweCubit();
  });

  setUpAll((){registerFallbackValue(FakeWciecieKatoweModel());});

  Widget makeTestable(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WciecieKatoweCubit>.value(value: mockCubit),
        BlocProvider<HistoryWciecieKatoweCubit>.value(value: mockHistory),
      ],
      child: MaterialApp(home: Scaffold(appBar: AppBar(actions: [child]))),
    );
  }

  group('SaveAlertDialogWK', () {
    testWidgets('pokazuje dialog zapisu, gdy stan to Succesful', (tester) async {
      
      final mockModel = WciecieKatoweModel(1,1,1,1,1,1,
        10.0,
        20.0,
        30.0,
        30.1,
      );

      whenListen(
        mockCubit,
        Stream<WciecieKatoweState>.empty(),
        initialState: WciecieKatoweSuccesful(mockModel),
      );

      when(() => mockHistory.state).thenReturn(HistoryWciecieKatoweInitial());
      when(() => mockHistory.stream).thenAnswer((_) => Stream.empty());

      when(() => mockHistory.openDB()).thenAnswer((_) async {});
      when(() => mockHistory.saveData(any(), any())).thenAnswer((_) async {});
      when(() => mockHistory.getData()).thenAnswer((_) async {});

      final controller = TextEditingController();
      await tester.pumpWidget(makeTestable(SaveAlertDialogWK(controller7: controller)));

      await tester.tap(find.byIcon(Icons.save));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Nazwij zapis'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'Zapis testowy');
      await tester.pump();

      await tester.tap(find.text('Zapisz'));
      await tester.pumpAndSettle();

      verify(() => mockHistory.openDB()).called(1);
      verify(() => mockHistory.saveData(mockModel, 'Zapis testowy')).called(1);
      verify(() => mockHistory.getData()).called(1);
    });

    testWidgets('pokazuje dialog informacyjny, gdy stan NIE jest Succesful',
        (tester) async {
      whenListen(
        mockCubit,
        Stream<WciecieKatoweState>.empty(),
        initialState: WciecieKatoweInitial(),
      );

      when(() => mockHistory.state).thenReturn(HistoryWciecieKatoweInitial());
      when(() => mockHistory.stream).thenAnswer((_) => Stream.empty());
      
      when(() => mockHistory.openDB()).thenAnswer((_) async {});
      when(() => mockHistory.getData()).thenAnswer((_) async {});

      final controller = TextEditingController();
      await tester.pumpWidget(makeTestable(SaveAlertDialogWK(controller7: controller)));

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