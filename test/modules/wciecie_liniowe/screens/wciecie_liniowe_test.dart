import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/cubit/wciecie_liniowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/data/model/wciecie_liniowe_model.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/ui/wciecie_liniowe.dart';
import 'package:mocktail/mocktail.dart';

class MockWciecieLinioweCubit extends Mock
    implements WciecieLinioweCubit {}

void main() {
  late MockWciecieLinioweCubit mockCubit;

  setUp(() {
    mockCubit = MockWciecieLinioweCubit();
  });

  Widget buildTestableWidget() {
    return MaterialApp(
      home: BlocProvider<WciecieLinioweCubit>.value(
        value: mockCubit,
        child: const WciecieLiniowe(),
      ),
    );
  }

  testWidgets('Powinien wyświetlić wszystkie pola tekstowe i przycisk Oblicz',
      (tester) async {
    when(() => mockCubit.state).thenReturn(WciecieLinioweInitial());
    when(() => mockCubit.stream).thenAnswer((_)=> Stream.empty());

    await tester.pumpWidget(buildTestableWidget());

    // Sprawdź, czy pola istnieją
    expect(find.byType(TextField), findsNWidgets(7));
    expect(find.text('Oblicz'), findsOneWidget);
    expect(find.text('Wcięcie Liniowe'), findsOneWidget);
  });

  testWidgets('Powinien wywołać oblicz() po kliknięciu przycisku',
      (tester) async {
    when(() => mockCubit.state).thenReturn(WciecieLinioweInitial());
    when(() => mockCubit.stream).thenAnswer((_)=> Stream.empty());
    when(() => mockCubit.oblicz(any(), any(), any(), any(), any(), any(), any()))
        .thenAnswer((_) async {});

    await tester.pumpWidget(buildTestableWidget());

    await tester.enterText(find.byType(TextField).at(0), '100');
    await tester.enterText(find.byType(TextField).at(1), '200');

    await tester.tap(find.text('Oblicz'));
    await tester.pump();

    verify(() => mockCubit.oblicz(any(), any(), any(), any(), any(), any(), any()))
        .called(1);
  });

  testWidgets('Powinien pokazać dane w tabeli po stanie sukcesu',
      (tester) async {
        when(() => mockCubit.stream).thenAnswer((_)=> Stream.empty());
    final mockModel = WciecieLinioweModel(1,1,1,1,
      120.0,
      240.0,1,1,1,1,
      50.0,
      60.0,
    );

    when(() => mockCubit.state)
        .thenReturn(WciecieLinioweSuccessful(mockModel));

    await tester.pumpWidget(buildTestableWidget());
    await tester.pumpAndSettle();

    expect(find.text('120.0'), findsOneWidget);
    expect(find.text('240.0'), findsOneWidget);
    expect(find.text('50.0'), findsOneWidget);
    expect(find.text('60.0'), findsOneWidget);
  });

  testWidgets('Powinien pokazać komunikat błędu po stanie błędu',
      (tester) async {
    when(() => mockCubit.state).thenReturn(WciecieLinioweError(''));
    when(() => mockCubit.stream).thenAnswer((_)=> Stream.empty());
    
    await tester.pumpWidget(buildTestableWidget());
    await tester.pumpAndSettle();

    expect(
        find.textContaining(
            'Podałeś złe dane w polach. Upewnij się że to są liczby'),
        findsOneWidget);
  });
}
