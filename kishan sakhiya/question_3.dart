void main() {
  print(isPalindrome(121));   // true
  print(isPalindrome(-121));  // false
  print(isPalindrome(10));    // false
  print(isPalindrome(1221));  // true
}

bool isPalindrome(int x) {
  // Negative numbers are not palindrome
  if (x < 0) return false;

  // Convert number to string
  String str = x.toString();

  // Reverse the string
  String reversed = str.split('').reversed.join('');

  // Compare original and reversed
  return str == reversed;
}
