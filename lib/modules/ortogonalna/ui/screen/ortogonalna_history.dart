import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../nav/go_router.dart';
import '../../cubit/history_ortogonalna_cubit.dart';
import '../../cubit/ortogonalna_cubit.dart';

class OrtogonalnaHistory extends StatelessWidget {
  const OrtogonalnaHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 45, 46, 45),
      appBar: AppBar(
        backgroundColor: Colors.brown[900],
        foregroundColor: Colors.white,
        title: const Text('Historia obliczeń',style:TextStyle(fontSize: 24)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                context.read<OrtogonalnaCubit>().resetState();
                await context.read<HistoryOrtogonalnaCubit>().closeDB();
                Navigation.router.pushReplacement('/ortogonalna');
              },
              icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: BlocBuilder<HistoryOrtogonalnaCubit, HistoryOrtogonalnaState>(
          builder: (context, state) {
        if (state is HistoryOrtogonalnaInitial) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is IGotIt) {
          return ListView.builder(
            itemCount: state.lista.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.brown[900]),
                child: Dismissible(
                  key: Key(index.toString()),
                  background: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red,),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                  onDismissed: (_)async{
                    await context
                    .read<HistoryOrtogonalnaCubit>()
                    .deleteFromDB(state.lista[index].id);
                  },
                  direction: DismissDirection.endToStart,
                  child: ListTile(
                    subtitleTextStyle: const TextStyle(fontSize: 16),
                    textColor: Colors.white,
                    titleTextStyle: const TextStyle(fontSize: 20),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom:10.0),
                      child: Text(state.lista[index].nazwa,textAlign: TextAlign.center,),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Row(
                          children: [
                            const Expanded(child:Text('Stanowisko')),
                            Expanded(child:Text("${state.lista[index].dane![0]} X")),
                            Expanded(child:Text("${state.lista[index].dane![1]} Y"))
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(child:Text('Nawiązanie'),),
                            Expanded(child:Text("${state.lista[index].dane![2]} X")),
                            Expanded(child:Text("${state.lista[index].dane![3]} Y"))
                          ],
                        ),
                        Row( 
                          children: [
                            const Expanded(child:Text('Bierząca i domiar')),
                            Expanded(child:Text("${state.lista[index].dane![4]} m")),
                            Expanded(child:Text("${state.lista[index].dane![5]} m"))
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(child:Text('Przyrosty'),),
                            Expanded(child:Text("${state.lista[index].przyrosty![0]} X")),
                            Expanded(child:Text("${state.lista[index].przyrosty![1]} Y"))
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(child:Text('Wyniki')),
                            Expanded(child:Text("${state.lista[index].wyniki![0]} X")),
                            Expanded(child:Text("${state.lista[index].wyniki![1]} Y"))
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(child:Text('Azymut'),),
                            Expanded(child: Text("${state.lista[index].azymut} g")),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Error'),
              ElevatedButton(onPressed: (){
                context.read<HistoryOrtogonalnaCubit>().resetState();
              }, child: const Text('Spróbuj ponownie'))
            ],
          );
        }
      }),
    );
  }
}