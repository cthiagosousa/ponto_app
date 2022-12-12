import 'package:flutter/material.dart';
import 'package:ponto_app/modules/ui/base.dart';
import 'package:ponto_app/modules/widgets/base_card.dart';

class JourneyWidget extends WidgetBase {
  const JourneyWidget({super.key});

  @override
  Widget builder(context, theme) {
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sua jornada prevista para hoje",
            textAlign: TextAlign.start,
            style: theme.textTheme.titleMedium,
          ),

          Divider(color: theme.colorScheme.primary ),

          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 25),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "08:00",
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    Text(
                      "Início",
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}