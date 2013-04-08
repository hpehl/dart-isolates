library isolates;

import "dart:isolate";

void adderIsolate() {
  port.receive((List<num> numbers, SendPort reply) {
    var sum = numbers.reduce(0, (previous, current) => previous + current);
    reply.send(sum);
  });
}

// No access to the DOM inside the isolate here :-(
// No query("#message").text = message;
void echoIsolate() {
  port.receive((String message, SendPort reply) => reply.send("I received: $message"));
}
