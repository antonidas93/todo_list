import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './task_tile.dart';
import '../models/task_date.dart';

class TasksList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final taskItem = taskData.tasks[index];
            return TaskTile(
              taskTitle: taskItem.name,
              isChecked: taskItem.isDone,
              checkboxCallBack: (checkboxState) {
                taskData.updateTask(taskItem);
              },
              longPressCallback: () {
                taskData.deleteTask(taskItem);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
