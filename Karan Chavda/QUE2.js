// Purpose:
// <React.StrictMode> runs extra checks in development mode only to help developers detect side effects and unsafe code.

// Why double-invoke:

// React invokes functions like useEffect, useState initializers, and class lifecycle methods (constructor, componentDidMount, etc.) twice intentionally.

// This simulates React’s behavior in Concurrent Rendering (React 18+), where a component may be mounted, unmounted, and remounted for scheduling reasons.

// The double invocation helps detect:

// Impure functions — components or effects that cause unintended side effects.

// State mutation bugs — e.g., mutating props or state directly.

// Memory leaks — improper cleanup in useEffect.

// Example:

useEffect(() => {
  console.log('Effect runs');
  return () => console.log('Cleanup runs');
}, []);


// Under StrictMode, you’ll see:

// Effect runs
// Cleanup runs
// Effect runs


// This ensures your code behaves correctly when React mounts/unmounts multiple times under concurrent rendering.