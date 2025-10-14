import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/cubit/crud_wciecie_liniowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/cubit/wciecie_liniowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/model/wciecie_liniowe_model.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/ui/save_alert_dialog_wl.dart';
import 'package:mocktail/mocktail.dart';

class MockWciecieLinioweCubit extends Mock
    implements WciecieLinioweCubit {}

class MockCrudWciecieLinioweCubit extends Mock
    implements CrudWciecieLinioweCubit {}

class FakeWciecieLinioweModel extends Fake implements WciecieLinioweModel {}

void main() {
  late MockWciecieLinioweCubit mockCubit;
  late MockCrudWciecieLinioweCubit mockCrud;

  setUp(() {
    mockCubit = MockWciecieLinioweCubit();
    mockCrud = MockCrudWciecieLinioweCubit();
  });

  setUpAll((){registerFallbackValue(FakeWciecieLinioweModel());});

  Widget makeTestable(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WciecieLinioweCubit>.value(value: mockCubit),
        BlocProvider<CrudWciecieLinioweCubit>.value(value: mockCrud),
      ],
      child: MaterialApp(home: Scaffold(appBar: AppBar(actions: [child]))),
    );
  }

  group('SaveAlertDialogWL', () {
    testWidgets('pokazuje dialog zapisu, gdy stan to Successful',
        (tester) async {
      
      whenListen(
        mockCubit,
        Stream<WciecieLinioweState>.empty(),
        initialState: WciecieLinioweSuccessful(
          WciecieLinioweModel(1,1,1,1,
             10.0,
             20.0,1,1,1,1,
             5.0,
             6.0,
          ),
        ),
      );

      when(() => mockCrud.state).thenReturn(CrudWciecieLinioweInitial());
      when(() => mockCrud.stream).thenAnswer((_)=> Stream.empty());

      when(() => mockCrud.openDB()).thenAnswer((_) async {});
      when(() => mockCrud.saveData(any(), any())).thenAnswer((_) async {});
      when(() => mockCrud.getData()).thenAnswer((_) async {});

      final controller = TextEditingController();
      await tester.pumpWidget(makeTestable(SaveAlertDialogWL(controller7: controller)));

      await tester.tap(find.byIcon(Icons.save));
      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Nazwij zapis'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'Testowy zapis');
      await tester.pump();

      await tester.tap(find.text('Zapisz'));
      await tester.pumpAndSettle();

      verify(() => mockCrud.openDB()).called(1);
      verify(() => mockCrud.saveData(any(), 'Testowy zapis')).called(1);
      verify(() => mockCrud.getData()).called(1);
    });

    testWidgets('pokazuje dialog informacyjny, gdy stan NIE jest Successful',
        (tester) async {
      whenListen(
        mockCubit,
        Stream<WciecieLinioweState>.empty(),
        initialState: WciecieLinioweInitial(),
      );

      when(() => mockCrud.state).thenReturn(CrudWciecieLinioweInitial());
      when(() => mockCrud.stream).thenAnswer((_)=> Stream.empty());

      when(() => mockCrud.openDB()).thenAnswer((_) async {});
      when(() => mockCrud.getData()).thenAnswer((_) async {});

      final controller = TextEditingController();
      await tester.pumpWidget(makeTestable(SaveAlertDialogWL(controller7: controller)));

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