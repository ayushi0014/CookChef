import 'package:cook_chef/Screens/MakeRecipePage.dart';
import 'package:cook_chef/Screens/SelectedIngredientsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'IncredientsPage.dart';
import 'AccountPage.dart';
import 'HomePage.dart';
import 'NotificationsPage.dart';
import 'package:cook_chef/Models/RecipeHandler.dart';

class ViewRecipesPage extends StatefulWidget {
  static const String id = 'view_recipes_page';
  @override
  _ViewRecipesPageState createState() => _ViewRecipesPageState();
}

int currentIndex = 1;
bool hasTapped = false;

final tabs = [
  HomePage(),
  RecipesPage(),
  NotificationsPage(),
  AccountPage(),
];

class _ViewRecipesPageState extends State<ViewRecipesPage> {
  RecipeHandler recipeHandler = RecipeHandler();
  @override
  Widget build(BuildContext context) {
    final RecipiesArguments args = ModalRoute.of(context).settings.arguments;
    //TODO: Read below line 0 per first object
    print(args.recipeList[0].recipeImageUrl);

    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: (currentIndex == 1)
          ? AppBar(
              automaticallyImplyLeading:
                  (!hasTapped || currentIndex == 1) ? true : false,
              title: Text('CookChef'),
              centerTitle: true,
            )
          : null,
      bottomNavigationBar: (currentIndex != 0)
          ? BottomNavigationBar(
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: currentIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: (currentIndex == 0)
                      ? Icon(Icons.home)
                      : SvgPicture.asset(
                          'assets/icons/home_outlined.svg',
                          height: 25,
                        ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/icons/chef.jpeg',
                    height: 22,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: (currentIndex != 2)
                      ? Icon(Icons.notifications_none)
                      : Icon(Icons.notifications),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: '',
                ),
              ],
              onTap: (index) {
                setState(() {
                  hasTapped = true;
                  currentIndex = index;
                });
              },
            )
          : null,
      body: (!hasTapped || currentIndex == 1)
          ? Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10.0),
                  width: _width,
                  child: Text(
                    'Recipes',
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(
                      6,
                      (index) => GestureDetector(
                        onTap: () async {
                          //TODO: write the id in below line instead of that number 433608 aur aage bhi args used kr rha hun
                          final ingredientsAndSteps =
                              await recipeHandler.recipeById(634793);
                          Navigator.pushNamed(context, MakeRecipesPage.id,
                              arguments: RecipeArgument(
                                  ingredientAndSteps: ingredientsAndSteps));
                        },
                        child: Column(
                          children: <Widget>[
                            Image.asset('assets/images/apricot.jpeg'),
                            Text('Apricot'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : tabs[currentIndex],
    );
  }
}

class RecipeArgument {
  List<List> ingredientAndSteps;
  RecipeArgument({this.ingredientAndSteps});
}