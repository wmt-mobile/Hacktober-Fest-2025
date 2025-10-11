/// Question 4: Median of Two Sorted Arrays
///
/// Given two sorted arrays nums1 and nums2 of size m and n respectively,
/// return the median of the two sorted arrays.
/// The overall run time complexity should be O(log (m+n)).

void main() {
  // Test cases
  print('Test Case 1:');
  List<int> nums1 = [1, 3];
  List<int> nums2 = [2];
  print('nums1 = $nums1, nums2 = $nums2');
  print('Median: ${findMedianSortedArrays(nums1, nums2)}');
  print('Expected: 2.00000\n');

  print('Test Case 2:');
  nums1 = [1, 2];
  nums2 = [3, 4];
  print('nums1 = $nums1, nums2 = $nums2');
  print('Median: ${findMedianSortedArrays(nums1, nums2)}');
  print('Expected: 2.50000\n');

  print('Test Case 3:');
  nums1 = [];
  nums2 = [1];
  print('nums1 = $nums1, nums2 = $nums2');
  print('Median: ${findMedianSortedArrays(nums1, nums2)}');
  print('Expected: 1.00000\n');

  print('Test Case 4:');
  nums1 = [1, 3, 5, 7, 9];
  nums2 = [2, 4, 6, 8, 10];
  print('nums1 = $nums1, nums2 = $nums2');
  print('Median: ${findMedianSortedArrays(nums1, nums2)}');
  print('Expected: 5.50000\n');

  print('Test Case 5:');
  nums1 = [1, 2, 3, 4, 5];
  nums2 = [6, 7, 8, 9, 10];
  print('nums1 = $nums1, nums2 = $nums2');
  print('Median: ${findMedianSortedArrays(nums1, nums2)}');
  print('Expected: 5.50000\n');
}

/// Finds the median of two sorted arrays using binary search
///
/// Time Complexity: O(log(min(m, n))) where m and n are lengths of arrays
/// Space Complexity: O(1)
///
/// Algorithm:
/// 1. Ensure nums1 is the smaller array (for optimization)
/// 2. Use binary search on the smaller array
/// 3. Partition both arrays such that:
///    - Left half contains smaller elements
///    - Right half contains larger elements
/// 4. Calculate median based on the partition
double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  // Ensure nums1 is the smaller array for binary search optimization
  if (nums1.length > nums2.length) {
    return findMedianSortedArrays(nums2, nums1);
  }

  int m = nums1.length;
  int n = nums2.length;
  int left = 0;
  int right = m;

  while (left <= right) {
    // Partition nums1
    int partition1 = (left + right) ~/ 2;

    // Partition nums2 such that total left half = total right half
    int partition2 = (m + n + 1) ~/ 2 - partition1;

    // Get boundary elements
    // Use negative/positive infinity for edge cases
    int maxLeft1 = (partition1 == 0)
        ? double.negativeInfinity.toInt()
        : nums1[partition1 - 1];
    int minRight1 = (partition1 == m)
        ? double.infinity.toInt()
        : nums1[partition1];

    int maxLeft2 = (partition2 == 0)
        ? double.negativeInfinity.toInt()
        : nums2[partition2 - 1];
    int minRight2 = (partition2 == n)
        ? double.infinity.toInt()
        : nums2[partition2];

    // Check if we found the correct partition
    if (maxLeft1 <= minRight2 && maxLeft2 <= minRight1) {
      // If total length is even
      if ((m + n) % 2 == 0) {
        return (maxOf(maxLeft1, maxLeft2) + minOf(minRight1, minRight2)) / 2.0;
      } else {
        // If total length is odd
        return maxOf(maxLeft1, maxLeft2).toDouble();
      }
    } else if (maxLeft1 > minRight2) {
      // We are too far on the right side for partition1, go left
      right = partition1 - 1;
    } else {
      // We are too far on the left side for partition1, go right
      left = partition1 + 1;
    }
  }

  throw Exception('Input arrays are not sorted or invalid');
}

/// Helper function to find maximum of two numbers
int maxOf(int a, int b) {
  return a > b ? a : b;
}

/// Helper function to find minimum of two numbers
int minOf(int a, int b) {
  return a < b ? a : b;
}

/// Alternative approach: Merge and find median (O(m + n) time)
/// This approach is simpler but doesn't meet the O(log(m+n)) requirement
double findMedianSortedArraysSimple(List<int> nums1, List<int> nums2) {
  List<int> merged = [];
  int i = 0, j = 0;

  // Merge two sorted arrays
  while (i < nums1.length && j < nums2.length) {
    if (nums1[i] < nums2[j]) {
      merged.add(nums1[i++]);
    } else {
      merged.add(nums2[j++]);
    }
  }

  // Add remaining elements
  while (i < nums1.length) {
    merged.add(nums1[i++]);
  }
  while (j < nums2.length) {
    merged.add(nums2[j++]);
  }

  // Find median
  int length = merged.length;
  if (length % 2 == 0) {
    return (merged[length ~/ 2 - 1] + merged[length ~/ 2]) / 2.0;
  } else {
    return merged[length ~/ 2].toDouble();
  }
}

/// Visualization of the binary search approach:
///
/// Example: nums1 = [1, 3], nums2 = [2]
///
/// Step 1: Partition the arrays
/// nums1: [1 | 3]    partition1 = 1
/// nums2: [2 |  ]    partition2 = 1
///
/// Left half: [1, 2]  Right half: [3]
/// maxLeft1 = 1, minRight1 = 3
/// maxLeft2 = 2, minRight2 = infinity
///
/// Check: 1 <= infinity ✓ and 2 <= 3 ✓
/// Total length = 3 (odd)
/// Median = max(1, 2) = 2
