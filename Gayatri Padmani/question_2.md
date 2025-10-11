Question 2 : Explain the concept of hyperparameter tuning and some common methods to do it.

Answer: 

Hyperparameter tuning is the process of finding the best “settings” for a machine learning model to make it perform as well as possible.

Consider it similar to tinkering with a machine's knobs to achieve the optimal result. For example, in a decision tree, you might change how deep the tree can grow; in a neural network, you might change the learning rate or number of layers. These settings must be selected by you; they are not automatically learned.

Why it matters:
The right hyperparameters can make a big difference — turning a decent model into a great one. The wrong ones can cause overfitting, underfitting, or slow training.

Common methods for hyperparameter tuning:

 - Grid Search: Try every possible combination of parameters from a given list. It’s thorough but can be slow.

 - Random Search: Randomly pick combinations of parameters to test — faster and often surprisingly effective.

 - Bayesian Optimization: Uses past results to predict which combinations are likely to work best, making the search smarter.

 - Automated Tools (AutoML): Tools like Optuna or Scikit-learn’s RandomizedSearchCV handle the tuning process automatically.