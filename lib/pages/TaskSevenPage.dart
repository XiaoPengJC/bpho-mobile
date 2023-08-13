import 'package:astroverse/widget/PlannetButton.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class TaskSevenPage extends StatefulWidget {
	const TaskSevenPage({super.key, required this.title});

	final String title;
	final description = 'Use your orbital models to plot the 2D orbits of the other bodies in the solar system, with a chosen object (e.g. Earth) at a fixed position at the origin of a Cartesian coordinate system. i.e. choose a coordinate system where your chosen object is at (0,0,0).';

	@override
	State<TaskSevenPage> createState() => _TaskSevenPageState();
}

class _TaskSevenPageState extends State<TaskSevenPage> {

	// dictionary storing checked state of each planet
	Map<String, bool> checked = {
    'Mercury': false,
    'Venus': false,
    'Earth': false,
    'Mars': false,
		'Jupiter': false,
		'Saturn': false,
		'Uranus': false,
		'Neptune': false,
		'Pluto': false
	};

  var dropdownvalue = "Earth";
  var items = ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune', 'Pluto'];

	bool checkIfAnyPlanetIsChecked() {
    for (String planet in checked.keys) {
      if (checked[planet]!) {
        return true;
      }
    }
    return false;
  }

	String generateUrl() {
		String url = 'http://18.134.43.174/imaginary_orbit?is3d=false';
		url += '&centre=$dropdownvalue';
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
						Row(
							mainAxisAlignment: MainAxisAlignment.spaceEvenly,
							children: [
								const Text(
									'Centre: ',
									style: TextStyle(
										fontWeight: FontWeight.bold, 
										fontSize: 16,
										color:  Colors.white
									), 
								),
								DropdownButton(
									value: dropdownvalue,	
									icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
									style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
									borderRadius: BorderRadius.circular(20),
									underline: Container(
										height: 2,
										color: Colors.white,
									),
									dropdownColor: Theme.of(context).colorScheme.inversePrimary,
									items: items.map((String items) {
										return DropdownMenuItem(
										value: items,
										child: Text(items),
										);
									}).toList(),
									onChanged: (String? newValue) { 
										setState(() {
										dropdownvalue = newValue!;
										});
									},
								),
							],
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
									imagePath: "assets/planets/uranus.png",
								),
								PlanetButton(
									planet: 'Uranus',
									onPressed: (planet) => _onChecked(planet),
									isWhite: true,
									imagePath: "assets/planets/neptune.png",
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
		);
	}
}