# Question 4: Write a logic for reversing a linked list

## Answer:

Here are multiple approaches to reverse a linked list:

## **Approach 1: Iterative Solution (Most Efficient)**

**Time Complexity:** O(n)  
**Space Complexity:** O(1)

```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

def reverseList(head):
    """
    Reverse a singly linked list iteratively.
    """
    prev = None
    current = head
    
    while current is not None:
        # Store next node
        next_node = current.next
        
        # Reverse the link
        current.next = prev
        
        # Move prev and current one step forward
        prev = current
        current = next_node
    
    # prev is now the new head
    return prev
```

### **Step-by-step visualization:**
```
Initial:     1 -> 2 -> 3 -> 4 -> None
            
Step 1:      None <- 1    2 -> 3 -> 4 -> None
             prev   curr  next

Step 2:      None <- 1 <- 2    3 -> 4 -> None
                    prev  curr next

Step 3:      None <- 1 <- 2 <- 3    4 -> None
                         prev  curr next

Step 4:      None <- 1 <- 2 <- 3 <- 4
                              prev  curr=None

Result:      4 -> 3 -> 2 -> 1 -> None
```

## **Approach 2: Recursive Solution**

**Time Complexity:** O(n)  
**Space Complexity:** O(n) due to recursion stack

```python
def reverseListRecursive(head):
    """
    Reverse a singly linked list recursively.
    """
    # Base case: empty list or single node
    if head is None or head.next is None:
        return head
    
    # Recursively reverse the rest of the list
    new_head = reverseListRecursive(head.next)
    
    # Reverse the link
    head.next.next = head
    head.next = None
    
    return new_head
```

### **Visualization:**
```
reverseList(1 -> 2 -> 3 -> 4 -> None)
    |
    v
reverseList(2 -> 3 -> 4 -> None)
    |
    v
reverseList(3 -> 4 -> None)
    |
    v
reverseList(4 -> None)  [Base case, return 4]
    |
    v
3.next.next = 3  =>  4 -> 3
3.next = None
return 4
    |
    v
2.next.next = 2  =>  4 -> 3 -> 2
2.next = None
return 4
    |
    v
1.next.next = 1  =>  4 -> 3 -> 2 -> 1
1.next = None
return 4 (new head)
```

## **Approach 3: Using Stack**

**Time Complexity:** O(n)  
**Space Complexity:** O(n)

```python
def reverseListStack(head):
    """
    Reverse a singly linked list using a stack.
    """
    if not head:
        return None
    
    stack = []
    current = head
    
    # Push all nodes to stack
    while current:
        stack.append(current)
        current = current.next
    
    # Pop nodes and reverse links
    new_head = stack.pop()
    current = new_head
    
    while stack:
        node = stack.pop()
        current.next = node
        current = current.next
    
    current.next = None
    return new_head
```

## **Complete Implementation:**

```python
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

class LinkedListReversal:
    
    # Method 1: Iterative (Best)
    @staticmethod
    def reverseIterative(head):
        prev = None
        current = head
        
        while current:
            next_node = current.next
            current.next = prev
            prev = current
            current = next_node
            
        return prev
    
    # Method 2: Recursive
    @staticmethod
    def reverseRecursive(head):
        if not head or not head.next:
            return head
        
        new_head = LinkedListReversal.reverseRecursive(head.next)
        head.next.next = head
        head.next = None
        
        return new_head
    
    # Helper: Print list
    @staticmethod
    def printList(head):
        result = []
        current = head
        while current:
            result.append(str(current.val))
            current = current.next
        return " -> ".join(result)
    
    # Helper: Create list from array
    @staticmethod
    def createList(arr):
        if not arr:
            return None
        head = ListNode(arr[0])
        current = head
        for val in arr[1:]:
            current.next = ListNode(val)
            current = current.next
        return head

# Test the implementations
if __name__ == "__main__":
    # Create test list: 1 -> 2 -> 3 -> 4 -> 5
    arr = [1, 2, 3, 4, 5]
    
    # Test iterative
    head1 = LinkedListReversal.createList(arr)
    print("Original:", LinkedListReversal.printList(head1))
    reversed1 = LinkedListReversal.reverseIterative(head1)
    print("Reversed (Iterative):", LinkedListReversal.printList(reversed1))
    
    # Test recursive
    head2 = LinkedListReversal.createList(arr)
    reversed2 = LinkedListReversal.reverseRecursive(head2)
    print("Reversed (Recursive):", LinkedListReversal.printList(reversed2))
```

## **JavaScript Implementation:**

```javascript
class ListNode {
    constructor(val = 0, next = null) {
        this.val = val;
        this.next = next;
    }
}

// Iterative approach
function reverseList(head) {
    let prev = null;
    let current = head;
    
    while (current !== null) {
        const nextNode = current.next;
        current.next = prev;
        prev = current;
        current = nextNode;
    }
    
    return prev;
}

// Recursive approach
function reverseListRecursive(head) {
    if (head === null || head.next === null) {
        return head;
    }
    
    const newHead = reverseListRecursive(head.next);
    head.next.next = head;
    head.next = null;
    
    return newHead;
}
```

## **PHP Implementation:**

```php
<?php

class ListNode {
    public $val;
    public $next;
    
    public function __construct($val = 0, $next = null) {
        $this->val = $val;
        $this->next = $next;
    }
}

class LinkedListReversal {
    
    // Iterative approach
    public static function reverseIterative($head) {
        $prev = null;
        $current = $head;
        
        while ($current !== null) {
            $nextNode = $current->next;
            $current->next = $prev;
            $prev = $current;
            $current = $nextNode;
        }
        
        return $prev;
    }
    
    // Recursive approach
    public static function reverseRecursive($head) {
        if ($head === null || $head->next === null) {
            return $head;
        }
        
        $newHead = self::reverseRecursive($head->next);
        $head->next->next = $head;
        $head->next = null;
        
        return $newHead;
    }
}
```

## **Comparison:**

| Approach | Time | Space | Pros | Cons |
|----------|------|-------|------|------|
| **Iterative** | O(n) | O(1) | Most efficient, simple | None |
| **Recursive** | O(n) | O(n) | Elegant, easier to understand | Stack overflow risk for large lists |
| **Stack-based** | O(n) | O(n) | Good for learning | Extra space, less efficient |

## **Recommendation:**
**Use the iterative approach** for production code as it's the most efficient with O(1) space complexity and no risk of stack overflow.

---

**Contributor:** Aman Vaghela  
**Topic:** Data Structures - Linked Lists  
**Hacktoberfest 2025**

