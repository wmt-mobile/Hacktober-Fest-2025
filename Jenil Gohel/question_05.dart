/// Question 5: Reverse Integer
///
/// Given a signed 32-bit integer x, return x with its digits reversed.
/// If reversing x causes the value to go outside the signed 32-bit integer
/// range [-2³¹, 2³¹ - 1], then return 0.
///
/// Assume the environment does not allow you to store 64-bit integers.

void main() {
  // Test cases
  print('Test Case 1:');
  print('Input: 123');
  print('Output: ${reverseInteger(123)}');
  print('Expected: 321\n');

  print('Test Case 2:');
  print('Input: -123');
  print('Output: ${reverseInteger(-123)}');
  print('Expected: -321\n');

  print('Test Case 3:');
  print('Input: 120');
  print('Output: ${reverseInteger(120)}');
  print('Expected: 21\n');

  print('Test Case 4:');
  print('Input: 0');
  print('Output: ${reverseInteger(0)}');
  print('Expected: 0\n');

  print('Test Case 5 (Overflow):');
  print('Input: 1534236469');
  print('Output: ${reverseInteger(1534236469)}');
  print('Expected: 0 (overflow)\n');

  print('Test Case 6 (Negative Overflow):');
  print('Input: -2147483648');
  print('Output: ${reverseInteger(-2147483648)}');
  print('Expected: 0 (overflow)\n');

  print('Test Case 7:');
  print('Input: 9876543210');
  print('Output: ${reverseInteger(9876543210)}');
  print('Expected: 0 (overflow)\n');
}

/// Reverses the digits of a signed 32-bit integer
///
/// Time Complexity: O(log n) where n is the input number
/// Space Complexity: O(1)
///
/// @param x - The integer to reverse
/// @return The reversed integer, or 0 if overflow occurs
int reverseInteger(int x) {
  // 32-bit signed integer range
  const int INT_MAX = 2147483647;  // 2^31 - 1
  const int INT_MIN = -2147483648; // -2^31

  int result = 0;
  int num = x;

  while (num != 0) {
    // Get the last digit
    int digit = num % 10;
    num ~/= 10;

    // Check for overflow before multiplying by 10
    // If result > INT_MAX/10, then result * 10 will overflow
    // If result == INT_MAX/10, need to check if digit > 7 (last digit of INT_MAX)
    if (result > INT_MAX ~/ 10 ||
        (result == INT_MAX ~/ 10 && digit > 7)) {
      return 0;
    }

    // Check for underflow
    // If result < INT_MIN/10, then result * 10 will underflow
    // If result == INT_MIN/10, need to check if digit < -8 (last digit of INT_MIN)
    if (result < INT_MIN ~/ 10 ||
        (result == INT_MIN ~/ 10 && digit < -8)) {
      return 0;
    }

    // Update result
    result = result * 10 + digit;
  }

  return result;
}

/// Alternative approach using string manipulation
/// Note: This approach doesn't strictly follow the "no 64-bit" constraint
/// in the sense that Dart's int can handle larger values
int reverseIntegerString(int x) {
  const int INT_MAX = 2147483647;
  const int INT_MIN = -2147483648;

  // Handle sign
  bool isNegative = x < 0;
  String numStr = x.abs().toString();

  // Reverse the string
  String reversed = numStr.split('').reversed.join('');

  // Parse back to integer
  int result = int.parse(reversed);

  // Apply sign
  if (isNegative) {
    result = -result;
  }

  // Check overflow
  if (result > INT_MAX || result < INT_MIN) {
    return 0;
  }

  return result;
}

/// Mathematical approach with detailed explanation
int reverseIntegerExplained(int x) {
  print('\nReversing $x:');

  const int INT_MAX = 2147483647;
  const int INT_MIN = -2147483648;

  int result = 0;
  int num = x;
  int step = 1;

  while (num != 0) {
    int digit = num % 10;
    num ~/= 10;

    print('Step $step: digit = $digit, num = $num, result = $result');

    // Overflow check
    if (result > INT_MAX ~/ 10) {
      print('Overflow detected: result > ${INT_MAX ~/ 10}');
      return 0;
    }
    if (result < INT_MIN ~/ 10) {
      print('Underflow detected: result < ${INT_MIN ~/ 10}');
      return 0;
    }

    result = result * 10 + digit;
    print('New result: $result');
    step++;
  }

  return result;
}

/// Visualization of the algorithm:
///
/// Example 1: x = 123
/// Step 1: digit = 3, num = 12, result = 0  → result = 0 * 10 + 3 = 3
/// Step 2: digit = 2, num = 1,  result = 3  → result = 3 * 10 + 2 = 32
/// Step 3: digit = 1, num = 0,  result = 32 → result = 32 * 10 + 1 = 321
/// Output: 321
///
/// Example 2: x = -123
/// Step 1: digit = -3, num = -12, result = 0  → result = 0 * 10 + (-3) = -3
/// Step 2: digit = -2, num = -1,  result = -3 → result = -3 * 10 + (-2) = -32
/// Step 3: digit = -1, num = 0,   result = -32 → result = -32 * 10 + (-1) = -321
/// Output: -321
///
/// Example 3: x = 1534236469 (overflow case)
/// Reversed would be 9646324351, which exceeds INT_MAX (2147483647)
/// Algorithm detects overflow and returns 0
///
/// Key Points:
/// 1. Handle both positive and negative numbers
/// 2. Extract digits using modulo (%) operation
/// 3. Remove last digit using integer division (~/)
/// 4. Check for overflow BEFORE multiplying by 10
/// 5. Return 0 if overflow/underflow is detected
