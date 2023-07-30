import 'dart:async';

Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 3));
  return "Dados obtidos";
}

void main() async {
  await fetchData().then((data) {
    print(data);
  });
}
