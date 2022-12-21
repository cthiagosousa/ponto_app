// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ponto_app/modules/ui/base.dart';

class Input extends WidgetBase {
  final TextEditingController? textController;
  final String? placeholder;
  final FocusNode? focus;
  final bool enable;

  const Input({
    super.key,
    this.textController,
    this.placeholder,
    this.focus,
    this.enable = true,
  });

  @override
  Widget builder(BuildContext context, ThemeData theme) {
    return TextFormField(
      controller: textController,
      focusNode: focus,
      style: theme.textTheme.bodySmall?.copyWith(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: placeholder,
        enabled: enable,
        hintStyle: theme.textTheme.bodySmall?.copyWith(
          color: Colors.white,
        ),
        border: border,
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  InputBorder get border => const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: .5
    )
  );
}
