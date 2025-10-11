// Word Ladder II - BFS + Backtracking

function findLadders(beginWord, endWord, wordList) {
  const wordSet = new Set(wordList);
  if (!wordSet.has(endWord)) return [];

  const parents = new Map();
  const level = new Set([beginWord]);
  let foundEnd = false;

  while (level.size && !foundEnd) {
    const nextLevel = new Map();
    for (const word of level) {
      wordSet.delete(word); // remove visited words
    }

    for (const word of level) {
      for (let i = 0; i < word.length; i++) {
        for (let c = 97; c <= 122; c++) { // a-z
          const newWord =
            word.slice(0, i) + String.fromCharCode(c) + word.slice(i + 1);
          if (!wordSet.has(newWord)) continue;

          if (!nextLevel.has(newWord)) nextLevel.set(newWord, new Set());
          nextLevel.get(newWord).add(word);

          if (newWord === endWord) foundEnd = true;
        }
      }
    }
    for (const [w, pSet] of nextLevel) {
      if (!parents.has(w)) parents.set(w, new Set());
      for (const p of pSet) parents.get(w).add(p);
    }
    level.clear();
    for (const w of nextLevel.keys()) level.add(w);
  }

  // Backtracking to build paths
  const res = [];
  function backtrack(word, path) {
    if (word === beginWord) {
      res.push([beginWord, ...path.reverse()]);
      return;
    }
    if (!parents.has(word)) return;
    for (const p of parents.get(word)) {
      backtrack(p, [...path, word]);
    }
  }

  backtrack(endWord, []);
  return res;
}

// ✅ Test cases
console.log(
  findLadders("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"])
);
// [
//   ["hit","hot","dot","dog","cog"],
//   ["hit","hot","lot","log","cog"]
// ]

console.log(
  findLadders("hit", "cog", ["hot", "dot", "dog", "lot", "log"])
);
// []
