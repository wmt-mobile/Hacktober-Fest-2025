**1. Mounting Effects**

A mounting effect is an effect that runs only **once**, when the component is first rendered (mounted) on the DOM.
Achieved using `useEffect` with an **empty dependency array**:

```
useEffect(() => {
  console.log("Component mounted");
  // e.g., fetch data from an API
}, []); // empty dependency array means it runs only on mount
```

**Key Points:**

* Runs after the initial render.
* Cleanup (if any) runs when the component unmounts.
* Common use cases:

  * Fetching initial data
  * Subscribing to events
  * Setting up timers

---

**2. Updating Effects**

An updating effect runs after every render (or when specific dependencies change).
Achieved using `useEffect` with **dependencies** in the array:

```
const [count, setCount] = useState(0);

useEffect(() => {
  console.log(`Count changed: ${count}`);
}, [count]); // runs on mount AND whenever count changes
```

**Key Points:**

* Runs after the first render **and** on subsequent updates if dependencies change.
* Cleanup (if any) runs before the effect runs again or when the component unmounts.
* Common use cases:

  * Responding to prop or state changes
  * Updating local storage
  * Animations or side-effects dependent on changing values

---

**3. Comparing Mounting vs Updating Effects**

| Aspect            | Mounting Effect (`[]`)        | Updating Effect (`[deps]`)            |
| ----------------- | ----------------------------- | ------------------------------------- |
| When it runs      | Only once on mount            | On mount and when dependencies change |
| Dependency array  | Empty (`[]`)                  | Non-empty (`[dep1, dep2]`)            |
| Cleanup timing    | On unmount                    | Before next effect or unmount         |
| Typical use cases | API fetch, event subscription | Responding to prop/state changes      |

---

**4. Special Case: No Dependency Array**

```
useEffect(() => {
  console.log("Runs after every render");
});
```

* Without a dependency array, the effect runs **after every render**, which is essentially always updating.

 