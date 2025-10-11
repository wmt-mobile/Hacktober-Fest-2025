// Server-Side Rendering (SSR) in React means rendering the React components into HTML on the server instead of the browser.

// When a user requests a page:

// The server runs the React code and generates the complete HTML for that page.

// That HTML is sent to the browser, so users see the content immediately (faster initial load and better SEO).

// Once the React bundle loads on the client, React “hydrates” — it attaches event listeners and makes the HTML interactive without re-rendering everything.

// Hydration Problems

// Hydration issues occur when the HTML generated on the server doesn’t exactly match the HTML React expects on the client.

// Common causes:

// Using browser-only APIs (window, localStorage) during SSR.

// Rendering content that depends on time, random values, or user-specific data not available on the server.

// Conditional rendering that behaves differently on server and client.

// Example:

// <p>{Math.random()}</p>


// The server might render 0.45, but the client re-renders 0.82.
// React then logs a hydration mismatch warning because the HTML doesn’t match.

// In short:
// SSR improves performance and SEO by pre-rendering HTML on the server, but it requires keeping server and client renders identical to avoid hydration mismatches.