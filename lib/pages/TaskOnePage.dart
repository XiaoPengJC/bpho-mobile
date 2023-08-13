import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class TaskOnePage extends StatefulWidget {
	const TaskOnePage({super.key, required this.title});

	final String title;
	final description = "Using the Solar System parameters, we want to verify that the square of orbital period is proportional to the cube of the orbital semi-major axis. If units of years for time and Astronomical Units (AU) for distance are used, we also want to show that the constant of proportionality is very close to unity for the Solar System.";

	@override
	State<TaskOnePage> createState() => _TaskOnePageState();
}

class _TaskOnePageState extends State<TaskOnePage> {

	void _computeButtonOnPressed() {
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
						Image.network('http://18.134.43.174/kepler_correlation')
					],
				)
			);
		});
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
							ElevatedButton(onPressed: _computeButtonOnPressed, child: const Text('Compute Graph')),
							const SizedBox(height: 50)
						],
					)
				)
			)
		);
	}
}