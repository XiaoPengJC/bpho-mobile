import 'package:astroverse/widget/MainButton.dart';
import 'package:astroverse/widget/PlannetButton.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';



class TaskThreePage extends StatefulWidget {
	const TaskThreePage({super.key, required this.title});

	final String title;
	final String description = 'Create a 2D animation of the orbits of the planets.';

	@override
	State<TaskThreePage> createState() => _TaskThreePageState();
}

class _TaskThreePageState extends State<TaskThreePage> {

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: const Color(0xFF8AAAE5),
			appBar: AppBar(
				backgroundColor: Theme.of(context).colorScheme.inversePrimary,
				title: Text(widget.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
			),
			body: Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.spaceEvenly,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
						Container(
							margin: const EdgeInsets.all(10),
							decoration: BoxDecoration(
								color: Theme.of(context).colorScheme.inversePrimary,
								borderRadius: const BorderRadius.all(Radius.circular(20))
							),
							padding: const EdgeInsets.all(20),
							child: Text(
								widget.description, 
								style: const TextStyle(
									fontWeight: FontWeight.bold, 
									fontSize: 16,
									color:  Colors.white
								), 
								textAlign: TextAlign.center
							)
						),
						ListView(
							scrollDirection: Axis.vertical,
							shrinkWrap: true,
							children: <Widget>[
								MainButton(
									title: 'Inner Planets',
									subtitle: 'Mercury, Venus, Earth, Mars',
									onPressed: () => Navigator.push(
										context,
										MaterialPageRoute(builder: (context) => const TaskThreeInnerPage(title: 'Inner Planets')),
									),
									isWhite: true,
								),
								MainButton(
									title: 'Outer Planets',
									subtitle: 'Jupiter, Saturn, Uranus, Neptune, Pluto',
									onPressed: () => Navigator.push(
										context,
										MaterialPageRoute(builder: (context) => const TaskThreeOuterPage(title: 'Outer Planets')),
									), 
									isWhite: true,
								)
							],
						)
					],
				),
			)
		);
	}
}


class TaskThreeInnerPage extends StatefulWidget {
	const TaskThreeInnerPage({super.key, required this.title});

	final String title;
	final description = 'Create a 2D animation of the orbits of the inner planets.';

	@override
	State<TaskThreeInnerPage> createState() => _TaskThreeInnerPageState();
}

class _TaskThreeInnerPageState extends State<TaskThreeInnerPage> {

	// dictionary storing checked state of each planet
	Map<String, bool> checked = {
		'Mercury': false,
		'Venus': false,
		'Earth': false,
		'Mars': false
	};

	bool checkIfAnyPlanetIsChecked() {
		for (bool value in checked.values) {
			if (value) {
				return true;
			}
		}
		return false;
	}

	String generateUrl() {
		String url = 'http://18.134.43.174/orbit_animation?is3d=false';
		for (String planet in checked.keys) {
			if (checked[planet]!) {
				url += '&planet=$planet';
			}
		}
		return url;
	}

	void _onChecked(String planet) {
		setState(() {
			checked[planet] = !checked[planet]!;
		});		
	}

	void _computeButtonOnPressed() {
		if (checkIfAnyPlanetIsChecked()) {
			setState(() {
				showCupertinoModalBottomSheet(
					elevation: 10,
					useRootNavigator: false,
					isDismissible: true,
					enableDrag: true,
					expand: false,
					duration: const Duration(milliseconds: 600),
					context: context,
					builder: (context) => Stack(
						children: <Widget>[
							Image.network(generateUrl())
						],
					)
				);
			});
		}
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: const Color(0xFF8AAAE5),
			appBar: AppBar(
				backgroundColor: Theme.of(context).colorScheme.inversePrimary,
				title: Text(widget.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
			),
			body: Center(
				child: SingleChildScrollView(
					child: Column(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>[
							Container(
								margin: const EdgeInsets.all(10),
								decoration: BoxDecoration(
									color: Theme.of(context).colorScheme.inversePrimary,
									borderRadius: const BorderRadius.all(Radius.circular(20))
								),
								padding: const EdgeInsets.all(20),
								child: Text(
									widget.description, 
									style: const TextStyle(
										fontWeight: FontWeight.bold, 
										fontSize: 16,
										color:  Colors.white
									), 
									textAlign: TextAlign.center
								)
							),
							const SizedBox(height: 30),
							Column(
								children: <Widget>[
									PlanetButton(
										planet: 'Mercury',
										onPressed: (planet) => _onChecked(planet),
										isWhite: true,
										imagePath: "assets/planets/mercury.png",
									),
									PlanetButton(
										planet: 'Venus',
										onPressed: (planet) => _onChecked(planet),
										isWhite: true,
										imagePath: "assets/planets/venus.png",
									),
									PlanetButton(
										planet: 'Earth',
										onPressed: (planet) => _onChecked(planet),
										isWhite: true,
										imagePath: "assets/planets/earth.png",
									),
									PlanetButton(
										planet: 'Mars',
										onPressed: (planet) => _onChecked(planet),
										isWhite: true,
										imagePath: "assets/planets/mars.png",
									),
									const SizedBox(height: 20),
									checkIfAnyPlanetIsChecked() ? const Text(" ") : const Text('Please select at least one planet', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),

								],
							),
							// Text to display if no planet is selected
							ElevatedButton(onPressed: _computeButtonOnPressed, child: const Text('Compute Graph')),
							const SizedBox(height: 50)
						],
					)
				)
			)
		);
	}
}


