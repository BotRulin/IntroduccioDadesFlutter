import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget 
{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const MaterialApp
    (
      title: 'Enter a text string and press the button',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget 
{
  const MyCustomForm({super.key});

  @override
  State <MyCustomForm> createState() => _MyCustomFormState();
}



class _MyCustomFormState extends State<MyCustomForm>
{
  final myController = TextEditingController();

  @override
  void dispose()
  {
    myController.dispose();
    super.dispose();
  }

  void showAlertDialog(BuildContext context)
  {
    showDialog
    (
      context: context,
      builder: (context)
      {
        return AlertDialog
        (
          content: Text(myController.text),
          actions: [TextButton(onPressed: () { Navigator.pop(context); }, child: const Text('OK')) ],
        );
      },
    );
  }

  void showSimpleDialog(BuildContext context)
  {
    showDialog
    (
      context: context,
      builder: (context)
      {
        return SimpleDialog
        (
          title: const Text('Simple Dialog'),
          children: 
          [
            Padding
            (
            padding: const EdgeInsets.all(25.0), // Ajusta los márgenes según tus necesidades
            child: Text(myController.text),
            ),
            SimpleDialogOption
            (
              onPressed: () { Navigator.pop(context); },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showSnackBar(BuildContext context)
  {
    ScaffoldMessenger.of(context).showSnackBar
    (
      SnackBar
      (
        content: Text(myController.text),
        action: SnackBarAction
        (
          label: 'OK',
          onPressed: () { },
        ),
      ),
    );
  }

  void showModalButtonSheet(BuildContext context)
  {
    showModalBottomSheet
    (
      context: context,
      builder: (context)
      {
        return Container
        (
          height: 200,
          color: Colors.amber,
          child: Center
          (
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: 
              [
                Text(myController.text),
                ElevatedButton
                (
                  onPressed: () { Navigator.pop(context); },
                  child: const Text('Close'),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: const Text('Enter a text string and press the button'),
      ),
      body: Padding
      (
        padding: const EdgeInsets.all(16.0),
        child: TextField
        (
          controller: myController,
        ),
      ),

      floatingActionButton: Column
      (
        mainAxisAlignment: MainAxisAlignment.end,
        children: 
        [
          FloatingActionButton
          (
            onPressed: () { showAlertDialog(context); },
            tooltip: 'Show Alert Dialog',
            child: const Icon(Icons.add_alert),
          ),
          const SizedBox(height: 10),
          FloatingActionButton
          (
            onPressed: () { showSimpleDialog(context); },
            tooltip: 'Show Simple Dialog',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton
          (
            onPressed: () { showSnackBar(context); },
            tooltip: 'Show SnackBar',
            child: const Icon(Icons.add_comment),
          ),
          const SizedBox(height: 10),
          FloatingActionButton
          (
            onPressed: () { showModalButtonSheet(context); },
            tooltip: 'Show Modal BottomSheet',
            child: const Icon(Icons.add_circle_outline),
          ),
        ],
      )
    );
  }
}

