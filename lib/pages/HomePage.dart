import 'package:astroverse/pages/TaskEightPage.dart';
import 'package:astroverse/pages/TaskFivePage.dart';
import 'package:astroverse/pages/TaskFourPage.dart';
import 'package:astroverse/pages/TaskOnePage.dart';
import 'package:astroverse/pages/TaskSevenPage.dart';
import 'package:astroverse/pages/TaskSixPage.dart';
import 'package:astroverse/pages/TaskThreePage.dart';
import 'package:astroverse/pages/TaskTwoPage.dart';
import 'package:astroverse/widget/MainButton.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;


class HomePage extends StatefulWidget {
	const HomePage({super.key, required this.title});

	final String title;

	@override
	State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				backgroundColor: Theme.of(context).colorScheme.inversePrimary,
				title: Text(widget.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
			),
			body: Center(
				child: ListView(
					scrollDirection: Axis.vertical,
					shrinkWrap: true,
					children: <Widget>[
						MainButton(
							title: 'Task 1',
							subtitle: 'Kepler Correlation',
							onPressed: () => Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => const TaskOnePage(title: 'Task 1')),
							)
						),
						MainButton(
							title: 'Task 2',
							subtitle: 'Orbit Image',
							onPressed: () => Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => const TaskTwoPage(title: 'Task 2')),
							)
						),
						MainButton(
							title: 'Task 3',
							subtitle: '2D Orbit Animation',
							onPressed: () => Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => const TaskThreePage(title: 'Task 3')),
							)
						),
						MainButton(
							title: 'Task 4',
							subtitle: '3D Orbit Animation',
							onPressed: () => Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => const TaskFourPage(title: 'Task 4')),
							)
						),
						MainButton(
							title: 'Task 5',
							subtitle: 'Angle vs Time',
							onPressed: () => Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => const TaskFivePage(title: 'Task 5')),
							)
						),
						MainButton(
							title: 'Task 6',
							subtitle: 'Spinograph',
							onPressed: () => Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => const TaskSixPage(title: 'Task 6')),
							)
						),
						MainButton(
							title: 'Task 7',
							subtitle: '2D Imaginary Orbit',
							onPressed: () => Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => const TaskSevenPage(title: 'Task 7')),
							)
						),
						MainButton(
							title: 'Task 7B',
							subtitle: '3D Imaginary Orbit',
							onPressed: () => Navigator.push(
								context,
								MaterialPageRoute(builder: (context) => const TaskEightPage(title: 'Task 7B')),
							)
						),
						SizedBox(height: 50)
					],
				)
			)
		);
	}
}