## Question 3: What is the Difference Between a Class and an Object?

### Overview

In Object-Oriented Programming (OOP), **classes** and **objects** are fundamental concepts that work together but serve different purposes. Understanding the distinction between them is crucial for writing effective object-oriented code.

### What is a Class?

A **class** is a **blueprint** or **template** that defines the structure and behavior of objects. It specifies:
- **Properties (attributes)**: What data the object will hold
- **Methods (behaviors)**: What actions the object can perform
- **Constructors**: How objects are created and initialized

Think of a class as a **recipe** or **architectural plan** - it describes what something should be, but it's not the thing itself.

```dart
// Class definition - the blueprint
class Car {
  // Properties (attributes)
  String brand;
  String model;
  int year;
  String color;

  // Constructor
  Car(this.brand, this.model, this.year, this.color);

  // Methods (behaviors)
  void startEngine() {
    print('$brand $model engine started!');
  }

  void drive() {
    print('$brand $model is driving...');
  }

  void displayInfo() {
    print('Car: $year $brand $model - $color');
  }
}
```

### What is an Object?

An **object** is a **specific instance** of a class. It's a concrete entity created from the class blueprint, with:
- **Actual values** for the properties defined in the class
- **Access** to the methods defined in the class
- **Unique identity** in memory

Think of an object as the **actual dish made from a recipe** or the **building constructed from architectural plans**.

```dart
void main() {
  // Creating objects (instances) from the Car class
  Car car1 = Car('Toyota', 'Camry', 2023, 'Silver');
  Car car2 = Car('Honda', 'Civic', 2024, 'Blue');
  Car car3 = Car('Tesla', 'Model 3', 2023, 'Red');

  // Each object has its own unique data
  car1.displayInfo();  // Car: 2023 Toyota Camry - Silver
  car2.displayInfo();  // Car: 2024 Honda Civic - Blue
  car3.displayInfo();  // Car: 2023 Tesla Model 3 - Red

  // Each object can perform actions defined in the class
  car1.startEngine();  // Toyota Camry engine started!
  car2.drive();        // Honda Civic is driving...
}
```

### Key Differences

| Aspect | Class | Object |
|--------|-------|--------|
| **Definition** | Blueprint or template | Instance of a class |
| **Nature** | Logical entity | Physical entity in memory |
| **Memory** | No memory allocated | Memory allocated when created |
| **Keyword** | Defined using `class` keyword | Created using constructor |
| **When created** | Compile time | Runtime |
| **Quantity** | Defined once | Can create many from one class |
| **Example** | Recipe, architectural plan | Actual dish, actual building |

### Analogy: Cookie Cutter vs Cookies

```dart
// Class = Cookie Cutter (the template)
class Cookie {
  String flavor;
  double size;
  bool hasChips;

  Cookie(this.flavor, this.size, this.hasChips);

  void bake() {
    print('Baking $flavor cookie...');
  }
}

void main() {
  // Objects = Actual cookies made with the cutter
  Cookie cookie1 = Cookie('Chocolate', 3.5, true);
  Cookie cookie2 = Cookie('Vanilla', 3.0, false);
  Cookie cookie3 = Cookie('Oatmeal', 4.0, true);

  // Each cookie is unique but follows the same template
  cookie1.bake();  // Baking Chocolate cookie...
  cookie2.bake();  // Baking Vanilla cookie...
}
```

### Real-World Examples

#### Example 1: Person Class

```dart
class Person {
  String name;
  int age;
  String email;

  Person(this.name, this.age, this.email);

  void introduce() {
    print('Hi, I\'m $name, $age years old.');
  }

  void sendEmail(String message) {
    print('Sending email to $email: $message');
  }
}

void main() {
  // Creating multiple person objects from one class
  Person person1 = Person('Alice', 25, 'alice@example.com');
  Person person2 = Person('Bob', 30, 'bob@example.com');
  Person person3 = Person('Charlie', 28, 'charlie@example.com');

  person1.introduce();  // Hi, I'm Alice, 25 years old.
  person2.introduce();  // Hi, I'm Bob, 30 years old.
}
```

#### Example 2: BankAccount Class

```dart
class BankAccount {
  String accountNumber;
  String ownerName;
  double balance;

  BankAccount(this.accountNumber, this.ownerName, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited \$${amount}. New balance: \$${balance}');
  }

  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      print('Withdrawn \$${amount}. New balance: \$${balance}');
    } else {
      print('Insufficient funds!');
    }
  }

  void displayBalance() {
    print('$ownerName\'s account ($accountNumber): \$${balance}');
  }
}

void main() {
  // Each object maintains its own independent state
  BankAccount account1 = BankAccount('ACC001', 'John Doe', 1000.0);
  BankAccount account2 = BankAccount('ACC002', 'Jane Smith', 2500.0);

  account1.deposit(500);      // John's balance increases
  account2.withdraw(300);     // Jane's balance decreases independently

  account1.displayBalance();  // John Doe's account (ACC001): $1500.0
  account2.displayBalance();  // Jane Smith's account (ACC002): $2200.0
}
```

### Memory Representation

```dart
class Student {
  String name;
  int rollNumber;

  Student(this.name, this.rollNumber);
}

void main() {
  // Class: Template (no memory)
  // ┌─────────────────┐
  // │  Student Class  │
  // │  - name         │
  // │  - rollNumber   │
  // └─────────────────┘

  // Objects: Instances in memory
  Student s1 = Student('Alice', 101);  // Memory allocated
  Student s2 = Student('Bob', 102);    // Separate memory allocated

  // s1: [name: 'Alice', rollNumber: 101] ← Memory Address 0x001
  // s2: [name: 'Bob',   rollNumber: 102] ← Memory Address 0x002
}
```

### Important Points to Remember

1. **One Class, Many Objects**
   - A single class can be used to create unlimited objects
   - Each object is independent with its own data

2. **Class = Static, Object = Dynamic**
   - Class definition remains constant
   - Objects can be created and destroyed dynamically

3. **Encapsulation**
   - Classes encapsulate data and methods together
   - Objects maintain their own copy of the data

4. **Reusability**
   - Classes promote code reusability
   - Same class can create objects with different values

### Summary

```
CLASS:
- Blueprint/Template
- Defines structure
- Logical entity
- Created at compile time
- No memory allocated
- Defined once

OBJECT:
- Instance of class
- Contains actual data
- Physical entity in memory
- Created at runtime
- Memory allocated
- Can create multiple instances
```

In simple terms: **A class is like a form or template**, and **objects are the filled-out copies of that form** with actual data. You design the form once (class), but you can fill out many copies of it (objects), each with different information.
