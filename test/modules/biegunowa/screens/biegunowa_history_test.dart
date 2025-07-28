import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/ui/screen/biegunowa_history.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/cubit/history_biegunowa_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/data/models/save_biegunowa.dart';

class MockHistoryBiegunowaCubit extends Mock implements HistoryBiegunowaCubit {}

void main() {
  late MockHistoryBiegunowaCubit mockCubit;

  setUp(() {
    mockCubit = MockHistoryBiegunowaCubit();
    when(() => mockCubit.stream).thenAnswer((_) => const Stream.empty());
  });

  testWidgets('Wyświetla listę historii, gdy stan to IGotIt', (tester) async {
    final testSave = SaveBiegunowa()
      ..id = 1
      ..nazwa = 'Test'
      ..dane = ['1X', '2Y', '3X', '4Y', '5g', '6m']
      ..przyrosty = ['1X', '2Y']
      ..wyniki = ['3X', '4Y']
      ..azymut = '7g';

    when(() => mockCubit.state).thenReturn(IGotIt([testSave]));
    when(() => mockCubit.closeDB()).thenAnswer((_) async {});

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<HistoryBiegunowaCubit>.value(
          value: mockCubit,
          child: const BiegunowaHistory(),
        ),
      ),
    );

    // Sprawdź, czy tytuł i nazwa są widoczne
    expect(find.text('Historia obliczeń'), findsOneWidget);
    expect(find.text('Test'), findsOneWidget);

    // Sprawdź, czy dane z listy są widoczne
    expect(find.text('1X'), findsWidgets);
    expect(find.text('2Y'), findsWidgets);
    expect(find.text('7g'), findsOneWidget);
  });

  testWidgets('Wyświetla loader, gdy stan to HistoryBiegunowaInitial', (tester) async {
    when(() => mockCubit.state).thenReturn(HistoryBiegunowaInitial());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<HistoryBiegunowaCubit>.value(
          value: mockCubit,
          child: const BiegunowaHistory(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Wyświetla Error, gdy stan nieznany', (tester) async {
    String error = 'Error';
    when(() => mockCubit.state).thenReturn(HistoryBiegunowaError(error));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<HistoryBiegunowaCubit>.value(
          value: mockCubit,
          child: const BiegunowaHistory(),
        ),
      ),
    );

    expect(find.text('Error'), findsOneWidget);
  });
}