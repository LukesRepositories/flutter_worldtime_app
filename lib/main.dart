import 'package:flutter/material.dart';
import 'quote.dart';

void main() {
  runApp(MaterialApp(
      home: Home()
  ));
}
// Add a divider somewhere like what was shown in the net ninja ninja id project video
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int incrementerA = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal[400],
        //unselectedItemColor: Colors.teal[400],
        //selectedItemColor: Colors.teal[600],
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'User',
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal[400],

        title: Text("Hello, world!"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.red,
                  child: Text('1'),
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(20),
                  color: Colors.green,
                  child: Text('$incrementerA'),
                ),
              ),
              Expanded(
                flex: 4,
                child: Image.asset('resources/images/Police_car.png')
              ),

            ],
          ),
          Divider(
            height: 10.0,
            color: Colors.teal[600],
          ),
          Column(
            children: quotes.map((quote) {
              return Card(
                child: quote.getQuote(() {
                  setState(() {
                    quotes.remove(quote);
                  });
                }),

              );
            }).toList(),
          ), // Nested Column
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            incrementerA += 1;
          });
        },
        backgroundColor: Colors.teal[400],
        child: Text("Tap"),
      ),
    );
  }
}

List<Quote> quotes = [
  Quote(authorArg: "Muhammad Ali", snippetArg: "Float like a butterfly, sting like a bee"),
  Quote(authorArg: "John Lennon", snippetArg: "Life is what happens when you are busy making plans"),
  Quote(authorArg: "The Bible", snippetArg: "A fool returns to his folly, like a dog returns to its vomit")
];


