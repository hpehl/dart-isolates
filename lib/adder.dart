library adder;

import "dart:isolate";

void main() {
  port.receive((List<num> numbers, SendPort reply) => reply.send(numbers.reduce(0, (previous, current) => previous + current)));
}
