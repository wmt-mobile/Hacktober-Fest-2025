void main() {
  print(isMatch("aa", "a"));
  print(isMatch("aa", "a*"));
  print(isMatch("ab", ".*"));
  print(isMatch("mississippi", "mis*is*p*."));
  print(isMatch("mississippi", "mis*is*ip*."));
}

bool isMatch(String s, String p) {
  int m = s.length;
  int n = p.length;

  List<List<bool>> dp = List.generate(
      m + 1, (_) => List.filled(n + 1, false, growable: false),
      growable: false);

  dp[0][0] = true;

  for (int j = 1; j < n + 1; j++) {
    if (p[j - 1] == '*') {
      dp[0][j] = dp[0][j - 2];
    }
  }

  for (int i = 1; i <= m; i++) {
    for (int j = 1; j <= n; j++) {
      if (p[j - 1] == '.' || p[j - 1] == s[i - 1]) {
         dp[i][j] = dp[i - 1][j - 1];
      } else if (p[j - 1] == '*') {
         dp[i][j] = dp[i][j - 2];

         if (p[j - 2] == '.' || p[j - 2] == s[i - 1]) {
          dp[i][j] = dp[i][j] || dp[i - 1][j];
        }
      }
    }
  }

  return dp[m][n];
}
