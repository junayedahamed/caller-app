import 'package:flutter/material.dart';
import 'dial_button.dart';

class DialpadWidget extends StatelessWidget {
  final String phoneNumber;
  final Function(String) onDigitPressed;
  final VoidCallback onBackspace;
  final VoidCallback onCallPressed;
  final VoidCallback onLongBackPress;

  const DialpadWidget({
    super.key,
    required this.phoneNumber,
    required this.onDigitPressed,
    required this.onBackspace,
    required this.onCallPressed,
    required this.onLongBackPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (phoneNumber.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  const SizedBox(
                    width: 48,
                  ), // Spacer to balance the backspace button
                  Expanded(
                    child: Center(
                      child: AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOutCubic,
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Text(
                          phoneNumber,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onBackspace();
                    },
                    onLongPress: onLongBackPress,
                    child: SizedBox(
                      width: 48,
                      child: Icon(
                        Icons.backspace_outlined,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        size: 24,
                      ),
                      // onPressed: onBackspace,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                _buildDialRow(['1', '2', '3'], ['', 'ABC', 'DEF']),
                const SizedBox(height: 8),
                _buildDialRow(['4', '5', '6'], ['GHI', 'JKL', 'MNO']),
                const SizedBox(height: 8),
                _buildDialRow(['7', '8', '9'], ['PQRS', 'TUV', 'WXYZ']),
                const SizedBox(height: 8),
                _buildDialRow(['*', '0', '#'], ['', '+', '']),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_buildCallButton(context)],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDialRow(List<String> digits, List<String> letters) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(3, (index) {
        return DialButton(
          digit: digits[index],
          subtitle: letters[index],
          onTap: () => onDigitPressed(digits[index]),
        );
      }),
    );
  }

  Widget _buildCallButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF4F378B), const Color(0xFF633B48)]
              : [const Color(0xFFFFD8E4), const Color(0xFFFFB0CA)],
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? const Color(0xFF4F378B).withValues(alpha: 0.4)
                : const Color(0xFFFFD8E4).withValues(alpha: 0.5),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          Icons.call,
          color: isDark ? const Color(0xFFEADDFF) : const Color(0xFF31111D),
          size: 28,
        ),
        onPressed: onCallPressed,
      ),
    );
  }
}
