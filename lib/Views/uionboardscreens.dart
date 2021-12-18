
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class ShowCase extends StatefulWidget {
  const ShowCase({Key key}) : super(key: key);

  @override
  _ShowCaseState createState() => _ShowCaseState();
}

class _ShowCaseState extends State<ShowCase> with TickerProviderStateMixin {
  List<dynamic> _furnitures = [
    {
      'title': 'Job \nPortal',
      'sub_title':
          'Somewhere Someone Is Looking For Exactly What You Have To Offer.',
      'image':
          'https://images.unsplash.com/photo-1536148935331-408321065b18?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZ3JhbW1lcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
    },
    {
      'title': 'Job \nPortal',
      'sub_title':
          'Somewhere Someone Is Looking For Exactly What You Have To Offer.',
      'image':
          'https://images.unsplash.com/photo-1623520333087-62b8793e3d23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'
    },
    {
      'title': 'Job \nPortal',
      'sub_title':
          'Somewhere Someone Is Looking For Exactly What You Have To Offer.',
      'image':
          'https://images.unsplash.com/photo-1526925539332-aa3b66e35444?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGRldmVsb3BlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
    },
    {
      'title': 'Job \nPortal',
      'sub_title':
          'Somewhere Someone Is Looking For Exactly What You Have To Offer.',
      'image':
          'https://images.unsplash.com/photo-1520509414578-d9cbf09933a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDExfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'
    }
  ];

  //   AnimationController _controller = AnimationController(
  //     duration: const Duration(seconds: 20),
  //     vsync: this
  // )..repeat(reverse: true);
  //
  //   Animation<double> _animation = Tween<double>(
  //     begin: 1.0,
  //     end: 1.5
  // ).animate(
  //       CurvedAnimation(
  //     parent: _controller,
  //     curve: Curves.linear
  // ));
  AnimationController _controller;
  Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.5)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (int index) {
          _controller.value = 0.0;
          _controller.forward();
        },
        itemBuilder: (context, index) {
          return Container(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(),
                  child: ScaleTransition(
                    scale: _animation,
                    child: Image.network(
                      _furnitures[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.1)
                          ])),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FadeInDown(
                              duration: Duration(milliseconds: 500),
                              child: Text(
                                _furnitures[index]['title'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 42,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            FadeInDown(
                                delay: Duration(milliseconds: 100),
                                duration: Duration(milliseconds: 800),
                                child: Text(
                                  _furnitures[index]['sub_title'],
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 18,
                                  ),
                                )),
                            SizedBox(
                              height: 50,
                            ),
                            FadeInLeft(
                              delay: Duration(milliseconds: 100),
                              duration: Duration(milliseconds: 1000),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: MaterialButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage()));
                                    },
                                    color: Colors.orange,
                                    padding: EdgeInsets.only(
                                        right: 5, left: 30, top: 5, bottom: 5),
                                    child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Get Started',
                                            style: TextStyle(
                                              color: Colors.orange.shade50,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  color: Colors.orange.shade300,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
                                              child: Icon(
                                                Icons.arrow_forward,
                                                color: Colors.orange.shade100,
                                              )),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(height: 50),
                          ])),
                )
              ],
            ),
          );
        },
        itemCount: _furnitures.length,
        controller: PageController(viewportFraction: 1.0),
      ),
    );
  }
}
