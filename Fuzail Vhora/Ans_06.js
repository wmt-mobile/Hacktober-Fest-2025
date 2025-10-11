// Candy Distribution - Two-Pass Greedy

function candy(ratings) {
  const n = ratings.length;
  const candies = Array(n).fill(1);

  // Left to Right: ensure right neighbor rule
  for (let i = 1; i < n; i++) {
    if (ratings[i] > ratings[i - 1]) {
      candies[i] = candies[i - 1] + 1;
    }
  }

  // Right to Left: ensure left neighbor rule
  for (let i = n - 2; i >= 0; i--) {
    if (ratings[i] > ratings[i + 1]) {
      candies[i] = Math.max(candies[i], candies[i + 1] + 1);
    }
  }

  return candies.reduce((sum, c) => sum + c, 0);
}

// ✅ Test cases
console.log(candy([1, 0, 2])); // 5 -> [2,1,2]
console.log(candy([1, 2, 2])); // 4 -> [1,2,1]
console.log(candy([1, 3, 4, 5, 2])); // 11 -> [1,2,3,4,1]
console.log(candy([1, 2, 3, 2, 1])); // 9 -> [1,2,3,2,1]
console.log(candy([5, 3, 1])); // 6 -> [3,2,1]
