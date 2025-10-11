/**
 * Distinct Subsequences - Dynamic Programming
 * 
 * Time Complexity: O(m * n) where m = s.length, n = t.length
 * Space Complexity: O(m * n)
 */

function numDistinct(s, t) {
  const m = s.length;
  const n = t.length;
  
  // dp[i][j] = number of distinct subsequences of s[0...i-1] that equal t[0...j-1]
  const dp = Array(m + 1).fill(0).map(() => Array(n + 1).fill(0));
  
  // Base case: empty string t can be formed from any prefix of s in exactly 1 way
  for (let i = 0; i <= m; i++) {
    dp[i][0] = 1;
  }
  
  // Fill the DP table
  for (let i = 1; i <= m; i++) {
    for (let j = 1; j <= n; j++) {
      // Case 1: Don't use s[i-1] to match t[j-1]
      dp[i][j] = dp[i - 1][j];
      
      // Case 2: If characters match, we can also use s[i-1] to match t[j-1]
      if (s[i - 1] === t[j - 1]) {
        dp[i][j] += dp[i - 1][j - 1];
      }
    }
  }
  
  return dp[m][n];
}

// Space-optimized version using 1D array
function numDistinctOptimized(s, t) {
  const m = s.length;
  const n = t.length;
  
  // dp[j] = number of distinct subsequences that equal t[0...j-1]
  const dp = Array(n + 1).fill(0);
  dp[0] = 1; // Empty string
  
  for (let i = 1; i <= m; i++) {
    // Traverse from right to left to avoid overwriting values we need
    for (let j = n; j >= 1; j--) {
      if (s[i - 1] === t[j - 1]) {
        dp[j] += dp[j - 1];
      }
    }
  }
  
  return dp[n];
}

// Test cases
console.log("Test Case 1:");
console.log("s = 'rabbbit', t = 'rabbit'");
console.log("Output:", numDistinct("rabbbit", "rabbit")); // 3
console.log("Output (Optimized):", numDistinctOptimized("rabbbit", "rabbit")); // 3
console.log();

console.log("Test Case 2:");
console.log("s = 'babgbag', t = 'bag'");
console.log("Output:", numDistinct("babgbag", "bag")); // 5
console.log("Output (Optimized):", numDistinctOptimized("babgbag", "bag")); // 5
console.log();

console.log("Additional Test:");
console.log("s = 'abc', t = 'abc'");
console.log("Output:", numDistinct("abc", "abc")); // 1
console.log();

console.log("Edge Case:");
console.log("s = 'abc', t = 'def'");
console.log("Output:", numDistinct("abc", "def")); // 0