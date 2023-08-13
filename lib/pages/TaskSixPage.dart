import 'package:astroverse/widget/PlannetButton.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TaskSixPage extends StatefulWidget {
	const TaskSixPage({super.key, required this.title});

	final String title;
	final description = 'Choose a pair of planets and determine their orbits vs time. At fixed time intervals, draw a line between the planets and plot their positions. Keep going for 10 orbits of the outermost planet.';

	@override
	State<TaskSixPage> createState() => _TaskSixPageState();
}

class _TaskSixPageState extends State<TaskSixPage> {

	// dictionary storing checked state of each planet
	Map<String, bool> checked = {
    'Mercury': false,
    'Venus': false,
    'Earth': false,
    'Mars': false,
		'Jupiter': false,
		'Saturn': false,
		'Neptune': false,
		'Uranus': false,
		'Pluto': false
	};

	bool checkIfPlanetPairIsChecked() {
		int count = 0;
		for (String planet in checked.keys) {
			if (checked[planet]!) {
				count++;
			}
		}
		return count == 2;
	}

	String generateUrl() {
		String url = 'http://18.134.43.174/spinograph?';
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
		if (checkIfPlanetPairIsChecked()) {
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
			body: SingleChildScrollView(
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
								checkIfPlanetPairIsChecked() ? const Text(" ") : const Text('Please select exactly two planet', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),

							],
						),
						// Text to display if no planet is selected
						ElevatedButton(onPressed: _computeButtonOnPressed, child: const Text('Compute Graph')),
						const SizedBox(height: 50)
					],
				)
			)
		);
	}
}