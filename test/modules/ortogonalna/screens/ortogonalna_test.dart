
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/cubit/ortogonalna_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/ui/screen/ortogonalna.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/ui/widgets/beauty_textfield.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/ui/widgets/initial_state_ortogonalna_view.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/ui/widgets/succesful_state.dart';
import 'package:mocktail/mocktail.dart';

class MockOrtogonalnaCubit extends Mock implements OrtogonalnaCubit {}


void main() {
  late MockOrtogonalnaCubit cubit;

  setUp(() {
    cubit = MockOrtogonalnaCubit();

    when(() => cubit.state).thenReturn(OrtogonalnaInitial());
    when(() => cubit.stream).thenAnswer((_) => const Stream.empty());
  });

  testWidgets('title, textfields and write to first tf and filledbutton click', (tester) async {

    when(() => cubit.wynikOrtogonalnej(any(),any(),any(),any(),any(),any())).thenReturn(null);
    await tester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<OrtogonalnaCubit>.value(value: cubit),
    ], child: const MaterialApp(home: MetodaOrtogonalna())));

    await tester.pumpAndSettle();

    expect(find.text('Metoda Ortogonalna'), findsOneWidget);
    expect(find.byType(BeautyTextField), findsNWidgets(6));
    await tester.enterText(find.byType(BeautyTextField).first, '10');
    expect(find.text('10'), findsOneWidget);
    expect(find.byType(FilledButton), findsOneWidget);
    await tester.tap(find.byType(FilledButton));
    await tester.pump();
    
    verify(() => cubit.wynikOrtogonalnej(any(),any(),any(),any(),any(),any())).called(1);
  });
  testWidgets('initial state view',
      (tester) async {
   await tester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<OrtogonalnaCubit>.value(value: cubit),
    ], child: const MaterialApp(home: MetodaOrtogonalna())));

    await tester.pumpAndSettle();

    expect(find.byType(InitialStateOrtogonalnaView), findsOneWidget);
  });
  testWidgets('succesful state view', (tester) async {
    when(() => cubit.state).thenReturn(OrtogonalnaSuccesful([1,1,1], [1,1], [1,1,1,1,1,1], 0));
    
    await tester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<OrtogonalnaCubit>.value(value: cubit),
    ], child: const MaterialApp(home: MetodaOrtogonalna())));

    await tester.pumpAndSettle();

    expect(find.byType(SuccesfulStateOrtogonalnaView), findsOneWidget);
  });
  testWidgets('error state view', (tester) async {
    when(() => cubit.state).thenReturn(OrtogonalnaError('error'));
   await tester.pumpWidget(MultiBlocProvider(providers: [
      BlocProvider<OrtogonalnaCubit>.value(value: cubit),
    ], child: const MaterialApp(home: MetodaOrtogonalna())));
    
    await tester.pumpAndSettle();

    expect(find.textContaining('error'), findsOneWidget);
  });
}
