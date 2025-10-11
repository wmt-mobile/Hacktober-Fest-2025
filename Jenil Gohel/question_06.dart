/// Question 6: Write a Program to Find the Sum of All the Integers from List<dynamic>
///
/// This program demonstrates how to extract integers from a dynamic list
/// and calculate their sum, handling different data types safely.

void main() {
  // Test Case 1: Mixed data types
  print('Test Case 1: Mixed data types');
  List<dynamic> list1 = [1, 2, 'hello', 3, 4.5, 5, true, 6];
  print('Input: $list1');
  print('Sum of integers: ${sumOfIntegers(list1)}');
  print('Expected: 17 (1+2+3+5+6)\n');

  // Test Case 2: All integers
  print('Test Case 2: All integers');
  List<dynamic> list2 = [10, 20, 30, 40, 50];
  print('Input: $list2');
  print('Sum of integers: ${sumOfIntegers(list2)}');
  print('Expected: 150\n');

  // Test Case 3: No integers
  print('Test Case 3: No integers');
  List<dynamic> list3 = ['hello', 'world', true, false, 3.14];
  print('Input: $list3');
  print('Sum of integers: ${sumOfIntegers(list3)}');
  print('Expected: 0\n');

  // Test Case 4: Negative integers
  print('Test Case 4: Negative integers');
  List<dynamic> list4 = [-5, 10, -3, 'test', 8, -2];
  print('Input: $list4');
  print('Sum of integers: ${sumOfIntegers(list4)}');
  print('Expected: 8 (-5+10-3+8-2)\n');

  // Test Case 5: Empty list
  print('Test Case 5: Empty list');
  List<dynamic> list5 = [];
  print('Input: $list5');
  print('Sum of integers: ${sumOfIntegers(list5)}');
  print('Expected: 0\n');

  // Test Case 6: Nested structures
  print('Test Case 6: Complex nested structures');
  List<dynamic> list6 = [1, [2, 3], 'text', 4, {'key': 5}, 6];
  print('Input: $list6');
  print('Sum of integers: ${sumOfIntegers(list6)}');
  print('Expected: 11 (1+4+6 - nested values not counted)\n');

  // Demonstrate different approaches
  print('\n=== Alternative Approaches ===\n');

  List<dynamic> testList = [1, 2, 'hello', 3, 4.5, 5];
  print('Test list: $testList\n');

  print('Approach 1 (for loop): ${sumOfIntegersForLoop(testList)}');
  print('Approach 2 (forEach): ${sumOfIntegersForEach(testList)}');
  print('Approach 3 (where + reduce): ${sumOfIntegersWhereReduce(testList)}');
  print('Approach 4 (fold): ${sumOfIntegersFold(testList)}');
  print('Approach 5 (with double conversion): ${sumOfIntegersWithDoubles(testList)}');
}

/// Main approach: Sum all integers in a dynamic list
///
/// Time Complexity: O(n) where n is the number of elements
/// Space Complexity: O(1)
///
/// @param list - The dynamic list to process
/// @return The sum of all integer values
int sumOfIntegers(List<dynamic> list) {
  int sum = 0;

  for (var element in list) {
    // Check if element is an integer
    if (element is int) {
      sum += element;
    }
  }

  return sum;
}

/// Approach 1: Using traditional for loop with index
int sumOfIntegersForLoop(List<dynamic> list) {
  int sum = 0;

  for (int i = 0; i < list.length; i++) {
    if (list[i] is int) {
      sum += list[i];
    }
  }

  return sum;
}

/// Approach 2: Using forEach method
int sumOfIntegersForEach(List<dynamic> list) {
  int sum = 0;

  list.forEach((element) {
    if (element is int) {
      sum += element;
    }
  });

  return sum;
}

/// Approach 3: Using where to filter and reduce to sum
int sumOfIntegersWhereReduce(List<dynamic> list) {
  var integers = list.where((element) => element is int).cast<int>();

  if (integers.isEmpty) {
    return 0;
  }

  return integers.reduce((sum, element) => sum + element);
}

/// Approach 4: Using fold (most functional approach)
int sumOfIntegersFold(List<dynamic> list) {
  return list.fold<int>(
    0, // Initial value
    (sum, element) => element is int ? sum + element : sum,
  );
}

/// Approach 5: Handling both int and double (converting double to int)
int sumOfIntegersWithDoubles(List<dynamic> list) {
  int sum = 0;

  for (var element in list) {
    if (element is int) {
      sum += element;
    } else if (element is double) {
      // Convert double to int (truncating decimal part)
      sum += element.toInt();
    }
  }

  return sum;
}

/// Advanced: Extract and sum integers from nested structures
int sumOfIntegersRecursive(dynamic data) {
  if (data is int) {
    return data;
  } else if (data is List) {
    int sum = 0;
    for (var element in data) {
      sum += sumOfIntegersRecursive(element);
    }
    return sum;
  } else if (data is Map) {
    int sum = 0;
    for (var value in data.values) {
      sum += sumOfIntegersRecursive(value);
    }
    return sum;
  } else {
    return 0;
  }
}

/// Helper function to demonstrate type checking
void demonstrateTypeChecking() {
  print('\n=== Type Checking Examples ===\n');

  List<dynamic> mixedList = [
    1, // int
    2.5, // double
    'text', // String
    true, // bool
    null, // null
    [1, 2, 3], // List
    {'key': 'value'}, // Map
  ];

  for (var element in mixedList) {
    print('Element: $element');
    print('  Type: ${element.runtimeType}');
    print('  Is int? ${element is int}');
    print('  Is num? ${element is num}');
    print('');
  }
}

/// Performance comparison visualization
void performanceComparison() {
  print('\n=== Performance Comparison ===\n');

  // Create a large test list
  List<dynamic> largeList = List.generate(
    1000000,
    (index) => index % 2 == 0 ? index : 'text',
  );

  Stopwatch stopwatch = Stopwatch();

  // Test Approach 1: for loop
  stopwatch.start();
  sumOfIntegersForLoop(largeList);
  stopwatch.stop();
  print('For loop: ${stopwatch.elapsedMicroseconds} μs');
  stopwatch.reset();

  // Test Approach 2: forEach
  stopwatch.start();
  sumOfIntegersForEach(largeList);
  stopwatch.stop();
  print('forEach: ${stopwatch.elapsedMicroseconds} μs');
  stopwatch.reset();

  // Test Approach 3: where + reduce
  stopwatch.start();
  sumOfIntegersWhereReduce(largeList);
  stopwatch.stop();
  print('where + reduce: ${stopwatch.elapsedMicroseconds} μs');
  stopwatch.reset();

  // Test Approach 4: fold
  stopwatch.start();
  sumOfIntegersFold(largeList);
  stopwatch.stop();
  print('fold: ${stopwatch.elapsedMicroseconds} μs');
}

/// Key Points:
///
/// 1. Type Safety in Dart:
///    - Use 'is' operator to check type at runtime
///    - Dart's type system differentiates between int and double
///    - int is NOT the same as num (num includes both int and double)
///
/// 2. Performance Considerations:
///    - Simple for loop is generally fastest
///    - Functional approaches (where, fold) are more readable
///    - Choose based on code clarity vs performance needs
///
/// 3. Edge Cases to Handle:
///    - Empty list → return 0
///    - No integers in list → return 0
///    - Negative integers → include in sum
///    - null values → skip
///    - Nested structures → decide if recursive traversal needed
///
/// 4. Different Approaches:
///    - Imperative: for loop, forEach
///    - Functional: where, reduce, fold
///    - Each has trade-offs in readability and performance
