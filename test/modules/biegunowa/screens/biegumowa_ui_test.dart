import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/ui/widgets/succesful_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/ui/screen/biegunowa_ui.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/cubit/biegunowa_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/cubit/history_biegunowa_cubit.dart';

class MockBiegunowaCubit extends Mock implements BiegunowaCubit {}
class MockHistoryBiegunowaCubit extends Mock implements HistoryBiegunowaCubit {}

void main() {
  late MockBiegunowaCubit mockBiegunowaCubit;
  late MockHistoryBiegunowaCubit mockHistoryCubit;

  setUp(() {
    mockBiegunowaCubit = MockBiegunowaCubit();
    mockHistoryCubit = MockHistoryBiegunowaCubit();
    when(() => mockBiegunowaCubit.state).thenReturn(BiegunowaInitial());
    when(() => mockBiegunowaCubit.getController()).thenReturn(TextEditingController());
    when(() => mockBiegunowaCubit.getController2()).thenReturn(TextEditingController());
    when(() => mockBiegunowaCubit.getController3()).thenReturn(TextEditingController());
    when(() => mockBiegunowaCubit.getController4()).thenReturn(TextEditingController());
    when(() => mockBiegunowaCubit.getController5()).thenReturn(TextEditingController());
    when(() => mockBiegunowaCubit.getController6()).thenReturn(TextEditingController());
    when(() => mockBiegunowaCubit.getController7()).thenReturn(TextEditingController());
    when(() => mockBiegunowaCubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockHistoryCubit.stream).thenAnswer((_) => const Stream.empty());
  });

  testWidgets('Wyświetla wszystkie pola i przyciski', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<BiegunowaCubit>.value(value: mockBiegunowaCubit),
            BlocProvider<HistoryBiegunowaCubit>.value(value: mockHistoryCubit),
          ],
          child: const MetodaBiegunowa(),
        ),
      ),
    );

    expect(find.text('Metoda Biegunowa'), findsOneWidget);
    expect(find.text('Współrzędna stanowiska X'), findsOneWidget);
    expect(find.text('Współrzędna stanowiska Y'), findsOneWidget);
    expect(find.text('Współrzędna nawiązania X'), findsOneWidget);
    expect(find.text('Współrzędna nawiązania Y'), findsOneWidget);
    expect(find.text('Kierunek od boku nawiązana'), findsOneWidget);
    expect(find.text('Odległość'), findsOneWidget);
    expect(find.text('Oblicz'), findsOneWidget);
    expect(find.text('Reset'), findsOneWidget);
  });

  testWidgets('Wyświetla wynik po sukcesie', (tester) async {
    when(() => mockBiegunowaCubit.state).thenReturn(
      BiegunowaSuccesful(
        [1.0, 2.0], [3.0, 4.0, 5.0, 6.0, 7.0, 8.0], [9.0, 10.0], 11.0
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<BiegunowaCubit>.value(value: mockBiegunowaCubit),
            BlocProvider<HistoryBiegunowaCubit>.value(value: mockHistoryCubit),
          ],
          child: const MetodaBiegunowa(),
        ),
      ),
    );

    expect(find.byType(SuccesfulStateBiegunowaView), findsOneWidget);
  });

  testWidgets('Wyświetla błąd, gdy stan to BiegunowaError', (tester) async {
    when(() => mockBiegunowaCubit.state).thenReturn(
      BiegunowaError('Błąd testowy'),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<BiegunowaCubit>.value(value: mockBiegunowaCubit),
            BlocProvider<HistoryBiegunowaCubit>.value(value: mockHistoryCubit),
          ],
          child: const MetodaBiegunowa(),
        ),
      ),
    );

    expect(find.textContaining('Błąd testowy'), findsOneWidget);
  });
}