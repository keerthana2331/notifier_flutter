import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_model.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade600, Colors.purple.shade700],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.mirror,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Counter App",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                  fontFamily: 'RobotoMono',
                  shadows: [
                    Shadow(
                      blurRadius: 20.0,
                      color: Colors.black,
                      offset: Offset(6.0, 6.0),
                    ),
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.blueAccent,
                      offset: Offset(-6.0, -6.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Consumer<CounterModel>(
                builder: (context, counterModel, child) {
                  return AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 160,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoMono',
                      shadows: [
                        Shadow(
                          blurRadius: 15.0,
                          color: Colors.black.withOpacity(0.6),
                          offset: Offset(6.0, 6.0),
                        ),
                        Shadow(
                          blurRadius: 15.0,
                          color: Colors.blueAccent.withOpacity(0.8),
                          offset: Offset(-6.0, -6.0),
                        ),
                      ],
                    ),
                    child: Transform.rotate(
                      angle: (counterModel.counter % 2 == 0) ? 0 : 0.1,
                      child: ScaleTransition(
                        scale: AlwaysStoppedAnimation(
                          counterModel.counter % 2 == 0 ? 1.0 : 1.1,
                        ),
                        child: Text(counterModel.counter.toString()),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNeumorphicButton(
                    icon: Icons.restore,
                    color1: Colors.grey[700]!,
                    color2: Colors.grey[600]!,
                    onPressed: () => context.read<CounterModel>().reset(),
                    scale: 1.1,
                  ),
                  const SizedBox(width: 20),
                  _buildNeumorphicButton(
                    icon: Icons.add,
                    color1: Colors.blueAccent,
                    color2: Colors.blue.shade600,
                    onPressed: () => context.read<CounterModel>().increment(),
                    scale: 1.2,
                  ),
                  const SizedBox(width: 20),
                  AnimatedOpacity(
                    opacity:
                        context.watch<CounterModel>().counter > 0 ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    child: _buildNeumorphicButton(
                      icon: Icons.remove,
                      color1: Colors.red.shade400,
                      color2: Colors.red.shade600,
                      onPressed: () => context.read<CounterModel>().decrement(),
                      scale: 1.1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNeumorphicButton({
    required IconData icon,
    required Color color1,
    required Color color2,
    required VoidCallback onPressed,
    double scale = 1.0,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20.0,
              spreadRadius: 2.0,
            ),
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              blurRadius: 15.0,
              offset: Offset(-10, -10),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Transform.scale(
          scale: scale,
          child: Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
