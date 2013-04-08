# Dart Isolates

I looked for a way to implement some kind of dynamic plug-in system in dart. The idea was to load dart code on demand
into an isolate using [spawnUri()](http://api.dartlang.org/docs/releases/latest/dart_isolate.html#spawnUri). It turns
out that this function is implemented in the dart VM but neither in dartium nor compiles down to JavaScript.

Falling back to [spawnFunction()](http://api.dartlang.org/docs/releases/latest/dart_isolate.html#spawnFunction) works
as expected in the browser but it turns out that isolates are not allowed to access / change the DOM. This reduces
isolates to dumb worker functions. Plug-ins which make contributions to the UI are not possible using this approach.

The project contains scripts to test the possibilities of isolates:

- in the browser: `web/spawn.dart`
- in the VM: `bin/test.dart`
