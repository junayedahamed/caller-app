import 'package:flutter/material.dart';

class DialButton extends StatefulWidget {
  final String digit;
  final String subtitle;
  final VoidCallback onTap;

  const DialButton({
    super.key,
    required this.digit,
    required this.subtitle,
    required this.onTap,
  });

  @override
  State<DialButton> createState() => _DialButtonState();
}

class _DialButtonState extends State<DialButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 100),
          lowerBound: 0.0,
          upperBound: 0.1,
        )..addListener(() {
          setState(() {});
        });
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.88,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      onTap: widget.onTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark
                ? const Color(0xFF4F378B).withValues(alpha: 0.6)
                : const Color(0xFFEADDFF),
            border: Border.all(
              color: isDark
                  ? colorScheme.primaryContainer.withValues(alpha: 0.3)
                  : colorScheme.outline.withValues(alpha: 0.2),
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.digit,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                  color: isDark
                      ? const Color(0xFFD0BCFF)
                      : const Color(0xFF381E72),
                ),
              ),
              if (widget.subtitle.isNotEmpty)
                Text(
                  widget.subtitle,
                  style: TextStyle(
                    fontSize: 9,
                    letterSpacing: 1,
                    color: isDark
                        ? const Color(0xFFB39DDB).withOpacity(0.9)
                        : const Color(0xFF49454E),
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
