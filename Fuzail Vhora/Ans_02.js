// React’s Transition API (startTransition) is used to mark some state updates as non-urgent so React can prioritize important UI updates first and keep the app responsive.

// How it works

// Normally, every state update in React is treated as urgent — React re-renders immediately, which can cause UI lag for heavy updates.
// With startTransition, you can tell React that an update can wait or be interrupted if something more important (like user typing or clicking) happens.

// import { startTransition } from "react";

// function Search({ query }) {
//   const [results, setResults] = useState([]);

//   function handleChange(e) {
//     const value = e.target.value;
//     // urgent update — update input immediately
//     setQuery(value);

//     // non-urgent update — fetch results in background
//     startTransition(() => {
//       const filtered = bigData.filter(item => item.includes(value));
//       setResults(filtered);
//     });
//   }
// }


// Here:

// Typing updates (setQuery) are high priority — UI stays responsive.

// Filtering data (setResults) is low priority — runs in background.

// Why it helps

// startTransition:

// Prevents the UI from freezing during heavy renders.

// Keeps input and animations smooth.

// Improves user experience by letting urgent updates interrupt slower ones.

// In short:
// startTransition helps React schedule updates smartly — urgent tasks first, non-urgent ones later — ensuring a smooth, responsive UI.