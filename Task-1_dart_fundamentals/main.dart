void main() {
  int fees = 59850;
  String test = "IELTS";
  double bands = 9.0;
  bool isPassed = true;
  List<String> Parts = ["Writing", "Speaking", "Listening", "Reading"];

  print(
      "I am hoping for $bands bands in my $test Academic Test which comprises of $Parts. The Fee for this exam is $fees PKR. and it's $isPassed.");

  if (isPassed) {
    print("Congratulations Junaid");
  } else {
    print("Don't lose hope.");
  }

  for (int i = 0; i < Parts.length; i++) {
    print('Part ${i + 1} : ${Parts[i]}');
  }

  int index = 0;
  while (index < Parts.length) {
    print('Part ${index + 1}: ${Parts[index]}');
    index++;
  }

  IELTSStudent junaid = IELTSStudent(
    name: "Junaid",
    age: 21,
    bands: 9.0,
    fee: 59850,
  );
  junaid.printIELTSStudent();
  
  fetchData();
  
  fetchStream();
  
  exceptions();
}

class Student {
  String name;
  int age;

  Student({
    required this.name,
    required this.age,
  });
}

class IELTSStudent extends Student {
  double bands;
  int fee;

  IELTSStudent({
    required String name,
    required int age,
    required this.bands,
    required this.fee,
  }) : super(name: name, age: age);

  void printIELTSStudent() {
    print("$name : $age : $bands : $fee");
  }
}

// Async function
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data Fetched after 2 seconds';
}

// Stream function
Stream<int> fetchStream() async* {
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

// Abstract class
abstract class AbstractStudent {
  void printIELTSStudent();
}

// Exception handling
void exceptions() {
  try {
    int result = 10 ~/ 0;
    print(result);
  } catch (e) {
    print('Caught an exception: $e');
  }
}
