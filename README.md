# **MOBILE BOOK CATALOG**

Platform Based Programming lecture Flutter assignment

### Assignment 7

<details>
<summary>Main differences between stateless and stateful widget</summary>

- **Stateful widget** : dynamic and usually used for mutable state like data changes or content that react to user interaction, flexible for dynamic data but less efficient since it requires state management, example of dynamic contents are forms and pages that display dynamic data.

- **Stateless widget** : static and doesn't hold mutable state, new instance is needed when update wanted, more efficient because it doesn't maintain state, example of static contents that doesn't change are icons and labels.
    
</details>

<details>
<summary>All widgets that used in this assignment</summary>
    
- **AppBar** : bar on the top of the screen to show title of the application
- **BookCard** : stateless custom widget to display book items
- **InkWell** : widget to make the area interactive and responsive, in this assignment is to react and show snackbar when the bookcard tapped
- **SnackBar** : pop up temporary message on the bottom of the screen when bookcard is tapped
- **SingleChildScrollView** : wrap content and make it into a single widget that can be scrolled
- **Scaffold** : basic Material Design visual layout structure and provide API for showing snackbars
- **Material** : provides Material Design visual structure to give visual style for the app
</details>

<details>
<summary>Step-by-step</summary>
    
1. Make new flutter project by running `flutter create book_catalog`
2. Make `menu.dart` inside `book_catalog/lib` then add `import 'package:flutter/material.dart';` to use Flutter Material widget
3. Delete `MyHomePage` class and `_MyHomePageState` class in `main.dart` then import `import 'package:book_catalog/menu.dart';` to import MyHomePage class from `menu.dart`
4. Change scheme color to `Colors.teal.shade700` to change application theme color
5. Replace `home: const MyHomePage(title: 'Flutter Demo Home Page'),` with `home: MyHomePage(),`
6. Add ShopItem class to define type of name and icon of item
    ```
    class ShopItem {
      final String name;
      final IconData icon;

      ShopItem(this.name, this.icon);
    }
    ```
7. Make MyHomePage class extending StatelessWidget
8. Add this following code to add items with names and icons defined
    ```
    final List<ShopItem> items = [
      ShopItem("Lihat Item", Icons.checklist),
      ShopItem("Tambah Item", Icons.add_shopping_cart),
      ShopItem("Logout", Icons.logout),
    ];
    ```
9. Then overwrite the Widget build to return appbar, title, and items' cards
10. Make `ShopCard` class extending `StatelessWidget` to define the snackbar when the card tapped
11. Change the styling of appbar, card, and text color
</details>

### Assignment 8

<details>
<summary>Difference between Navigator.push() and Navigator.pushReplacement() followed by the example</summary>
    
- **`Navigator.push()`**
Switch screen to new route and adding the new page to stack of routes managed by Navigator. By adding to the stack, user can navigate back to the previous page using back button, for example:
    
    ```
    Navigator.push(context, MaterialPageRoute(builder: (context) => const BookFormPage()));
    ```

    In this assignment, `Navigator.push()` is used on the list tile of left drawer to switch to form page. It's used so the user can switch back to the Home Page by using back button instead of quitting the application.

- **`Navigator.pushReplacement()`**
Switch screen to new route and replace the current route on the stack with the new route. By replacing the route, user can't navigate back to the previous page, for example:

    ```
    Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
    ```

    In the list tile of left drawer, `Navigator.pushReplacement()` is used for Home page menu to prevent navigating back to other screens and make sure the Home Page is the main screen of user. It also makes the user experience and application flow better. For example, by navigating from Book Form page to Home Page by the drawer then navigating back, the screen shows up Home Page with the drawer opened instead of the Book Form page.
</details>
    
<details>
<summary>Layout widget in Flutter and their respective usage contexts</summary>
    
