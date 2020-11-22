import 'package:cook_chef/Screens/ViewRecipesPage.dart';
import 'package:flutter/material.dart';

class MakeRecipesPage extends StatefulWidget {
  static const String id = 'make_recipes_page';
  @override
  _MakeRecipesPageState createState() => _MakeRecipesPageState();
}

class _MakeRecipesPageState extends State<MakeRecipesPage> {
  @override
  Widget build(BuildContext context) {
    final RecipeArgument args = ModalRoute.of(context).settings.arguments;
    //TODO: here is one more arg of list in a list 0 wala ingredients aur 1 wala steps
    print(args.ingredientAndSteps[0]); //for ingredients List
    print(args.ingredientAndSteps[1]); // steps List
    /* This is how I was thinking of adding steps and ingredients */
    String ingredients = '2 cups white sugar\n1 1⁄4 cups vegetable oil\n'
        '1 teaspoon vanilla extract\n2 cups canned pumpkin'
        '\n4 eggs\n2 cups all-purpose flour\n'
        '3 teaspoons baking powder\n'
        '2 teaspoons baking soda\n'
        '1⁄4 teaspoon salt\n'
        '2 teaspoons ground cinnamon\n'
        '1 cup chopped walnuts (Optional)';
    String steps = 'Step 1\nPreheat oven to 350 degrees F (175 degrees C).'
        ' Grease and flour a 12x18 inch pan. Sift together'
        ' the flour, baking powder, baking soda, salt and'
        ' cinnamon. Set aside.\n\nStep 2\nIn a large bowl'
        ' combine sugar and oil. Blend in vanilla and '
        'pumpkin, then beat in eggs one at a time. '
        'Gradually beat in flour mixture. Stir in nuts. '
        'Spread batter into prepared 12x18 inch pan.\n\n'
        'Step 3\nBake in the preheated oven for 30 minutes,'
        ' or until a toothpick inserted into the centre of '
        'the cake comes out clean. Allow to cool.';

    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('CookChef'),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Text('Pumpkin Cake'),
          Image.asset('assets/images/apricot.jpeg'),
          Text('Ingredients'),
          Container(
            margin:
                EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0, top: 5.0),
            height: 1,
            width: _width,
            color: Colors.grey,
          ),
          Container(
            child: Text(ingredients),
          ),
          Text('Direction'),
          Container(
            margin:
                EdgeInsets.only(bottom: 10.0, left: 5.0, right: 5.0, top: 5.0),
            height: 1,
            width: _width,
            color: Colors.grey,
          ),
          Container(
            child: Text(steps),
          ),
        ],
      ),
    );
  }
}
// Beet Root Rice could be just the <b>gluten free</b> recipe you've been looking for. For <b>32 cents per serving</b>, this recipe <b>covers 6%</b> of your daily requirements of vitamins and minerals. One serving contains <b>119 calories</b>, <b>2g of protein</b>, and <b>8g of fat</b>. This recipe serves 8. This recipe from Foodista requires fried onions, salt, vegetable oil, and curry leaves. 1 person found this recipe to be scrumptious and satisfying. It works well as a side dish. From preparation to the plate, this recipe takes about <b>about 45 minutes</b>. With a spoonacular <b>score of 34%</b>, this dish is not so spectacular. <a href="https://spoonacular.com/recipes/beet-rice-garlicky-kale-bowls-with-beet-green-pesto-859868">Beet Rice & Garlicky Kale Bowls with Beet Green Pesto</a>, <a href="https://spoonacular.com/recipes/celery-root-and-beet-salad-91696">Celery Root and Beet Salad</a>, and <a href="https://spoonacular.com/recipes/crispy-root-vegetable-latkes-with-beet-puree-237328">Crispy Root Vegetable Latkes with Beet Puree</a> are very similar to this recipe.
