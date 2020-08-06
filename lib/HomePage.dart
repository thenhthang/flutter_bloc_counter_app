import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc_app/blocs/counter_bloc.dart';
import 'package:flutter_counter_bloc_app/events/counter_event.dart';
import 'package:flutter_counter_bloc_app/states/counter_state.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _numberController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    void _incrementCounter() {
      print("Tang");
      counterBloc.add(IncrementEvent(number: int.parse(_numberController.text.toString())));
    }
    void _decrementCounter() {
      print("Giam");
      counterBloc.add(DecrementEvent(number: int.parse(_numberController.text.toString())));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
              ),
              TextField(
                controller: _numberController,
                autocorrect: false,
                obscureText: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
              ),
              BlocBuilder<CounterBloc,CounterState>(
                builder: (context,counterState){
                  if(counterState is CounterStateSuccess){
                    return Text(
                      '${counterState.number}',
                      style: Theme.of(context).textTheme.headline3,
                    );
                  }else if (counterState is CounterStateLoading){
                    return Text(
                      'loading',
                      style: Theme.of(context).textTheme.headline3,
                    );
                  }
                  else{
                    return Text(
                      'Initial',
                      style: Theme.of(context).textTheme.headline3,
                    );
                  }

                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    iconSize: 100,
                    icon: Icon(Icons.add),
                    onPressed: (){
                      _incrementCounter();
                    },
                  ),
                  IconButton(
                    iconSize: 100,
                    icon: Icon(Icons.remove),
                    onPressed: (){
                      _decrementCounter();
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
