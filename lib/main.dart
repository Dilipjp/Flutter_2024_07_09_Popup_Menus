import 'package:flutter/material.dart';

enum Options {
  search,
  upload,
  copy,
  exit
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _popupMenuItemIndex = 0;
  Color _changeColorAccordingToMenuItem = Colors.red;
  double appBarHeight = 0.0; // Updated to double type

  @override
  void initState() {
    super.initState();
    appBarHeight = AppBar().preferredSize.height;
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'Popup Menus',
        style: TextStyle(color: Colors.white, fontSize: 16.0),
      ),
      actions: [
        PopupMenuButton(
          onSelected: (value) {
            _onMenuItemSelected(value as int);
          },
          offset: Offset(0.0, appBarHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          itemBuilder: (ctx) =>
          [
            _buildPopupMenuItem('Search', Icons.search, Options.search.index),
            _buildPopupMenuItem('Upload', Icons.upload, Options.upload.index),
            _buildPopupMenuItem('Copy', Icons.copy, Options.copy.index),
            _buildPopupMenuItem('Exit', Icons.exit_to_app, Options.exit.index),
          ],
        )
      ],
    );
  }

  PopupMenuItem<int> _buildPopupMenuItem(String title, IconData iconData,
      int position) {
    return PopupMenuItem<int>(
      value: position,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            iconData,
            color: Colors.black,
          ),
          Text(title),
        ],
      ),
    );
  }

  _onMenuItemSelected(int value) {
    setState(() {
      _popupMenuItemIndex = value;
      if (value == Options.search.index) {
        _changeColorAccordingToMenuItem = Colors.red;
      } else if (value == Options.upload.index) {
        _changeColorAccordingToMenuItem = Colors.green;
      } else if (value == Options.copy.index) {
        _changeColorAccordingToMenuItem = Colors.blue;
      } else {
        _changeColorAccordingToMenuItem = Colors.purple;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          color: _changeColorAccordingToMenuItem,
        ),
      ),
    );
  }
}