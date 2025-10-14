import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/cubit/crud_wciecie_liniowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/cubit/wciecie_liniowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/model/save_wciecie_liniowe.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/model/wciecie_liniowe_model.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/ui/wciecie_liniowe_history.dart';
import 'package:mocktail/mocktail.dart';

class MockCrudWciecieLinioweCubit extends Mock
    implements CrudWciecieLinioweCubit {}

class MockWciecieLinioweCubit extends Mock
    implements WciecieLinioweCubit {}

void main() {
  late MockCrudWciecieLinioweCubit mockCrudCubit;
  late MockWciecieLinioweCubit mockWLcubit;

  setUp(() {
    mockCrudCubit = MockCrudWciecieLinioweCubit();
    mockWLcubit = MockWciecieLinioweCubit();
  });

  Widget _buildTestable(Widget widget) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CrudWciecieLinioweCubit>.value(value: mockCrudCubit),
        BlocProvider<WciecieLinioweCubit>.value(value: mockWLcubit),
      ],
      child: MaterialApp(home: widget),
    );
  }

  group('WciecieLinioweHistory Widget Tests', () {
    testWidgets('Powinien pokazać loader w stanie początkowym', (tester) async {
      when(() => mockCrudCubit.state).thenReturn(CrudWciecieLinioweInitial());
      when(() => mockCrudCubit.stream).thenAnswer((_)=> Stream.empty());

      await tester.pumpWidget(_buildTestable(const WciecieLinioweHistory()));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Powinien pokazać komunikat błędu i przycisk Spróbuj ponownie', (tester) async {
      when(() => mockCrudCubit.state)
          .thenReturn(CrudWciecieLinioweGetError('Błąd bazy danych'));
      when(() => mockCrudCubit.stream).thenAnswer((_)=> Stream.empty());

      await tester.pumpWidget(_buildTestable(const WciecieLinioweHistory()));
      await tester.pumpAndSettle();

      expect(find.text('Błąd bazy danych'), findsOneWidget);
      expect(find.text('Spróbuj ponownie'), findsOneWidget);

      when(() => mockCrudCubit.resetState()).thenReturn(null);
      await tester.tap(find.text('Spróbuj ponownie'));
      await tester.pump();

      verify(() => mockCrudCubit.resetState()).called(1);
    });

    testWidgets('Powinien pokazać listę zapisanych obliczeń', (tester) async {
      when(() => mockCrudCubit.stream).thenAnswer((_)=> Stream.empty());
      final mockModel = WciecieLinioweModel(
        1,
        2,
        3,
        4,
        10,
        20,
        100,
        200,
        5,
        6,
        7,
        8,
      );

      final mockSaveModel = WciecieLinioweSave(
         'Pomiar 1',
         mockModel,
      );

      when(() => mockCrudCubit.state).thenReturn(
        CrudWciecieLinioweGetSuccessful([mockSaveModel]),
      );

      await tester.pumpWidget(_buildTestable(const WciecieLinioweHistory()));
      await tester.pumpAndSettle();

      expect(find.text('Pomiar 1'), findsOneWidget);
      expect(find.textContaining('Stanowisko A'), findsOneWidget);
      expect(find.byType(Dismissible), findsOneWidget);
    });

    testWidgets('Powinien usunąć element po przesunięciu (Dismissible)', (tester) async {
      when(() => mockCrudCubit.stream).thenAnswer((_)=> Stream.empty());
      when(() => mockWLcubit.stream).thenAnswer((_)=> Stream.empty());
      final mockModel = WciecieLinioweModel(
        1,  2,  3,  4,
        10,  20,  100,  200,
        5, 6,  7,  8,
      );

      final mockSaveModel = WciecieLinioweSave(
        'Pomiar test',
         mockModel,
      );

      when(() => mockCrudCubit.state).thenReturn(
        CrudWciecieLinioweGetSuccessful([mockSaveModel]),
      );
      when(() => mockCrudCubit.deleteData(any())).thenAnswer((_) async {});

      await tester.pumpWidget(_buildTestable(const WciecieLinioweHistory()));
      await tester.pumpAndSettle();

      await tester.drag(find.text('Pomiar test'), const Offset(-500, 0));
      await tester.pumpAndSettle();

      verify(() => mockCrudCubit.deleteData(any())).called(1);
    });

    testWidgets('Powinien zresetować i zamknąć bazę po kliknięciu strzałki w AppBarze', (tester) async {
      when(() => mockCrudCubit.state).thenReturn(CrudWciecieLinioweGetSuccessful([]));
      when(() => mockCrudCubit.stream).thenAnswer((_)=> Stream.empty());
      when(() => mockWLcubit.stream).thenAnswer((_)=> Stream.empty());
      when(() => mockWLcubit.resetState()).thenReturn(null);
      when(() => mockCrudCubit.closeDB()).thenAnswer((_) async {});

      await tester.pumpWidget(_buildTestable(const WciecieLinioweHistory()));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      verify(() => mockWLcubit.resetState()).called(1);
      verify(() => mockCrudCubit.closeDB()).called(1);
    });
  });
}