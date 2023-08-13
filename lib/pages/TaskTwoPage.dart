import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class TaskTwoPage extends StatefulWidget {
	const TaskTwoPage({super.key, required this.title});

	final String title;
	final description = "Compute and accurately plot elliptical orbits of the five inner planets. Then using a larger scale, plot the outer planet orbits.";

	@override
	State<TaskTwoPage> createState() => _TaskTwoPageState();
}

class _TaskTwoPageState extends State<TaskTwoPage> {

	void _computeInnerButtonOnPressed() {
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
						Image.network('http://18.134.43.174/orbit_image?is3d=false&planet=Mercury&planet=Venus&planet=Earth')
					],
				)
			);
		});
	}

	void _computeOuterButtonOnPressed() {
		setState(() {
			showCupertinoModalBottomSheet(
				elevation: 10,
				useRootNavigator: true,
				isDismissible: true,
				expand: false,
				context: context,
				builder: (context) => Stack(
					children: <Widget>[
						Image.network('http://18.134.43.174/orbit_image?is3d=false&planet=Jupiter&planet=Saturn&planet=Uranus&planet=Neptune&planet=Pluto')
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
							Column(
								mainAxisAlignment: MainAxisAlignment.spaceEvenly,
								children: <Widget>[
									ElevatedButton(onPressed: _computeInnerButtonOnPressed, child: const Text('Compute Inner Planet Graph')),
									ElevatedButton(onPressed: _computeOuterButtonOnPressed, child: const Text('Compute Outer Planet Graph'))
								],
							),
							const SizedBox(height: 50)
						],
					)
				)
			)
		);
	}
}