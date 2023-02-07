import 'package:flutter/material.dart';
import 'package:flutter_custom_scroll_view_sample/dragable_home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: "Draggable Home",
        home: HomePage(),
      );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      appBarColor: Colors.teal,
      backgroundColor: Colors.white,
      leading: const Icon(Icons.arrow_back_ios),
      title: const Text("Draggable Home"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      headerWidget: headerWidget(context),
      headerBottomBar: headerBottomBar(),
      body: body,
    );
  }

  List<Widget> get body {
    return [
      ListView.builder(
        padding: const EdgeInsets.only(top: 0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (context, index) => Card(
          color: Colors.white70,
          child: ListTile(
            leading: CircleAvatar(
              child: Text("$index"),
            ),
            title: const Text("Title"),
            subtitle: const Text("Subtitile"),
          ),
        ),
      ),
    ];
  }

  Row headerBottomBar() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ],
    );
  }

  Container headerWidget(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          "Title",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white70),
        ),
      ),
    );
  }
}
