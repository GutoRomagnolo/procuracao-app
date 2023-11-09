Stream<int> streamSendData() async* {
  for (var i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 3));
    yield i;
  }
}

watchSendData(int receive) {
  print("Receive message: ${receive}");
}

// 19:00