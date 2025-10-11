// React Suspense is a mechanism for handling asynchronous operations gracefully by showing a fallback UI while something (data or component) is loading.
// However, its usage differs depending on what you’re waiting for — data or components.

// 1. Suspense for Lazy-Loaded Components

// Used with React.lazy() to load components dynamically (code-splitting).

// Suspense waits until the component’s code is downloaded, then renders it.

// Commonly used for improving performance and reducing initial bundle size.

// const Profile = React.lazy(() => import("./Profile"));

// function App() {
//   return (
//     <Suspense fallback={<div>Loading component...</div>}>
//       <Profile />
//     </Suspense>
//   );
// }


// 🟢 Fallback: shown while the component’s JS bundle is loading.
// 🟢 When used: for lazy component imports.
// 🟢 Handled by React automatically.

// 2. Suspense for Data Fetching

// Used to wait for asynchronous data (like API calls) before rendering a component.

// Requires integration with a data-fetching library that supports Suspense (e.g., React Server Components, Relay, or React Query with experimental features).

// Suspense pauses rendering until data is available.

// function UserDetails() {
//   const user = useUserData(); // Suspense-enabled data hook
//   return <div>{user.name}</div>;
// }

// function App() {
//   return (
//     <Suspense fallback={<div>Loading data...</div>}>
//       <UserDetails />
//     </Suspense>
//   );
// }


// 🟢 Fallback: shown while waiting for data to load.
// 🟢 When used: for asynchronous data fetching.
// 🟢 Handled by data layer integration (not automatic).

// Key Difference
// Aspect	Lazy-loaded Components	Data Fetching
// Purpose	Waits for JS module (component) to load	Waits for async data to resolve
// Who manages async work	React (via React.lazy)	Data library or hook
// Fallback shown for	Component bundle loading	Data loading
// Rendering behavior	Renders once component loads	Renders once data is ready

// In short:

// Lazy-loading Suspense handles component code loading.

// Data-fetching Suspense handles asynchronous data loading.
// // Both show a fallback while waiting, but they manage different types of async work.