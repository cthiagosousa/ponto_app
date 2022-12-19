import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ponto_app/modules/ui/base.dart';
import 'package:ponto_app/modules/user/controller.dart';
import 'package:ponto_app/modules/utils/utils.dart';

class HomeAppBar extends WidgetBase<UserController> {
  const HomeAppBar({super.key});

  @override
  Widget builder(context, theme) {
    return Container(
      width: 1.sw,
      height: 200.h,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      color: theme.colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dateNowWithWeekName(),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.arrowRotateLeft,
                      color: Colors.white,
                      size: theme.iconTheme.size,
                    ),
                    onPressed: () {}, 
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.bell,
                      color: Colors.white,
                      size: theme.iconTheme.size,
                    ),
                    onPressed: () {}, 
                  ),
                ],
              )
            ],
          ),

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Olá, ",
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                        children: [
                          TextSpan(
                            text: controller.user?.name ?? "User",
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Bom Trabalho!",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: theme.colorScheme.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}