class TaskThreeOuterPage extends StatefulWidget {
	const TaskThreeOuterPage({super.key, required this.title});

	final String title;
	final description = 'Create a 2D animation of the orbits of the outer planets plus Pluto.';

	@override
	State<TaskThreeOuterPage> createState() => _TaskThreeOuterPageState();
}

class _TaskThreeOuterPageState extends State<TaskThreeOuterPage> {

	// dictionary storing checked state of each planet
	Map<String, bool> checked = {
		'Jupiter': false,
		'Saturn': false,
		'Neptune': false,
		'Uranus': false,
		'Pluto': false
	};

	bool checkIfAnyPlanetIsChecked() {
		for (bool value in checked.values) {
			if (value) {
				return true;
			}
		}
		return false;
	}

	String generateUrl() {
		String url = 'http://18.134.43.174/orbit_animation?is3d=false';
		for (String planet in checked.keys) {
			if (checked[planet]!) {
				url += '&planet=$planet';
			}
		}
		return url;
	}

	void _onChecked(String planet) {
		setState(() {
			checked[planet] = !checked[planet]!;
		});		
	}

	void _computeButtonOnPressed() {
		if (checkIfAnyPlanetIsChecked()) {
			setState(() {
				showCupertinoModalBottomSheet(
					elevation: 10,
					useRootNavigator: false,
					isDismissible: true,
					enableDrag: true,
					expand: false,
					duration: const Duration(milliseconds: 600),
					context: context,
					builder: (context) => Stack(
						children: <Widget>[
							Image.network(generateUrl())
						],
					)
				);
			});
		}
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: const Color(0xFF8AAAE5),
			appBar: AppBar(
				backgroundColor: Theme.of(context).colorScheme.inversePrimary,
				title: Text(widget.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
			),
			body: Center(
				child: SingleChildScrollView(
					child: Column(
						mainAxisAlignment: MainAxisAlignment.spaceEvenly,
						crossAxisAlignment: CrossAxisAlignment.center,
						children: <Widget>[
							Container(
								margin: const EdgeInsets.all(10),
								decoration: BoxDecoration(
									color: Theme.of(context).colorScheme.inversePrimary,
									borderRadius: const BorderRadius.all(Radius.circular(20))
								),
								padding: const EdgeInsets.all(20),
								child: Text(
									widget.description, 
									style: const TextStyle(
										fontWeight: FontWeight.bold, 
										fontSize: 16,
										color:  Colors.white
									), 
									textAlign: TextAlign.center
								)
							),
							const SizedBox(height: 30),
							Column(
								children: <Widget>[
									PlanetButton(
										planet: 'Jupiter',
										onPressed: (planet) => _onChecked(planet),
										isWhite: true,
										imagePath: "assets/planets/jupiter.png",
									),
									PlanetButton(
										planet: 'Saturn',
										onPressed: (planet) => _onChecked(planet),
										isWhite: true,
										imagePath: "assets/planets/saturn.png",
									),
									PlanetButton(
										planet: 'Neptune',
										onPressed: (planet) => _onChecked(planet),
										isWhite: true,
										imagePath: "assets/planets/neptune.png",
									),
									PlanetButton(
										planet: 'Uranus',
										onPressed: (planet) => _onChecked(planet),
										isWhite: true,
										imagePath: "assets/planets/uranus.png",
									),
									PlanetButton(
										planet: 'Pluto',
										onPressed: (planet) => _onChecked(planet),
										isWhite: true,
										imagePath: "assets/planets/pluto.png",
									),
									const SizedBox(height: 20),
									checkIfAnyPlanetIsChecked() ? const Text(" ") : const Text('Please select at least one planet', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),

								],
							),
							// Text to display if no planet is selected
							ElevatedButton(onPressed: _computeButtonOnPressed, child: const Text('Compute Graph')),
							const SizedBox(height: 50)
						],
					)
				)
			)
		);
	}
}