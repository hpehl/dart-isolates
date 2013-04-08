import "dart:async";
import "dart:isolate";
import "packages/spawn/isolates.dart";

void main() {
  var f1 = spawnFunction(echoIsolate).call("Hello from main");
  var f2 = spawnFunction(adderIsolate).call([1, 2, 3, 4, 5]);
  var f3 = spawnUri("packages/spawn/adder.dart").call([19, 23]);

  Future.wait([f1, f2, f3]).then((List results) {
    results.forEach((result) => print(result));
  });
}
