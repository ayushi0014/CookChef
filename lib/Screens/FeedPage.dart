import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cook_chef/Widgets/BottomCommentsSheet.dart';

class FeedPage extends StatefulWidget {
  static const String id = 'feed_page';
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  /* This method is to setup each dishCategory */
  String _selectedTab = 'Veg';
  Material _dishCategory(String text, double width) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
      shadowColor: Color(0xff7e807f),
      elevation: (text == _selectedTab) ? 7 : 0,
      child: Container(
        width: width * 0.3,
        padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.5),
        decoration: BoxDecoration(
          border: (text != _selectedTab)
              ? Border.all(color: Colors.grey[400])
              : Border(),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          // boxShadow: [
          //   (text == 'Indian')
          //       ? //background color of box
          //       BoxShadow(
          //           color: Colors.grey,
          //           spreadRadius: 1,
          //           blurRadius: 0.5,
          //           offset: Offset(0, 2),
          //         )
          //       : BoxShadow(
          //           color: Colors.white,
          //         ),
          // ],
          color: Colors.white,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

/* This method is to setup the post */
  // Container _post(
  //     {String name,
  //     String time,
  //     String description,
  //     Image image,
  //     double width,
  //     String likes,
  //     int comments}) {
  //   return Container(
  //     child: Column(
  //       children: <Widget>[
  //         Row(
  //           children: <Widget>[
  //             Icon(Icons.account_circle),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Text(name),
  //                 Text(time),
  //               ],
  //             ),
  //           ],
  //         ),
  //         Text(description),
  //         image,
  //         Row(
  //           children: <Widget>[
  //             Icon(
  //               Icons.favorite_border,
  //             ),
  //             Container(
  //               height: 19,
  //               width: 35,
  //               child: SvgPicture.asset('assets/icons/chat.svg'),
  //             ),
  //           ],
  //         ),
  //         Container(
  //           width: width,
  //           child: Text(
  //             '$likes likes',
  //           ),
  //         ),
  //         Container(
  //           width: width,
  //           child: Text('View all $comments comments'),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    /* These are media query variables which store the height
      and width of the phone screen.
     */
    // final _height = MediaQuery.of(context).size.height -
    //     MediaQuery.of(context).padding.top -
    //     kToolbarHeight;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              color: Color(0xffEBEDEC),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  /* Calling the _dishCategory method at line 10 */
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTab = 'Veg';
                      });
                    },
                    child: _dishCategory('Veg', _width),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTab = 'Non Veg';
                      });
                    },
                    child: _dishCategory('Non Veg', _width),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTab = 'Beverages';
                        });
                      },
                      child: _dishCategory('Beverages', _width)),
                  // _dishCategory('South Indian'),
                ],
              ),
            ),
            Container(
              child: Expanded(
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    /* Calling the _post method at line 23 */

                    SinglePost(
                        name: 'FoodFood',
                        time: '28 mins',
                        description:
                            'A bite of Bhatura, just the size, oozing with the '
                            'chole is pure decadence The flavour burst in '
                            'your mouth, hot at first, tangy after. \n\n'
                            'See full recipe...See more',
                        image: Image.asset('assets/images/chole_bhature.jpg'),
                        likes: 1812,
                        comments: 113,
                        width: _width),
                    SizedBox(
                      height: 15,
                    ),
                    SinglePost(
                        name: 'FoodFood',
                        time: '1 Nov at 12:44 pm',
                        description: '#SizzlingSunday Ab luft uthaiye dal ke'
                            'saath gosht ka! Try this robust & rich Dal Gosht'
                            'recipe, It\'ll surely you\'re your heart! \n\n'
                            'Watch full recipe...See more',
                        image: Image.asset('assets/images/dal_gosht.jpg'),
                        likes: 317,
                        comments: 21,
                        width: _width)
                  ],
                ),
              ),
            ),
// bottomNavigationBar(context: context, page: HomePage.id),
          ],
        ),
      ),
    );
  }
}

class SinglePost extends StatelessWidget {
  final String name, time, description;
  final int comments, likes;
  final double width;
  final Image image;
  SinglePost(
      {this.comments,
      this.description,
      this.image,
      this.likes,
      this.name,
      this.time,
      this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.account_circle),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name),
                  Text(time),
                ],
              ),
            ],
          ),
          Text(description),
          image,
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite_border,
              ),
              Container(
                height: 19,
                width: 35,
                child: SvgPicture.asset('assets/icons/chat.svg'),
              ),
            ],
          ),
          Container(
            width: width,
            child: Text(
              '$likes likes',
            ),
          ),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.black.withOpacity(0),
                context: context,
                isScrollControlled: true,
                builder: (context) => BottomCommentsSheetBuilder(),
              );
            },
            child: Container(
              width: width,
              child: Text('View all $comments comments'),
            ),
          ),
        ],
      ),
    );
  }
}
