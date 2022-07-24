import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/to_do.dart';
import 'package:to_do_app/providers/provider_single_choice_priority.dart';

import '../helper/app_constants/constant_app_color.dart';
import '../providers/provider_request_http_to_do.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/priority_circle_avatar_widget.dart';

class EditTask extends StatefulWidget {
  const EditTask({Key? key}) : super(key: key);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  late TextEditingController _taskName;
  late TextEditingController _descripToDo;
  late TextEditingController _categoryTask;
  late TextEditingController _dateTask;
  late TextEditingController _netTask;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ToDoEntity? toDo = context.read<RequestHttpToDoProvider>().toDoSelected;
    _taskName = TextEditingController(text: toDo!.titleToDO);
    _descripToDo = TextEditingController(
        text:
            'Have to meet him because i want to show him my latest app design in person.\nAlso need to ask for advice on these: \n -style \n- interaction \n- copy                    ');
    _categoryTask = TextEditingController(text: 'friends');
    _dateTask = TextEditingController(text: toDo.dateTimeToDoString);
    _netTask = TextEditingController(text: '10 minutes');
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ChangeNotifierProvider<SingleChoicePriorityProvider>(
      create: (_) => SingleChoicePriorityProvider(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(350.h),
          child: const AppBarWidget(
            title: 'Edit Task',
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
                            controller: _taskName,
                            style: textTheme.headline3
                                ?.copyWith(fontWeight: FontWeight.w600),
                            decoration: InputDecoration(
                              label: const Text('Task Name'),
                              contentPadding: const EdgeInsets.all(16),
                              hintStyle: textTheme.headline4?.copyWith(
                                color: ConstantAppColorsHelper.myLightBlack
                                    .withOpacity(0.33),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _descripToDo,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            style: textTheme.headline4?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 36.sp,
                              height: 1.5,
                              color: ConstantAppColorsHelper.myLightBlack
                                  .withOpacity(0.75),
                            ),
                            decoration: InputDecoration(
                              label: const Text('Description'),
                              contentPadding: const EdgeInsets.all(16),
                              hintStyle: textTheme.headline4?.copyWith(
                                color: ConstantAppColorsHelper.myLightBlack
                                    .withOpacity(0.33),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _categoryTask,
                            style: textTheme.subtitle2
                                ?.copyWith(fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              label: const Text('Category'),
                              contentPadding: const EdgeInsets.all(16),
                              hintStyle: textTheme.headline4?.copyWith(
                                color: ConstantAppColorsHelper.myLightBlack
                                    .withOpacity(0.33),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _dateTask,
                            style: textTheme.subtitle2
                                ?.copyWith(fontWeight: FontWeight.normal),
                            decoration: InputDecoration(
                              label: const Text('Pick Date & Time'),
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
                          controller: _netTask,
                          style: textTheme.subtitle2
                              ?.copyWith(fontWeight: FontWeight.normal),
                          decoration: InputDecoration(
                            label: const Text('Notification'),
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
                    child: const Text('Edit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _taskName.dispose();
    _descripToDo.dispose();
    _categoryTask.dispose();
    _dateTask.dispose();
    _netTask.dispose();
  }
}
