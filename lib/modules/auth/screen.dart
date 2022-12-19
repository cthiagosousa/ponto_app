import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponto_app/modules/auth/controller.dart';
import 'package:ponto_app/modules/auth/widgets/login_form_widget.dart';
import 'package:ponto_app/modules/ui/base.dart';

class AuthScreen extends ScreenBase<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget builder(BuildContext context, ThemeData theme) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: const LoginFormWidget(),
    );
  }
}