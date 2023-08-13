import 'package:flutter/material.dart';


class MainButton extends StatelessWidget {
	final String title;
	final String subtitle;
  	final Function() onPressed;
	final bool isWhite;


	const MainButton({super.key, required this.title, required this.subtitle, required this.onPressed, this.isWhite = false});

	@override
	Widget build(BuildContext context) {
		return Card(
			color: isWhite ? Colors.white : const Color(0xFF8AAAE5),
			elevation: 8,
			margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
			child: ListTile(
				contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
				leading: Container(
					padding: const EdgeInsets.only(right: 12.0),
					decoration: BoxDecoration(
						border: Border(
							right: BorderSide(width: 1.0, color: isWhite ? const Color(0xFF8AAAE5) : Colors.white24))),
					child: Icon(
						Icons.graphic_eq, 
						color: isWhite ? const Color(0xFF8AAAE5) : Colors.white,
					),
				),
				title: Text(
					title,
					style: TextStyle(
						color: isWhite ? const Color(0xFF8AAAE5) : Colors.white, 
						fontWeight: FontWeight.bold
					),
					overflow: TextOverflow.ellipsis,
				),
				subtitle: Text(
					subtitle, 
					style: TextStyle(color: isWhite ? const Color(0xFF8AAAE5) : Colors.white,),
					overflow: TextOverflow.ellipsis,
				),
				trailing: Icon(
					Icons.keyboard_arrow_right, 
					color: isWhite ? const Color(0xFF8AAAE5) : Colors.white, 
					size: 30.0
				),
				onTap: onPressed,
			)
		);
  	}
}