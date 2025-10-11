// Palindrome Partitioning - Minimum Cuts

function minCut(s) {
  const n = s.length;
  const isPalindrome = Array.from({ length: n }, () => Array(n).fill(false));

  // Step 1: Precompute palindrome substrings
  for (let i = 0; i < n; i++) {
    isPalindrome[i][i] = true;
  }

  for (let length = 2; length <= n; length++) {
    for (let i = 0; i <= n - length; i++) {
      const j = i + length - 1;
      if (s[i] === s[j]) {
        isPalindrome[i][j] = length === 2 ? true : isPalindrome[i + 1][j - 1];
      }
    }
  }

  // Step 2: DP for minimum cuts
  const cuts = Array(n).fill(0);
  for (let i = 0; i < n; i++) {
    if (isPalindrome[0][i]) {
      cuts[i] = 0;
    } else {
      let minCuts = Infinity;
      for (let j = 0; j < i; j++) {
        if (isPalindrome[j + 1][i]) {
          minCuts = Math.min(minCuts, cuts[j] + 1);
        }
      }
      cuts[i] = minCuts;
    }
  }

  return cuts[n - 1];
}

// ✅ Test cases
console.log(minCut("aab")); // 1
console.log(minCut("a")); // 0
console.log(minCut("ab")); // 1
console.log(minCut("aabb")); // 1 (["aa","bb"])
console.log(minCut("racecar")); // 0
//0