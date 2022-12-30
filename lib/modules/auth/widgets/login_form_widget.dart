import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ponto_app/modules/auth/controller.dart';
import 'package:ponto_app/modules/router/routes.dart';
import 'package:ponto_app/modules/ui/base.dart';
import 'package:ponto_app/modules/widgets/buttons.dart';
import 'package:ponto_app/modules/widgets/inputs.dart';

class LoginFormWidget extends WidgetBase<AuthController> {
  const LoginFormWidget({super.key});

  @override
  Widget builder(BuildContext context, ThemeData theme) {
    return Form(
      key: controller.formState,
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Input(
                  textController: controller.emailController,
                  placeholder: "Email",
                ),
                Input(
                  textController: controller.passwordController,
                  placeholder: "Senha",
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ButtonText(
                    text: "Esqueceu sua senha?", 
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(
            width: 1.sw,
            child: LoadingButton(
              onPressed: () async {
                await controller.auth(
                  onLogin: () => GoRouter.of(context).pushNamed(Routes.sHome)
                );
              }, 
              text: "Acessar",
            ),
          ),
        ],
      ),
    );
  }
}