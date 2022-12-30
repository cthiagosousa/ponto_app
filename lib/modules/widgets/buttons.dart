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

class LoadingButton extends StatefulWidget {
  final String text;
  final Color? color;
  final double size;
  final Future<void> Function()? onPressed;

  const LoadingButton({
    super.key,
    required this.text,
    this.size = 100,
    this.color,
    this.onPressed,
  });

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SizedBox(
      width: widget.size.w,
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
        onPressed: () async {
          if(widget.onPressed != null) {
            setState(() {isLoading = true;});
            await widget.onPressed!();
            setState(() {isLoading = false;});
          }
        }, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isLoading,
              child: Container(
                width: 15.w,
                height: 15.w,
                margin: EdgeInsets.only(right: 10.w),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1,
                ),
              ),
            ),
            Text(
              widget.text,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
