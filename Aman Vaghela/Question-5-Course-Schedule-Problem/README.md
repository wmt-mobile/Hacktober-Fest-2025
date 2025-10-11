# Question 5: Course Schedule Problem

## Problem Statement:

There are a total of `numCourses` courses you have to take, labeled from `0` to `numCourses - 1`.  

You are given an array `prerequisites` where `prerequisites[i] = [ai, bi]` indicates that you must take course `bi` first if you want to take course `ai`.  

For example, the pair `[0, 1]` indicates that to take course `0` you have to first take course `1`.  

Return `true` if you can finish all courses. Otherwise, return `false`.

### Example 1

**Input:**  
numCourses = 2, prerequisites = [[1,0]]

**Output:**  
true

**Explanation:**  
There are a total of 2 courses to take. To take course 1 you should have finished course 0. So it is possible.

### Example 2

**Input:**  
numCourses = 2, prerequisites = [[1,0],[0,1]]

**Output:**  
false

**Explanation:**  
There are a total of 2 courses to take. To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.

---

## Solution:

This problem is essentially asking us to **detect if there's a cycle in a directed graph**. If there's a cycle, it's impossible to complete all courses.

**Key Insight:** This is a **Topological Sort** problem. If we can perform a topological sort on all courses, they can be completed.

## **Approach 1: DFS with Cycle Detection (Best)**

**Time Complexity:** O(V + E) where V = number of courses, E = number of prerequisites  
**Space Complexity:** O(V + E) for adjacency list and recursion stack

```python
def canFinish(numCourses, prerequisites):
    """
    Determine if you can finish all courses using DFS cycle detection.
    """
    # Build adjacency list
    graph = [[] for _ in range(numCourses)]
    for course, prereq in prerequisites:
        graph[course].append(prereq)
    
    # States: 0 = unvisited, 1 = visiting (in current path), 2 = visited
    state = [0] * numCourses
    
    def hasCycle(course):
        """Check if course leads to a cycle."""
        if state[course] == 1:  # Currently visiting - found cycle!
            return True
        if state[course] == 2:  # Already visited - no cycle from here
            return False
        
        # Mark as visiting
        state[course] = 1
        
        # Check all prerequisites
        for prereq in graph[course]:
            if hasCycle(prereq):
                return True
        
        # Mark as visited
        state[course] = 2
        return False
    
    # Check each course
    for course in range(numCourses):
        if hasCycle(course):
            return False
    
    return True


# Test cases
print(canFinish(2, [[1,0]]))           # True
print(canFinish(2, [[1,0],[0,1]]))     # False
print(canFinish(5, [[1,4],[2,4],[3,1],[3,2]]))  # True
```

### **Visualization for Example 2:**
```
Prerequisites: [[1,0],[0,1]]

Graph:
Course 1 -> Course 0
Course 0 -> Course 1

DFS from Course 0:
- Mark 0 as visiting (state[0] = 1)
- Go to prerequisite 1
  - Mark 1 as visiting (state[1] = 1)
  - Go to prerequisite 0
    - state[0] = 1 (visiting!) -> CYCLE DETECTED!
```

## **Approach 2: BFS with Kahn's Algorithm (Topological Sort)**

**Time Complexity:** O(V + E)  
**Space Complexity:** O(V + E)

```python
from collections import deque, defaultdict

def canFinishBFS(numCourses, prerequisites):
    """
    Determine if you can finish all courses using Kahn's Algorithm.
    """
    # Build graph and in-degree array
    graph = defaultdict(list)
    in_degree = [0] * numCourses
    
    for course, prereq in prerequisites:
        graph[prereq].append(course)
        in_degree[course] += 1
    
    # Queue of courses with no prerequisites
    queue = deque([i for i in range(numCourses) if in_degree[i] == 0])
    completed = 0
    
    while queue:
        course = queue.popleft()
        completed += 1
        
        # Remove this course from graph
        for next_course in graph[course]:
            in_degree[next_course] -= 1
            if in_degree[next_course] == 0:
                queue.append(next_course)
    
    # If we completed all courses, no cycle exists
    return completed == numCourses


# Test cases
print(canFinishBFS(2, [[1,0]]))        # True
print(canFinishBFS(2, [[1,0],[0,1]]))  # False
```

### **Visualization for Example 1:**
```
Prerequisites: [[1,0]]
numCourses = 2

Graph:
Course 0 -> Course 1

In-degree: [0, 1]
           Course 0 has 0 prerequisites
           Course 1 has 1 prerequisite (Course 0)

Step 1: Queue = [0] (courses with no prerequisites)
        completed = 0

Step 2: Process Course 0
        completed = 1
        Remove edge 0->1, in_degree[1] = 0
        Queue = [1]

Step 3: Process Course 1
        completed = 2
        Queue = []

completed == numCourses (2 == 2) -> True
```

