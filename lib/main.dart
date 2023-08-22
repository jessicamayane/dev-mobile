import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
     
          primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'MyApp'),    
      
    );
  }
}

PageController pageController = PageController();
//add int variaveis pra paginacao
int paginaAtual = 0;
int contador = 0;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
     
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
       bottomNavigationBar: BottomNavigationBar(
            currentIndex: paginaAtual,
            selectedItemColor: Colors.red,
            onTap: (page) {
              //pageController.jumpToPage(page);
              pageController.animateToPage(page,
                  duration: Duration(milliseconds: 200), curve: Curves.linear);

              setState(() {
                //tudo o que estiver aqui tera a tela atualizada
                paginaAtual = page;
              });
            },
            items: [
              
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
                 
            ]),
      floatingActionButton: 
        
      FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
