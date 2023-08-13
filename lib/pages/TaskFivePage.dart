import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class TaskFivePage extends StatefulWidget {
	const TaskFivePage({super.key, required this.title});

	final String title;
	final description = "Use Simpson’s numeric integration method to determine how orbital time varies with polar angle. A contrast is shown on how polar angle varies with time for Pluto, and compared to a circular motion example with the same 248.348 year period.";

	@override
	State<TaskFivePage> createState() => _TaskFivePageState();
}

class _TaskFivePageState extends State<TaskFivePage> {

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
						Image.network('http://18.134.43.174/angle_vs_time?planet=Pluto')
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
							ElevatedButton(
								onPressed: _computeButtonOnPressed, child: const Text('Compute Graph')
							),
							const SizedBox(height: 50)
						],
					)
				)
			)
		);
	}
}