import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kuldii_14_state_management_bloc_extension_method/bloc/counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// so there are 3 bloc enxtension method:
  /// context.read, context.watch, context.select
  /// /// check https://www.youtube.com/watch?v=MVnyk5jynhM to learn more

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HOME")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Builder(builder: (context) {
            CounterBloc mycounter = context.watch<CounterBloc>();
            return Text(
              "${mycounter.state}",
              style: TextStyle(fontSize: 100),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => context.read<CounterBloc>().remove(),
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () => context.read<CounterBloc>().add(),
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
