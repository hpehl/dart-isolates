import "dart:async";
import "dart:html";
import "dart:isolate";
import "packages/spawn/isolates.dart";

void main() {
  var f1 = spawnFunction(echoIsolate).call("Hello from main");
  var f2 = spawnFunction(adderIsolate).call([1, 2, 3, 4, 5]);
  // spawnUri does not work in the browser
  // var f3 = spawnUri("packages/spawn/adder.dart").call([19, 23]);

  Future.wait([f1, f2]).then((List results) {
    results.forEach((result) => showResult(result));
  });
}

void showResult(var result) {
  LIElement li = new LIElement()..text = result.toString();
  query("#results").children.add(li);
}
