import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../family_head_form/head_form_controller.dart';


class VerticalStepper extends StatelessWidget {
  final List<String> titles;
  final double lineWidth;
  const VerticalStepper({
    Key? key,
    required this.titles,
    this.lineWidth = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HeadFormController>();
    final theme = Theme.of(context);
    return Obx(() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(titles.length, (i) {
          final isCurrent = i == ctrl.currentStep.value;
          final isDone = i < ctrl.currentStep.value;

          return IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Column(
                  children: [


                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        titles[i],
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight:
                          isCurrent ? FontWeight.bold : FontWeight.normal,
                          color: isCurrent
                              ? theme.colorScheme.primary
                              : theme.textTheme.bodyMedium?.color,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isDone || isCurrent
                            ? theme.colorScheme.primary
                            : Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${i + 1}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontWeight:
                          isCurrent ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),

                    // line
                    if (i < titles.length - 1)
                      Container(
                        width: lineWidth,
                        height: isDone
                            ? 48
                            : (isCurrent ? 72 : 24), // current step gets longer
                        color: isDone || isCurrent
                            ? theme.colorScheme.primary
                            : Colors.grey.shade300,
                      ),
                  ],
                ),


              ],
            ),
          );
        }),
      );
    });
  }
}
