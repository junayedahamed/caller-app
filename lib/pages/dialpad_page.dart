import 'package:flutter/material.dart';
import '../widgets/dial_button.dart';

class DialpadPage extends StatefulWidget {
  const DialpadPage({super.key});

  @override
  State<DialpadPage> createState() => _DialpadPageState();
}

class _DialpadPageState extends State<DialpadPage> {
  String _phoneNumber = '';

  void _onDigitPressed(String digit) {
    setState(() {
      _phoneNumber += digit;
    });
  }

  void _onBackspace() {
    if (_phoneNumber.isNotEmpty) {
      setState(() {
        _phoneNumber = _phoneNumber.substring(0, _phoneNumber.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              alignment: Alignment.center,
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -2,
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  _phoneNumber,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _phoneNumber.isNotEmpty ? 1.0 : 0.0,
              child: FilledButton.tonal(
                onPressed: () {},
                child: const Text('Add to Contacts'),
              ),
            ),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  _buildDialRow(['1', '2', '3'], ['', 'ABC', 'DEF']),
                  const SizedBox(height: 16),
                  _buildDialRow(['4', '5', '6'], ['GHI', 'JKL', 'MNO']),
                  const SizedBox(height: 16),
                  _buildDialRow(['7', '8', '9'], ['PQRS', 'TUV', 'WXYZ']),
                  const SizedBox(height: 16),
                  _buildDialRow(['*', '0', '#'], ['', '+', '']),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(width: 60),
                      _buildCallButton(),
                      SizedBox(
                        width: 60,
                        child: _phoneNumber.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.backspace_outlined,
                                    color: Colors.white70, size: 28),
                                onPressed: _onBackspace,
                              )
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
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
          onTap: () => _onDigitPressed(digits[index]),
        );
      }),
    );
  }

  Widget _buildCallButton() {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 96,
      height: 96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF4F378B), const Color(0xFF633B48)]
              : [const Color(0xFFFFD8E4), const Color(0xFFFFB0CA)],
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? const Color(0xFF4F378B).withOpacity(0.4)
                : const Color(0xFFFFD8E4).withOpacity(0.5),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(
          Icons.call,
          color: isDark ? const Color(0xFFEADDFF) : const Color(0xFF31111D),
          size: 44,
        ),
        onPressed: () {
          if (_phoneNumber.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                backgroundColor: colorScheme.primaryContainer,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                content: Text(
                  'Calling \$_phoneNumber...',
                  style: TextStyle(
                    color: colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
