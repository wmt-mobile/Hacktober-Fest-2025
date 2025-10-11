/// Question 1: Write an Algorithm to Find the Sum of All the Digits of a Number
///
/// This program calculates the sum of all digits in a given number.
/// It handles both positive and negative numbers.

void main() {
  // Test cases
  print('Sum of digits in 12345: ${sumOfDigits(12345)}');
  print('Sum of digits in 999: ${sumOfDigits(999)}');
  print('Sum of digits in -456: ${sumOfDigits(-456)}');
  print('Sum of digits in 0: ${sumOfDigits(0)}');
  print('Sum of digits in 1000000: ${sumOfDigits(1000000)}');
}

/// Algorithm to find sum of all digits in a number
///
/// Time Complexity: O(log n) where n is the input number
/// Space Complexity: O(1)
///
/// @param number - The input number
/// @return The sum of all digits
int sumOfDigits(int number) {
  // Handle negative numbers by converting to absolute value
  int num = number.abs();
  int sum = 0;

  // Extract each digit and add to sum
  while (num > 0) {
    sum += num % 10;  // Get the last digit
    num ~/= 10;       // Remove the last digit
  }

  return sum;
}

/// Alternative approach using string conversion
int sumOfDigitsAlternative(int number) {
  return number
      .abs()
      .toString()
      .split('')
      .map((digit) => int.parse(digit))
      .reduce((sum, digit) => sum + digit);
}
