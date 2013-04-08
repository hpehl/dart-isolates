library adder;

import "dart:isolate";

void main() {
  port.receive((List<num> numbers, SendPort reply) {
    var sum = numbers.reduce(0, (previous, current) => previous + current);
    reply.send(sum);
  });
}
