import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onPressed,
    this.color,
    required this.label,
    this.disabled = false,
    this.textColor,
    this.showLoading = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Color? color;
  final String label;
  final bool disabled;
  final Color? textColor;
  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: disabled ? null : (){
        HapticFeedback.mediumImpact();
        onPressed?.call();
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: disabled ? const Color(0xFFB1B1B1) : color ?? Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (showLoading) ...{
                SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: textColor ?? Colors.white,
                    )),
                const SizedBox(
                  width: 10,
                )
              },
              Text(
                label,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: disabled ? const Color(0xFFF5F5F5) : textColor ?? Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
