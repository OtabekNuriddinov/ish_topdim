import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({super.key, required this.onChanged});

  final Function(int) onChanged;

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.onChanged(0);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 85,
      color: Colors.transparent,
      child: Card(
        elevation: 10,
        margin: EdgeInsets.zero,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.centerRight,
              image: AssetImage(
                _selectedIndex == 4 ? "assets/images/search_blue.png":"assets/images/search.png" ,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (index) {
                IconData icon;
                switch (index) {
                  case 0:
                    icon = CupertinoIcons.house_fill;
                    break;
                  case 1:
                    icon = CupertinoIcons.bookmark_solid;
                    break;
                  case 2:
                    icon = CupertinoIcons.add;
                    break;
                  case 3:
                    icon = Icons.sms_rounded;
                    break;
                  case 4:
                    icon = Icons.person;
                    break;
                  default:
                    icon = Icons.circle;
                }

                final isSelected = _selectedIndex == index;

                return TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 1.0, end: isSelected ? 1.3 : 1.0),
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  builder: (context, scale, child) {
                    return Transform.scale(
                      scale: scale,
                      child: IconButton(
                        icon: Icon(
                          icon,
                          color: isSelected ? Colors.orange : Colors.grey,
                          size: 30,
                        ),
                        onPressed: () => _onItemTapped(index),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
