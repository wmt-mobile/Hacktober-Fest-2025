## Question 2: What is Big O Notation and How Do You Analyze Time Complexity?

### What is Big O Notation?

**Big O Notation** is a mathematical notation used in computer science to describe the performance or complexity of an algorithm. Specifically, it describes the **worst-case scenario** and helps us understand how the runtime or space requirements grow as the input size increases.

Big O notation expresses the upper bound of an algorithm's growth rate, allowing developers to:
- Compare different algorithms
- Predict performance at scale
- Make informed decisions about which algorithm to use

### Common Big O Complexities

Here are the most common time complexities, ordered from best to worst:

1. **O(1) - Constant Time**
   - The algorithm takes the same amount of time regardless of input size
   - Example: Accessing an array element by index
   ```dart
   int getFirstElement(List<int> arr) {
     return arr[0]; // Always takes the same time
   }
   ```

2. **O(log n) - Logarithmic Time**
   - The algorithm's time increases logarithmically with input size
   - Example: Binary search in a sorted array
   ```dart
   int binarySearch(List<int> sortedArr, int target) {
     int left = 0, right = sortedArr.length - 1;
     while (left <= right) {
       int mid = left + (right - left) ~/ 2;
       if (sortedArr[mid] == target) return mid;
       if (sortedArr[mid] < target) left = mid + 1;
       else right = mid - 1;
     }
     return -1;
   }
   ```

3. **O(n) - Linear Time**
   - The time grows linearly with input size
   - Example: Finding an element in an unsorted array
   ```dart
   int findElement(List<int> arr, int target) {
     for (int i = 0; i < arr.length; i++) {
       if (arr[i] == target) return i;
     }
     return -1;
   }
   ```

4. **O(n log n) - Linearithmic Time**
   - Common in efficient sorting algorithms
   - Example: Merge Sort, Quick Sort (average case)
   ```dart
   // Merge sort has O(n log n) complexity
   List<int> mergeSort(List<int> arr) {
     if (arr.length <= 1) return arr;
     int mid = arr.length ~/ 2;
     return merge(mergeSort(arr.sublist(0, mid)),
                  mergeSort(arr.sublist(mid)));
   }
   ```

5. **O(n²) - Quadratic Time**
   - Time grows quadratically with input size
   - Example: Nested loops, Bubble Sort
   ```dart
   void bubbleSort(List<int> arr) {
     for (int i = 0; i < arr.length; i++) {
       for (int j = 0; j < arr.length - i - 1; j++) {
         if (arr[j] > arr[j + 1]) {
           int temp = arr[j];
           arr[j] = arr[j + 1];
           arr[j + 1] = temp;
         }
       }
     }
   }
   ```

6. **O(2ⁿ) - Exponential Time**
   - Time doubles with each addition to input
   - Example: Recursive Fibonacci without memoization
   ```dart
   int fibonacci(int n) {
     if (n <= 1) return n;
     return fibonacci(n - 1) + fibonacci(n - 2);
   }
   ```

7. **O(n!) - Factorial Time**
   - Extremely slow, grows factorially
   - Example: Generating all permutations

### How to Analyze Time Complexity

#### Step 1: Identify Basic Operations
Look for the operations that will be executed most frequently:
- Assignments
- Comparisons
- Arithmetic operations
- Function calls

#### Step 2: Count Operations Based on Input Size
- Single operations → O(1)
- One loop through n items → O(n)
- Nested loops → O(n²)
- Dividing problem in half each time → O(log n)

#### Step 3: Focus on Dominant Terms
When combining complexities, keep only the fastest-growing term:
- O(n² + n) → O(n²)
- O(n log n + n) → O(n log n)
- O(2n + 5) → O(n)

#### Step 4: Ignore Constants
Big O describes growth rate, not exact runtime:
- O(2n) → O(n)
- O(n/2) → O(n)
- O(100) → O(1)

### Practical Example Analysis

```dart
void exampleFunction(List<int> arr) {
  // O(1) - constant time operation
  int first = arr[0];

  // O(n) - linear time loop
  for (int i = 0; i < arr.length; i++) {
    print(arr[i]);
  }

  // O(n²) - nested loops
  for (int i = 0; i < arr.length; i++) {
    for (int j = 0; j < arr.length; j++) {
      print('${arr[i]}, ${arr[j]}');
    }
  }
}
// Total: O(1) + O(n) + O(n²) = O(n²)
```

### Space Complexity

Big O also applies to **space complexity** (memory usage):

- **O(1)** - Constant space: Fixed amount of memory
- **O(n)** - Linear space: Memory grows with input size
- **O(n²)** - Quadratic space: Memory grows quadratically

```dart
// O(1) space - only uses a fixed amount of variables
int sumArray(List<int> arr) {
  int sum = 0;
  for (int num in arr) {
    sum += num;
  }
  return sum;
}

// O(n) space - creates new list of size n
List<int> doubleArray(List<int> arr) {
  return arr.map((x) => x * 2).toList();
}
```

### Key Takeaways

1. Big O describes **worst-case** performance
2. Focus on **growth rate**, not exact counts
3. **Drop constants** and lower-order terms
4. Consider both **time and space** complexity
5. O(1) < O(log n) < O(n) < O(n log n) < O(n²) < O(2ⁿ) < O(n!)

Understanding Big O notation helps you write efficient code and make better algorithmic choices, especially when dealing with large datasets.