1. **Container** : contain other widgets and where to apply styling properties such as padding, margin, etc. It's used to wrap individual widgets with it's own layout behavior. Container is also usually used to create more complex layout containing widgets with decoration.
2. **Column** : widget that displays it's children in a single vertical array. It's usually used to create vertical lists or menus.
3. **GridView** : widget that creates a scrollable 2D arrays of widgets. It's used to diplay grid of items, in this assignment it's used to display cards.
4. **ListView** : provide scrollable list of widget arranged linearly. Used to display large number of children that might not fit the screen for example a menu with lots of products.
5. **Expanded** : widget that expands a child of widget (Row, Column, Flex) so that the child take up the remaining available space. Used to create flexible layouts and distribute available space among multiple child widgets.
6. **Stack** : widget that allows overlaying multiple widgets on top of each other. Used to create complex layouts where widgets or UI need to be positioned relative to one another.
7. **Row** : widget that displays it's children in a single horizontal array. Usually used to create horizontal lists or navigatior bar.
</details>
    
<details>
<summary>Form input elements used in this assignment and the why it's used</summary> 

1. **TextFormField** : associated to each input form field and capture input of name, amount, and description. TextFormField is also followed by `decoration` to show message of expected input, `onChanged` to update input changed, and `validator` to show message when input is invalid.
2. **ElevatedButton** : used to validate input, reset form, save input, and return AlertDialog.
3. **AlertDialog** : used to display the form data by pop-up dialog and show data inputted.
</details>
    
<details>
<summary>How clean architecture is implemented</summary>

- Clean architecture is done by doing separation of concerns and organizing codebase in layers. Generally, it's implemented by identifying layers, defining dependencies between layers, separating UI and business logic, writing unit test, implementing use case, etc. In this assignment, simple clean architecture implemented with the use of `screens` and `widgets` directories. `screens` directory is used to organize dart file of application pages while `widgets` is to organize file of shop cards and left drawer. Cleaner architecture makes it easier to test, modify, and manage application.
    
</details>    

<details>
<summary>Step by step</summary>
    
1. Create `left_drawer.dart` then make `LeftDrawer` class extending StatelessWidget
2. Add `ListTile` of `Halaman Utama` and `Tambah Produk` in `LeftDrawer` routing
3. Add drawer header in `LeftDrawer` class then decorate the text with aligment and style
4. import drawer widget in `menu.dart` then add the drawer in widget build by `drawer: const LeftDrawer()`
5. Create new `book_form.dart` then make `ShopFormPage` and `_ShopFormPageState` class
6. Make appbar of form page, import drawer page then add the drawer on widget build
7. Make `_formKey` variable as a handler of form state, validation, and storage then add it on form body
8. Create `_name`, `_price`, and `_description` variables to store input from each field
9. Create `Column` widget as a child and 3 `TextFormField` widget of name, amount, and description input wrapped in `Padding` as the child of `Column`
10. Add `onChanged` to get input changes and `validator` to show message if the input is invalid for each input form
11. Create `ElevatedButton` in `Padding` in `Align` added with style of button color, onPressed to validate input, and text to show the button text
12. Add `AlertDialog()` in `showDialog()` if the input is valid in onPressed to display name, amount, and description inputted by user when the user click the button
13. Add route to BookFormPage with `Navigator.push()` in `Tambah Produk` of the left drawer and onTap of shop card by checking if the card name is `Tambah Buku`
14. Redesign the application by changing icon and background colors
15. Refactor the file by moving `book_form.dart` and `menu.dart` to `screens` directory, create `shop_card.dart` in `widgets` directory and move `ShopItem` and `ShopCard` class to it
16. Accomplish bonus by making Book model in `book_model.dart` inside `models` directory and create `daftar_buku.dart` inside `screens` directory
17. In `daftar_buku.dart`, create `BookListPage` class that return ListTile of text of book name, amount, and description (for this assignment, the books are still static defined when routing to daftar buku page)
18. Add `Daftar Buku` ListTile inside left drawer widget and add routing to daftar buku page inside the list tile and `Lihat Buku` shop card
</details>