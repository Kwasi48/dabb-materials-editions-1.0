void main() {
  print('first');
  //Intentionally delaying a task.
  Future.delayed(Duration(seconds: 2), () => print('second'));

  print('third');
}

  // print('first');
  //adding a task to the event queue.
  // Future(
  //   () => print('second'),
  // );

  // print('third');



   // print('first');

  // Future(
  //   () => print('second'),
  // );
  // //adding a task to the microtask queue
  // Future.microtask(() => print('third'));

  // print('four');


  // print('first');

  // //Runing a Synchronous task after an Event Queue Task

  // Future(
  //   () => print('second'),
  // ).then((value) => print('third'));

  // Future(
  //   () => print('fourth'),
  // );

  // print('fifth');