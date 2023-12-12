import 'package:flutter/material.dart';
import 'package:practise/providers/countProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(child: MyApp(),
      providers: [
        ChangeNotifierProvider(create: (_) => counterProvider())
      ],));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${context.watch<counterProvider>().getCounter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          FilledButton(onPressed: () =>{
            context.read<counterProvider>().displayDialog(context)
          }, child: const Text('Show Dialog')),



          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            onPressed: () =>  context.read<counterProvider>().increment(),
          child: Icon(Icons.add),),),
          Padding(padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(onPressed: () => context.read<counterProvider>().decrement(),
          child: Icon(Icons.remove),),)
        ],
      ),
    );
  }
}
