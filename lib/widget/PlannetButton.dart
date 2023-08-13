import 'package:flutter/material.dart';


class PlanetButton extends StatefulWidget {
  final String planet;
  final Function(String) onPressed;
	final bool isWhite;
  final bool isChecked;
  final String imagePath;

	const PlanetButton({super.key, required this.planet, required this.onPressed, this.isWhite = false, this.isChecked = false, required this.imagePath});

	@override
	State<PlanetButton> createState() => _PlanetButtonState();
}

class _PlanetButtonState extends State<PlanetButton> {

  bool _isChecked = false;

  @override
  void initState() {
    _isChecked = widget.isChecked;
    super.initState();
  }

  _onPressed() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onPressed(widget.planet);
  }

	@override
	Widget build(BuildContext context) {
		return Card(
			color: widget.isWhite ? Colors.white : const Color(0xFF8AAAE5),
			elevation: 8,
			margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
			child: ListTile(
				contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
				leading: Container(
					padding: const EdgeInsets.only(right: 12.0),
					decoration: BoxDecoration(
						border: Border(
							right: BorderSide(width: 1.0, color: widget.isWhite ? const Color(0xFF8AAAE5) : Colors.white24))),
					child: Image.asset(
            widget.imagePath,
            width: 50,
            height: 50,
            scale: 2,
          ),
        ),
				title: Text(
					widget.planet,
					style: TextStyle(
						color: widget.isWhite ? const Color(0xFF8AAAE5) : Colors.white, 
						fontWeight: FontWeight.bold
					),
					overflow: TextOverflow.ellipsis,
				),
				trailing: Icon(
					_isChecked ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded,
					color: widget.isWhite ? const Color(0xFF8AAAE5) : Colors.white, 
					size: 30.0
				),
				onTap: _onPressed,
			)
		);
  	}
}