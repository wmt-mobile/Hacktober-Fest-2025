/**
 * Scrambled String - Dynamic Programming with Memoization
 * 
 * Time Complexity: O(n^4) where n is the length of the string
 * Space Complexity: O(n^3) for memoization
 */

function isScramble(s1, s2) {
  if (s1.length !== s2.length) return false;
  if (s1 === s2) return true;
  
  // Memoization map: key = "s1:s2"
  const memo = new Map();
  
  function helper(str1, str2) {
    // Base cases
    if (str1 === str2) return true;
    if (str1.length !== str2.length) return false;
    if (str1.length === 1) return str1 === str2;
    
    // Check memoization
    const key = `${str1}:${str2}`;
    if (memo.has(key)) return memo.get(key);
    
    // Check if characters frequency match (optimization)
    const freq1 = new Array(26).fill(0);
    const freq2 = new Array(26).fill(0);
    for (let i = 0; i < str1.length; i++) {
      freq1[str1.charCodeAt(i) - 97]++;
      freq2[str2.charCodeAt(i) - 97]++;
    }
    for (let i = 0; i < 26; i++) {
      if (freq1[i] !== freq2[i]) {
        memo.set(key, false);
        return false;
      }
    }
    
    const n = str1.length;
    
    // Try all possible split points
    for (let i = 1; i < n; i++) {
      // Case 1: No swap - s1[0:i] matches s2[0:i] AND s1[i:n] matches s2[i:n]
      if (helper(str1.substring(0, i), str2.substring(0, i)) &&
          helper(str1.substring(i), str2.substring(i))) {
        memo.set(key, true);
        return true;
      }
      
      // Case 2: Swap - s1[0:i] matches s2[n-i:n] AND s1[i:n] matches s2[0:n-i]
      if (helper(str1.substring(0, i), str2.substring(n - i)) &&
          helper(str1.substring(i), str2.substring(0, n - i))) {
        memo.set(key, true);
        return true;
      }
    }
    
    memo.set(key, false);
    return false;
  }
  
  return helper(s1, s2);
}

// Test cases
console.log("Test Case 1:");
console.log("s1 = 'great', s2 = 'rgeat'");
console.log("Output:", isScramble("great", "rgeat")); // true
console.log();

console.log("Test Case 2:");
console.log("s1 = 'abcde', s2 = 'caebd'");
console.log("Output:", isScramble("abcde", "caebd")); // false
console.log();

console.log("Test Case 3:");
console.log("s1 = 'a', s2 = 'a'");
console.log("Output:", isScramble("a", "a")); // true
console.log();

console.log("Additional Test:");
console.log("s1 = 'abc', s2 = 'bca'");
console.log("Output:", isScramble("abc", "bca")); // true