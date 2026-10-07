import 'package:flutter/material.dart';

class AnimatedCounter extends StatefulWidget {
  final int initialValue;
  final int maxValue;

  const AnimatedCounter({Key? key, this.initialValue = 0, this.maxValue = 10}) : super(key: key);

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> with SingleTickerProviderStateMixin {
  late int _count;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _count = widget.initialValue;
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 150));
  }

  void _increment() {
    if (_count < widget.maxValue) {
      setState(() => _count++);
      _controller.forward().then((_) => _controller.reverse());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleTransition(
          scale: Tween<double>(begin: 1.0, end: 1.3).animate(_controller),
          child: Text('$_count', style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
        ),
        ElevatedButton(onPressed: _increment, child: const Text('Збільшити')),
      ],
    );
  }
}
