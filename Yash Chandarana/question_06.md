def lengthOfLongestSubstring(s: str) -> int:
    # Dictionary to store the last seen index of each character
    char_map = {}
    # Start of the sliding window
    start = 0
    # Maximum length of substring without repeating characters
    max_len = 0
    
    # Iterate through the string
    for end in range(len(s)):
        # If the character is in the window (i.e., it has been seen before)
        if s[end] in char_map and char_map[s[end]] >= start:
            # Move the start of the window to the right of the last occurrence
            start = char_map[s[end]] + 1
        
        # Update the last seen index of the current character
        char_map[s[end]] = end
        
        # Calculate the current length of the substring and update the max length
        max_len = max(max_len, end - start + 1)
    
    return max_len

# Test cases
print(lengthOfLongestSubstring("abcabcbb"))  # Output: 3
print(lengthOfLongestSubstring("bbbbb"))     # Output: 1
print(lengthOfLongestSubstring("pwwkew"))    # Output: 3
