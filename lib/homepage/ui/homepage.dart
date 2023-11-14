import 'package:flutter/material.dart';
import 'package:hello_world/homepage/bloc/counter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocListener<CounterBloc, CounterState>(
        listener: (context, state) {
          if (state is CounterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is CounterThatsItState) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (builder) =>  SecondPage(state.counter)),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Builder(builder: (context) {
                final state = context.watch<CounterBloc>().state;

                if (state is CounterErrorState) {
                  return Text(
                    state.counter,
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state is CounterSuccessState) {
                  return Text(
                    state.counter,
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }

                return Text(
                  state.counter,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(
                  CounterIncrementEvent(1),
                ),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(
                  CounterDecrementEvent(),
                ),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String counter;
  const SecondPage( this.counter, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Text('$counter asfsafasf')),
    );
  }
}
