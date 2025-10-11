// React.lazy and Suspense enable code-splitting by allowing components to be loaded on-demand rather than bundled in the initial JavaScript payload.
// How React.lazy works:
const LazyComponent = React.lazy(() => import('./MyComponent'));
// Internal mechanism:

// Dynamic Import: React.lazy accepts a function that returns a dynamic import(), which returns a Promise that resolves to a module with a default export containing the component.
// Lazy Component Wrapper: React.lazy creates a special lazy component object that internally tracks the loading state of the module.
// Suspension Process: When React attempts to render a lazy component:

// If the module isn't loaded yet, React "throws" the Promise (not a traditional error throw)
// React catches this thrown Promise in the nearest <Suspense> boundary
// The Suspense boundary renders its fallback UI while waiting
// When the Promise resolves, React re-renders the component tree with the loaded component


// Caching: Once loaded, the component module is cached, so subsequent renders don't trigger loading again.

// How Suspense works:
<Suspense fallback={<LoadingSpinner />}>
  <LazyComponent />
</Suspense>

// Internal behavior:
// Suspense uses an error boundary-like mechanism to catch thrown Promises
// It maintains internal state to track loading status
// When a Promise is caught, it renders the fallback
// It attaches .then() handlers to the Promise to trigger re-render on resolution
// After the Promise resolves, it unmounts the fallback and renders the actual children

// Build-time optimization: Bundlers like Webpack detect import() statements and create separate chunks (bundle files) for those modules, which are loaded only when needed.
