import 'package:flutter/material.dart';
import '../../tools/account.dart';

class BookPage extends StatefulWidget {
  final Map arguments;
  const BookPage({super.key, required this.arguments});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage>
    with SingleTickerProviderStateMixin {
  late User user;
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    user = widget.arguments['user'];
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print(_tabController.index); //获取点击或滑动页面的索引值
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List books = [
      'images/books/book1.jpg',
      'images/books/book2.jpg',
      'images/books/book3.jpg',
      'images/books/book4.jpg',
      'images/books/book5.jpg',
      'images/books/book6.jpg',
      'images/books/book7.jpg',
    ];

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Book Shelves'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: null,
            ),
          ],
          bottom: TabBar(controller: _tabController, tabs: [
            Tab(child: Text(" Shelves ")),
            Tab(child: Text("Book Store")),
          ]),
        ),
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        body: TabBarView(controller: _tabController, children: [
          Container(
            margin: EdgeInsets.all(15),
            child: ListView(
              //padding: EdgeInsets.all(16),
              children: [
                Container(
                  padding: EdgeInsets.only(left: 8),
                  height: 30,
                  child: Text(
                    'Recent Read',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                //recent read
                Container(
                  height: height / 5,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7, 
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.bottomCenter,
                        width: width / 5,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(books[index]),
                              fit: BoxFit.cover),
                          color: Colors.blue,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8),
                  height: 30,
                  child: Text(
                    'My Favorite',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                //recent read
                Container(
                  height: height / 5,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7, // Number of items in the first row ListView
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.bottomCenter,
                        width: width / 5,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(books[6 - index]),
                              fit: BoxFit.cover),
                          color: Colors.blue,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          //book store
          Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://source.unsplash.com/9DaOYUYnOls'),
                      fit: BoxFit.cover)),
              child: Container(
                width: width / 3,
                height: 40,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  label: Text("Search"),
                  icon: Icon(Icons.search),
                ),
              )),
        ]));
  }
}
