// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponto_app/modules/ui/base.dart';

class Button extends WidgetBase {
  final String text;
  final double size;
  final void Function() onPressed;

  const Button({
    super.key, 
    this.size = 100,
    required this.text, 
    required this.onPressed,
  });

  @override
  Widget builder(BuildContext context, ThemeData theme) {
    return SizedBox(
      width: size.w,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(theme.colorScheme.secondary),
          elevation: MaterialStateProperty.all(0),
          alignment: Alignment.center,
          padding: MaterialStateProperty.all(EdgeInsets.all(10.w)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r)
          ))
        ),
        onPressed: onPressed, 
        child: Text(
          text,
          style: theme.textTheme.bodySmall?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ButtonText extends WidgetBase {
  final String text;
  final Color? color;
  final void Function() onPressed;

  const ButtonText({
    super.key,
    this.color,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget builder(BuildContext context, ThemeData theme) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: theme.textTheme.bodySmall?.copyWith(color: color),
      ),
    );
  }
}
