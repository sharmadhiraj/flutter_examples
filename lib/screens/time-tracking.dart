import 'dart:async';

import 'package:flutter/material.dart';

class TimeTrackHome extends StatefulWidget {
  @override
  _TimeTrackHomeState createState() => _TimeTrackHomeState();
}

class _TimeTrackHomeState extends State<TimeTrackHome> {
  TextEditingController _textController;
  List<TaskItem> _taskList = List<TaskItem>();

  void _addTaskDialog() async {
    _textController = TextEditingController();

    await showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Add A Task"),
              content: TextField(
                controller: _textController,
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Enter the task name'),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("CANCEL")),
                FlatButton(
                    onPressed: (() {
                      Navigator.pop(context);
                      _addTask(_textController.text);
                    }),
                    child: const Text("ADD"))
              ],
            ));
  }

  void _addTask(String title) {
    setState(() {
      // add the task
      _taskList.add(TaskItem(
        name: title,
      ));
    });
  }

  @override
  void initState() {
    _taskList = List<TaskItem>();
    // TODO: add SQL task data retrieval
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemExtent: 60,
            itemCount: _taskList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                key: ObjectKey(_taskList[index]),
                onHorizontalDragEnd: (dragType) {
                  if (this.mounted) {
                    setState(() {
                      _taskList.removeAt(index);
                    });
                  }
                },
                child: _taskList[index],
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTaskDialog,
        tooltip: 'Click to add a task',
        child: Icon(Icons.add),
      ),
    );
  }
}

class TaskItem extends StatefulWidget {
  final String name;
  final int startTime;

  TaskItem({Key key, this.name, this.startTime = 0}) : super(key: key);

  TaskItem.from(TaskItem other)
      : name = other.name,
        startTime = other.startTime;

  @override
  State<StatefulWidget> createState() => _TaskState();
}

class _TaskState extends State<TaskItem> {
  static final _taskFont =
      const TextStyle(fontSize: 26, fontWeight: FontWeight.bold);
  static _TaskState previousTask;
  Color _color = Colors.transparent;
  String _taskLabel;
  Duration _elapsedTime;
  Timer _timer;

  void _timerCallback(Timer t) {
    _elapsedTime += Duration(seconds: 1);

    if (this.mounted) {
      setState(() {
        _taskLabel = widget.name + ": " + _elapsedTime.inSeconds.toString();
      });
    }
  }

  void _configureCurrentTask() {
    // start or resume the selected task
    if (_timer == null || !_timer.isActive) {
      // create and start the timer
      _timer = Timer.periodic(Duration(seconds: 1), _timerCallback);
      // highlight the current task
      setState(() => _color = Colors.greenAccent);
    }

    // stop the previous task
    if (previousTask != null) {
      previousTask._timer.cancel();
      previousTask._resetColor();
    }
    // store a reference to the previous task
    previousTask = this;
  }

  void _resetColor() {
    if (this.mounted) {
      setState(() {
        _color = Colors.transparent;
      });
    }
  }

  @override
  void initState() {
    _taskLabel = widget.name + ": ";
    _elapsedTime = Duration(seconds: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Material(
        color: _color,
        child: ListTile(
          title: Text(
            _taskLabel,
            style: _taskFont,
            textAlign: TextAlign.center,
          ),
          onTap: () {
            //_haltPreviousTask();
            _configureCurrentTask();
          },
        ),
      ),
      Divider(
        height: 0,
      ),
    ]);
  }
}
