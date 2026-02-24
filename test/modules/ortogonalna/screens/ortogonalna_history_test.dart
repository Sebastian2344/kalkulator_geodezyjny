import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/cubit/history_ortogonalna_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/cubit/ortogonalna_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/data/models/save_ortogonalna.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/ui/screen/ortogonalna_history.dart';
import 'package:mocktail/mocktail.dart';

class MockOrtogonalnaHistory extends Mock implements HistoryOrtogonalnaCubit {}

class MockOrtogonalnaCubit extends Mock implements OrtogonalnaCubit {}

void main() {
  late MockOrtogonalnaHistory mockOrtogonalnaHistory;
  late MockOrtogonalnaCubit mockOrtogonalnaCubit;
  setUp(() {
    mockOrtogonalnaHistory = MockOrtogonalnaHistory();
    mockOrtogonalnaCubit = MockOrtogonalnaCubit();
    when(() => mockOrtogonalnaHistory.state)
        .thenReturn(HistoryOrtogonalnaInitial());
    when(() => mockOrtogonalnaHistory.stream)
        .thenAnswer((_) => const Stream.empty());
  });
  testWidgets('initial state view', (tester) async {
    await tester.pumpWidget(BlocProvider<HistoryOrtogonalnaCubit>.value(
        value: mockOrtogonalnaHistory,
        child: MaterialApp(home: OrtogonalnaHistory())));

    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('succes state view', (tester) async {
    when(() => mockOrtogonalnaHistory.state).thenReturn(IGotIt([
      SaveOrtogonalna()
        ..id = 1
        ..azymut = 1
        ..dane = [1, 2, 3, 4, 5, 6]
        ..przyrosty = [1, 2]
        ..wyniki = [3, 4]
    ]));
    await tester.pumpWidget(BlocProvider<HistoryOrtogonalnaCubit>.value(
        value: mockOrtogonalnaHistory,
        child: MaterialApp(home: OrtogonalnaHistory())));
    await tester.pump();
    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.text('Historia obliczeń'), findsOneWidget);
    expect(find.textContaining('1'), findsNWidgets(3));
    expect(find.textContaining('2'), findsNWidgets(2));
    expect(find.textContaining('3'), findsNWidgets(2));
    expect(find.textContaining('4'), findsNWidgets(2));
    expect(find.textContaining('5'), findsOneWidget);
    expect(find.textContaining('6'), findsOneWidget);
  });

  testWidgets('error state view', (tester) async {
    when(() => mockOrtogonalnaHistory.state)
        .thenReturn(HistoryOrtogonalnaError('Error'));
    await tester.pumpWidget(BlocProvider<HistoryOrtogonalnaCubit>.value(
        value: mockOrtogonalnaHistory,
        child: MaterialApp(home: OrtogonalnaHistory())));
    await tester.pump();
    expect(find.text('Error'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('reset state and close db when user click button in appbar',
      (tester) async {
    when(
      () => mockOrtogonalnaCubit.state,
    ).thenReturn(OrtogonalnaInitial());
    when(
      () => mockOrtogonalnaHistory.state,
    ).thenReturn(IGotIt([]));
    when(
      () => mockOrtogonalnaCubit.stream,
    ).thenAnswer((_) => Stream.empty());
    when(() => mockOrtogonalnaHistory.closeDB()).thenAnswer((_) async => {});
    when(() => mockOrtogonalnaCubit.resetState()).thenReturn(null);

    await tester.pumpWidget(MaterialApp(
      home: MultiBlocProvider(providers: [
        BlocProvider<HistoryOrtogonalnaCubit>.value(
            value: mockOrtogonalnaHistory),
        BlocProvider<OrtogonalnaCubit>.value(value: mockOrtogonalnaCubit)
      ], child: OrtogonalnaHistory()),
    ));
    await tester.pump();

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pump();

    verify(() => mockOrtogonalnaCubit.resetState()).called(1);
    verify(() => mockOrtogonalnaHistory.closeDB()).called(1);
  });
}
