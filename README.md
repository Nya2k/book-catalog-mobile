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
6. Add BookItem class to define type of name and icon of item
    ```
    class BookItem {
      final String name;
      final IconData icon;

      BookItem(this.name, this.icon);
    }
    ```
7. Make MyHomePage class extending StatelessWidget
8. Add this following code to add items with names and icons defined
    ```
    final List<BookItem> items = [
      BookItem("Lihat Item", Icons.checklist),
      BookItem("Tambah Item", Icons.add_shopping_cart),
      BookItem("Logout", Icons.logout),
    ];
    ```
9. Then overwrite the Widget build to return appbar, title, and items' cards
10. Make `BookCard` class extending `StatelessWidget` to define the snackbar when the card tapped
11. Change the styling of appbar, card, and text color
</details>