library isolates;

import "dart:isolate";

void adderIsolate() {
  port.receive((List<num> numbers, SendPort reply) => reply.send(numbers.reduce(0, (previous, current) => previous + current)));
}

void echoIsolate() {
  port.receive((String message, SendPort reply) {
    // No access to the DOM here :-(
    // query("#message").text = message;
    reply.send("I received: $message");
  });
}
