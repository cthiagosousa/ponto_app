import 'package:ponto_app/modules/auth/controller.dart';
import 'package:ponto_app/modules/ui/base.dart';
import 'package:ponto_app/modules/widgets/inputs.dart';

class LoginFormWidget extends WidgetBase<AuthController> {
  const LoginFormWidget({super.key});

  @override
  Widget builder(BuildContext context, ThemeData theme) {
    return Form(
      key: controller.formState,
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
          ElevatedButton(
            onPressed: controller.auth, 
            child: const Text(
              "Login"
            ),
          ),
        ],
      ),
    );
  }
}