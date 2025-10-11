# Question 1: How do you prevent the N+1 query problem in Eloquent relationships beyond just `with()`?

## Answer:

Beyond `with()`, there are several advanced techniques to prevent N+1 query problems in Laravel Eloquent:

### **1. Lazy Eager Loading with `load()`:**
```php
$users = User::all();
// Later in code, if you realize you need posts
if ($someCondition) {
    $users->load('posts');
}
```

### **2. Eager Loading Constraints:**
```php
$users = User::with(['posts' => function($query) {
    $query->where('published', true)->orderBy('created_at', 'desc');
}])->get();
```

### **3. `loadMissing()` - Prevents Reloading:**
```php
$users->loadMissing('posts'); // Only loads if not already loaded
```

### **4. `withCount()` for Counting Relationships:**
```php
$users = User::withCount('posts')->get();
// Access via $user->posts_count
```

### **5. `withExists()` for Existence Check:**
```php
$users = User::withExists('posts')->get();
// Access via $user->posts_exists
```

### **6. Subquery Selects:**
```php
use App\Models\Post;

$users = User::select(['users.*'])->selectSub(function($query) {
    $query->selectRaw('count(*)')
          ->from('posts')
          ->whereColumn('posts.user_id', 'users.id');
}, 'posts_count')->get();
```

### **7. Chunk with Eager Loading:**
```php
User::with('posts')->chunk(100, function($users) {
    foreach ($users as $user) {
        // Process users with loaded posts
    }
});
```

### **8. Global Scopes with Eager Loading:**
```php
protected static function booted()
{
    static::addGlobalScope('with-posts', function (Builder $builder) {
        $builder->with('posts');
    });
}
```

---

**Contributor:** Aman Vaghela  
**Topic:** Laravel Eloquent Optimization  
**Hacktoberfest 2025**

