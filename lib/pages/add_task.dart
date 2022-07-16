import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/provider_single_choice_priority.dart';

import '../helper/app_constants/constant_app_color.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/priority_circle_avatar_widget.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ChangeNotifierProvider<SingleChoicePriorityProvider>(
      create: (_) => SingleChoicePriorityProvider(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(350.h),
          child: const AppBarWidget(
            title: 'New Task',
            visibleAddIcon: false,
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Material(
                    color: Colors.white,
                    child: Form(
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Task Name',
                              contentPadding: const EdgeInsets.all(16),
                              hintStyle: textTheme.headline4?.copyWith(
                                color: ConstantAppColorsHelper.myLightBlack
                                    .withOpacity(0.33),
                              ),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                              hintText: 'Description',
                              contentPadding: const EdgeInsets.all(16),
                              hintStyle: textTheme.headline4?.copyWith(
                                color: ConstantAppColorsHelper.myLightBlack
                                    .withOpacity(0.33),
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Category',
                              contentPadding: const EdgeInsets.all(16),
                              hintStyle: textTheme.headline4?.copyWith(
                                color: ConstantAppColorsHelper.myLightBlack
                                    .withOpacity(0.33),
                              ),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Pick Date & Time',
                              contentPadding: const EdgeInsets.all(16),
                              hintStyle: textTheme.headline4?.copyWith(
                                color: ConstantAppColorsHelper.myLightBlack
                                    .withOpacity(0.33),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 27.h, horizontal: 48.w),
                    child: Text(
                      'Priority',
                      style: textTheme.headline4,
                    ),
                  ),
                  Material(
                    color: Colors.white,
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        SizedBox(
                          height: 180.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 48.w),
                            child: Consumer<SingleChoicePriorityProvider>(
                              builder:
                                  (_, singleChoicePriorityProvider, child) {
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: singleChoicePriorityProvider
                                      .getLengthPriority(),
                                  itemBuilder: (_, index) {
                                    return PriorityCircleAvatarWidget(
                                      onTap: () => singleChoicePriorityProvider
                                          .setSelectPriority(index),
                                      myColor: singleChoicePriorityProvider
                                          .colorPriority[index],
                                      isSelected: singleChoicePriorityProvider
                                          .isPrioritySelected[index],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        Divider(
                          height: 5.h,
                          color: ConstantAppColorsHelper.myLightBlack
                              .withOpacity(0.33),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Notification',
                            contentPadding: const EdgeInsets.all(16),
                            hintStyle: textTheme.headline4?.copyWith(
                              color: ConstantAppColorsHelper.myLightBlack
                                  .withOpacity(0.33),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 48.h),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(),
                      ),
                    ),
                    child: const Text('ADD'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
