// Definition of Prop Drilling:
// Prop drilling is the pattern where props are passed through multiple intermediate component layers that don't need the props themselves, solely to deliver them to deeply nested child components.
// Example:
function App() {
  const [user, setUser] = useState({ name: 'Alice' });
  return <Parent user={user} />;
}

function Parent({ user }) {
  // Parent doesn't use 'user'
  return <Child user={user} />;
}

function Child({ user }) {
  // Child doesn't use 'user'
  return <GrandChild user={user} />;
}

function GrandChild({ user }) {
  // Finally uses 'user'
  return <div>{user.name}</div>;
}

// Problems with Prop Drilling:

// Maintenance burden: Changes to prop names or structure require updates across many components
// Poor readability: Makes component dependencies unclear
// Tight coupling: Intermediate components become coupled to data they don't use
// Testing difficulty: Components require props they don't need just to pass them down
// Refactoring friction: Moving components requires updating all intermediate layers

// Architectural Alternatives:
// 1. Context API
// React's built-in solution for sharing data across the component tree:
const UserContext = createContext();

function App() {
  const [user, setUser] = useState({ name: 'Alice' });
  return (
    <UserContext.Provider value={user}>
      <Parent />
    </UserContext.Provider>
  );
}

function GrandChild() {
  const user = useContext(UserContext);
  return <div>{user.name}</div>;
}
// Pros: Built-in, no dependencies, good for app-wide state
// Cons: Can cause unnecessary re-renders if not optimized
// 2. Component Composition
// Passing components as children or props instead of data:
function App() {
  const [user, setUser] = useState({ name: 'Alice' });
  return (
    <Parent>
      <GrandChild user={user} />
    </Parent>
  );
}

function Parent({ children }) {
  return <div className="container">{children}</div>;
}
// Pros: Most flexible, clear dependencies, no performance issues
// Cons: Can lead to complex component structures
// 3. State Management Libraries (Redux, Zustand, Jotai)
// Centralized state management with direct component access:
// Redux example
const userSlice = createSlice({
  name: 'user',
  initialState: { name: 'Alice' },
  reducers: { /* ... */ }
});

function GrandChild() {
  const user = useSelector(state => state.user);
  return <div>{user.name}</div>;
}
// Pros: Predictable state updates, time-travel debugging, DevTools
// Cons: Boilerplate, learning curve, may be overkill for simple apps
// 4. Custom Hooks
// Encapsulate data fetching and state logic:
function useUser() {
  const [user, setUser] = useState(null);
  
  useEffect(() => {
    fetchUser().then(setUser);
  }, []);
  
  return user;
}

function GrandChild() {
  const user = useUser(); // Fetches directly
  return <div>{user?.name}</div>;
}
// Pros: Reusable, testable, collocates data fetching
// Cons: May duplicate requests without caching
// 5. Render Props / Higher-Order Components
// Legacy patterns for sharing logic:
function withUser(Component) {
  return function WithUserComponent(props) {
    const user = useContext(UserContext);
    return <Component {...props} user={user} />;
  };
}

const GrandChild = withUser(({ user }) => <div>{user.name}</div>);
// Pros: Explicit dependencies
// Cons: Wrapper hell, harder to debug, largely replaced by hooks
// Recommendation:

// Simple cases: Use component composition
// App-wide state: Use Context API
// Complex state logic: Use Redux/Zustand
// Data fetching: Use custom hooks with React Query/SWR

