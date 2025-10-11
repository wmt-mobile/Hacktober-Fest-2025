# Question 3: How does queue worker retry handling work? What happens if a job keeps failing?

## Answer:

Laravel's queue worker retry handling is a sophisticated system for managing job failures:

## **Retry Mechanism:**

### **1. Basic Retry Configuration:**

In your job class:
```php
class ProcessPodcast implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * The number of times the job may be attempted.
     */
    public $tries = 3;

    /**
     * The number of seconds to wait before retrying.
     */
    public $backoff = [10, 30, 60]; // Exponential backoff

    /**
     * The maximum number of seconds the job can run.
     */
    public $timeout = 120;

    public function handle()
    {
        // Job logic
    }
}
```

### **2. Command Line Retry Configuration:**
```bash
# Maximum tries
php artisan queue:work --tries=3

# Maximum timeout
php artisan queue:work --timeout=60

# Delay before retrying (seconds)
php artisan queue:work --backoff=5
```

## **What Happens When a Job Fails:**

### **Step-by-Step Process:**

1. **First Failure:**
   - Job throws an exception
   - Laravel catches it
   - Checks: `attempts < tries`?
   - If yes: Job is released back to queue after backoff delay
   - Attempt counter increments

2. **Subsequent Failures:**
   - Process repeats for each failure
   - Backoff delay can increase (exponential backoff)
   - Each retry increments the attempts counter

3. **Max Retries Exceeded:**
   - Job is moved to `failed_jobs` table
   - `failed()` method is called (if defined)
   - Event `JobFailed` is dispatched

## **Example with All Features:**

```php
<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;

class ProcessOrder implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $tries = 5;
    public $maxExceptions = 3;
    public $backoff = [10, 30, 60, 120, 300]; // Exponential backoff in seconds
    public $timeout = 120;
    
    // Delete job if its models no longer exist
    public $deleteWhenMissingModels = true;

    protected $order;

    public function __construct($order)
    {
        $this->order = $order;
    }

    /**
     * Determine the time at which the job should timeout.
     */
    public function retryUntil()
    {
        return now()->addMinutes(30);
    }

    /**
     * Execute the job.
     */
    public function handle()
    {
        // Check if we should retry
        if ($this->attempts() > 1) {
            Log::warning("Retrying ProcessOrder job, attempt {$this->attempts()}");
        }

        try {
            // Process the order
            $this->order->process();
        } catch (\Exception $e) {
            // Log the error
            Log::error("Order processing failed: " . $e->getMessage());
            
            // Manually release back to queue with delay
            // $this->release(30);
            
            // Or fail immediately
            // $this->fail($e);
            
            // Or let Laravel handle it automatically
            throw $e;
        }
    }

    /**
     * Handle a job failure.
     */
    public function failed(\Throwable $exception)
    {
        // Send user notification of failure, etc...
        Log::error("Order {$this->order->id} failed permanently: " . $exception->getMessage());
        
        // Notify admin
        \Mail::to('admin@example.com')->send(new OrderProcessingFailed($this->order, $exception));
        
        // Update order status
        $this->order->update(['status' => 'processing_failed']);
    }
}
```

## **Advanced Retry Patterns:**

### **1. Conditional Retries:**
```php
public function handle()
{
    try {
        $this->processPayment();
    } catch (NetworkException $e) {
        // Retry on network issues
        $this->release(30);
    } catch (ValidationException $e) {
        // Don't retry validation errors
        $this->fail($e);
    }
}
```

### **2. Dynamic Backoff:**
```php
public function backoff()
{
    return [10, 30, 60, 120, 300];
}
```

### **3. Time-Based Retry:**
```php
public function retryUntil()
{
    return now()->addHour();
}
```

## **Failed Jobs Management:**

### **View Failed Jobs:**
```bash
php artisan queue:failed
```

### **Retry Failed Job:**
```bash
# Retry specific job
php artisan queue:retry 5

# Retry all failed jobs
php artisan queue:retry all

# Retry jobs by UUID
php artisan queue:retry ce7bb17c-cdd8-41f0-a8ec-7b4fef4e5568
```

### **Delete Failed Jobs:**
```bash
# Delete specific job
php artisan queue:forget 5

# Flush all failed jobs
php artisan queue:flush
```

### **Prune Old Failed Jobs:**
```bash
# Delete failed jobs older than 48 hours
php artisan queue:prune-failed --hours=48
```

## **Monitoring & Events:**

Listen for job events:
```php
Queue::failing(function (JobFailed $event) {
    // $event->connectionName
    // $event->job
    // $event->exception
    
    Log::critical('Job failed', [
        'job' => $event->job->resolveName(),
        'exception' => $event->exception->getMessage(),
    ]);
});
```

## **Best Practices:**

1. **Set appropriate retry limits** - Don't retry indefinitely
2. **Use exponential backoff** - Give external services time to recover
3. **Implement `failed()` method** - Clean up and notify on permanent failures
4. **Log retry attempts** - Track patterns in failures
5. **Use `retryUntil()`** - Prevent jobs from running indefinitely
6. **Handle different exceptions differently** - Some errors shouldn't retry
7. **Monitor failed jobs** - Set up alerts for failed job spikes
8. **Regular cleanup** - Prune old failed jobs periodically

---

**Contributor:** Aman Vaghela  
**Topic:** Laravel Queue Management  
**Hacktoberfest 2025**

