import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_now/data/database/dbhelper.dart';
import 'package:todo_now/presentation/pages/addtopage_screen.dart';
import 'package:todo_now/presentation/widgets/todocard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dateFormat = DateFormat('EEEE dd');
    final formattedDate = dateFormat.format(now);

    final dbHelper = DatabaseHelper.instance;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: const Text(
            "Today's schedule",
            style: TextStyle(
                color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(35),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 22.0),
                child: Text(
                  formattedDate,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 27,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black87,
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  height: 20,
                  width: 50,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: const Icon(
                    size: 32,
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
                label: '',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AddTodoPage()));
                  },
                  child: Container(
                    height: 50,
                    width: 52,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xffff9999),
                          Color(0xffff5050),
                          Color(0xffff4500),
                        ],
                      ),
                    ),
                    child: const Icon(
                      size: 32,
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                label: '',
                backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Container(
                  height: 20,
                  width: 50,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: const Icon(
                    size: 32,
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
                label: '',
                backgroundColor: Colors.red),
          ],
        ),
        body: FutureBuilder(
          future: dbHelper.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  final task = snapshot.data![index];
                  IconData iconData = Icons.question_mark;
                  Color iconColor = Colors.black;
                  final category = task.category.toString();
                  final type = task.type.toString();
                  final title = task.title.toString();
                  final des = task.description.toString();
                  print(category);
                  print(type);
                  print(title);
                  print(des);
                  switch (category) {
                    case "Work":
                      iconData = Icons.work;

                      break;
                    case "Errands":
                      iconData = Icons.directions_walk_outlined;

                      break;
                    case "Housework":
                      iconData = Icons.house;

                      break;
                    case "Grocery":
                      iconData = Icons.local_grocery_store;

                      break;
                    case "GYM":
                      iconData = Icons.fitness_center;

                      break;
                    case "School":
                      iconData = Icons.school;

                      break;
                    default:
                      iconData = Icons.question_mark;
                      iconColor = Colors.white;
                  }

                  switch (type) {
                    case "Important":
                      iconColor = Colors.red;
                      break;
                    case "Planned":
                      iconColor = Colors.black;
                      break;

                    default:
                      iconColor = Colors.white;
                  }
                  return InkWell(
                    onTap: () {},
                    child: TodoCard(
                      title: title,
                      check: true,
                      time: "11 PM",
                      iconBgColor: Colors.white,
                      iconColor: iconColor,
                      iconData: iconData,
                    ),
                  );
                }),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
