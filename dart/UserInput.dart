import 'dart:io';

void main(){
  stdout.writeln('What is you name?: ');
  var name = stdin.readLineSync();
  print('My name is $name');
}