function isPalindromeNumber(num: number): boolean {
  const str = num.toString();

  const reversed = str.split('').reverse().join('');

  return str === reversed;
}

const number = 121;
if (isPalindromeNumber(number)) {
  console.log(`${number} is a palindrome.`);
} else {
  console.log(`${number} is not a palindrome.`);
}
