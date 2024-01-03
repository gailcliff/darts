abstract class Animal {
  String name, species;

  Animal(this.name, this.species);

  void makeSound();

  void giveBirth() {
    print("push push...");
  }

  @override
  String toString() {
    return "$species(name=$name)";
  }
}

abstract class Animalia {
   late String name, species;

   // Animalia(this.name, this.species);

   void eat(){}

   void move();

   void makeSound();

   @override
  String toString() {
    // TODO: implement toString
    return("$species(name=$name)");
  }

  factory Animalia.Dog(String name) => Dog(name);
}

class Dog with MuncherMixin, SprinterMixin implements Animalia {

  @override
  String name, species;

  Dog(String name) : this.name=name, this.species='Dog';


  @override
  void makeSound() {
    print("Woof woof!");
  }

  @override
  String toString() {
    return("Doggy $name");
  }
}

class Cheetah with SprinterMixin, MuncherMixin implements Animalia {

  @override
  String name, species;

  Cheetah(this.name) : this.species='Cheetah';

  @override
  void makeSound() {
    print("Meow meow");
  }
}

mixin SprinterMixin {

  void move() {
    print("Sprint sprint!");
  }
}

mixin MuncherMixin {

  void eat() {
    print("Munch munch!");
  }
}

void main() {
  Animalia dog = Dog('symbaa');
  dog.eat();
  dog.move();
  dog.makeSound();
  print(dog is Dog);
  print(dog is! Dog);

  print(dog);

  Animalia animalia = Animalia.Dog("Snoop");
  print(animalia);

  Animalia animalia1 = Cheetah("cheator");
  animalia1.eat();
  animalia1.move();
  animalia1.makeSound();

  final b = BigInt.from(545843975892348238);
  print(b.pow(10));
}