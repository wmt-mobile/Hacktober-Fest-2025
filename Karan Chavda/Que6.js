/**
 * Maximum Profit with At Most Two Transactions
 * 
 * Time Complexity: O(n)
 * Space Complexity: O(1)
 */

function maxProfit(prices) {
  if (prices.length === 0) return 0;
  
  // State variables for two transactions
  let buy1 = -prices[0];  // Max profit after first buy
  let sell1 = 0;          // Max profit after first sell
  let buy2 = -prices[0];  // Max profit after second buy
  let sell2 = 0;          // Max profit after second sell
  
  for (let i = 1; i < prices.length; i++) {
    const price = prices[i];
    
    // First transaction
    buy1 = Math.max(buy1, -price);           // Buy at current price or keep previous
    sell1 = Math.max(sell1, buy1 + price);   // Sell at current price or keep previous
    
    // Second transaction (uses profit from first)
    buy2 = Math.max(buy2, sell1 - price);    // Buy at current price using first profit
    sell2 = Math.max(sell2, buy2 + price);   // Sell at current price
  }
  
  return sell2;
}

// Alternative DP approach with explicit states
function maxProfitDP(prices) {
  if (prices.length === 0) return 0;
  
  const n = prices.length;
  const k = 2; // At most 2 transactions
  
  // dp[i][j] = max profit at day i with at most j transactions completed
  const dp = Array(n).fill(0).map(() => Array(k + 1).fill(0));
  
  for (let j = 1; j <= k; j++) {
    let maxDiff = -prices[0]; // Max of (dp[t-1][j-1] - prices[t])
    
    for (let i = 1; i < n; i++) {
      dp[i][j] = Math.max(dp[i - 1][j], prices[i] + maxDiff);
      maxDiff = Math.max(maxDiff, dp[i][j - 1] - prices[i]);
    }
  }
  
  return dp[n - 1][k];
}

// Test cases
console.log("Test Case 1:");
console.log("prices = [3,3,5,0,0,3,1,4]");
console.log("Output:", maxProfit([3,3,5,0,0,3,1,4])); // 6
console.log("Output (DP):", maxProfitDP([3,3,5,0,0,3,1,4])); // 6
console.log("Explanation: Buy at 0, sell at 3, profit = 3. Buy at 1, sell at 4, profit = 3. Total = 6");
console.log();

console.log("Test Case 2:");
console.log("prices = [1,2,3,4,5]");
console.log("Output:", maxProfit([1,2,3,4,5])); // 4
console.log("Output (DP):", maxProfitDP([1,2,3,4,5])); // 4
console.log("Explanation: Buy at 1, sell at 5, profit = 4");
console.log();

console.log("Test Case 3:");
console.log("prices = [7,6,4,3,1]");
console.log("Output:", maxProfit([7,6,4,3,1])); // 0
console.log("Output (DP):", maxProfitDP([7,6,4,3,1])); // 0
console.log("Explanation: No transactions, max profit = 0");
console.log();

console.log("Additional Test:");
console.log("prices = [1,2,4,2,5,7,2,4,9,0]");
console.log("Output:", maxProfit([1,2,4,2,5,7,2,4,9,0])); // 13
console.log("Explanation: Buy at 1, sell at 7 (profit=6). Buy at 2, sell at 9 (profit=7). Total = 13");