## **Complete Implementation:**

```python
from collections import deque, defaultdict

class CourseSchedule:
    
    # Method 1: DFS with Cycle Detection
    @staticmethod
    def canFinishDFS(numCourses, prerequisites):
        # Build adjacency list
        graph = [[] for _ in range(numCourses)]
        for course, prereq in prerequisites:
            graph[course].append(prereq)
        
        # 0: unvisited, 1: visiting, 2: visited
        state = [0] * numCourses
        
        def dfs(course):
            if state[course] == 1:  # Cycle detected
                return False
            if state[course] == 2:  # Already processed
                return True
            
            state[course] = 1  # Mark as visiting
            
            for prereq in graph[course]:
                if not dfs(prereq):
                    return False
            
            state[course] = 2  # Mark as visited
            return True
        
        for course in range(numCourses):
            if not dfs(course):
                return False
        
        return True
    
    # Method 2: BFS (Kahn's Algorithm)
    @staticmethod
    def canFinishBFS(numCourses, prerequisites):
        graph = defaultdict(list)
        in_degree = [0] * numCourses
        
        for course, prereq in prerequisites:
            graph[prereq].append(course)
            in_degree[course] += 1
        
        queue = deque([i for i in range(numCourses) if in_degree[i] == 0])
        completed = 0
        
        while queue:
            course = queue.popleft()
            completed += 1
            
            for next_course in graph[course]:
                in_degree[next_course] -= 1
                if in_degree[next_course] == 0:
                    queue.append(next_course)
        
        return completed == numCourses
    
    # Bonus: Return the actual order of courses (if possible)
    @staticmethod
    def findOrder(numCourses, prerequisites):
        graph = defaultdict(list)
        in_degree = [0] * numCourses
        
        for course, prereq in prerequisites:
            graph[prereq].append(course)
            in_degree[course] += 1
        
        queue = deque([i for i in range(numCourses) if in_degree[i] == 0])
        order = []
        
        while queue:
            course = queue.popleft()
            order.append(course)
            
            for next_course in graph[course]:
                in_degree[next_course] -= 1
                if in_degree[next_course] == 0:
                    queue.append(next_course)
        
        return order if len(order) == numCourses else []
```

## **JavaScript Implementation:**

```javascript
// DFS Approach
function canFinish(numCourses, prerequisites) {
    // Build adjacency list
    const graph = Array.from({ length: numCourses }, () => []);
    for (const [course, prereq] of prerequisites) {
        graph[course].push(prereq);
    }
    
    const state = new Array(numCourses).fill(0);
    
    function hasCycle(course) {
        if (state[course] === 1) return true;  // Cycle
        if (state[course] === 2) return false; // Visited
        
        state[course] = 1;
        
        for (const prereq of graph[course]) {
            if (hasCycle(prereq)) return true;
        }
        
        state[course] = 2;
        return false;
    }
    
    for (let i = 0; i < numCourses; i++) {
        if (hasCycle(i)) return false;
    }
    
    return true;
}
```

## **PHP Implementation:**

```php
<?php

class CourseSchedule {
    
    public static function canFinish($numCourses, $prerequisites) {
        // Build adjacency list
        $graph = array_fill(0, $numCourses, []);
        foreach ($prerequisites as [$course, $prereq]) {
            $graph[$course][] = $prereq;
        }
        
        $state = array_fill(0, $numCourses, 0);
        
        $hasCycle = function($course) use (&$hasCycle, $graph, &$state) {
            if ($state[$course] === 1) return true;  // Cycle
            if ($state[$course] === 2) return false; // Visited
            
            $state[$course] = 1;
            
            foreach ($graph[$course] as $prereq) {
                if ($hasCycle($prereq)) return true;
            }
            
            $state[$course] = 2;
            return false;
        };
        
        for ($i = 0; $i < $numCourses; $i++) {
            if ($hasCycle($i)) return false;
        }
        
        return true;
    }
}
```

## **Complexity Analysis:**

| Approach | Time | Space | Best For |
|----------|------|-------|----------|
| **DFS** | O(V + E) | O(V + E) | Cycle detection, cleaner code |
| **BFS (Kahn's)** | O(V + E) | O(V + E) | Finding topological order |

## **Key Concepts:**

1. **Cycle Detection:** The core problem is detecting cycles in a directed graph
2. **Graph Representation:** Use adjacency list for efficiency
3. **State Tracking:** In DFS, we need 3 states (unvisited, visiting, visited)
4. **Topological Sort:** If topological sort is possible, courses can be completed

## **When to Use Each Approach:**

- **DFS:** When you only need to know if completion is possible
- **BFS (Kahn's):** When you need the actual order of courses

---

**Contributor:** Aman Vaghela  
**Topic:** Graph Algorithms - Topological Sort  
**Hacktoberfest 2025**

