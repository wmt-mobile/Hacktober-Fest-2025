# L1 and L2 Regularization

Regularization is a technique used in machine learning to prevent **overfitting**, which occurs when a model learns the noise in the training data instead of general patterns. **L1** and **L2** regularization are two common methods used to add penalties to the loss function and control the complexity of the model.

## L1 Regularization (Lasso)

L1 regularization adds a penalty proportional to the **absolute values** of the model's weights. This penalty is controlled by a regularization hyperparameter **λ**.

### Key Characteristics of L1:
- **Sparse Models**: L1 regularization tends to drive many weights to exactly zero, effectively removing unnecessary features.
- **Feature Selection**: It automatically performs feature selection by eliminating irrelevant features (those with weights of zero).
- **Use Case**: Useful when you believe only a subset of features are important and want to discard the irrelevant ones.

### L1 Regularization Formula:
\[
\text{L1 penalty} = \lambda \sum |w_i|
\]
Where:
- \( w_i \) are the model's weights.
- \( \lambda \) is the regularization strength.

---

## L2 Regularization (Ridge)

L2 regularization adds a penalty proportional to the **square** of the model's weights. Like L1, the penalty is controlled by **λ**.

### Key Characteristics of L2:
- **Shrinkage**: L2 regularization shrinks the weights toward zero but does not drive them to exactly zero.
- **Smooth Models**: It encourages smaller weights across all features, making the model less sensitive to small variations in the data.
- **Use Case**: Suitable when you believe all features are useful but want to prevent any single feature from dominating the model.

### L2 Regularization Formula:
\[
\text{L2 penalty} = \lambda \sum w_i^2
\]
Where:
- \( w_i \) are the model's weights.
- \( \lambda \) is the regularization strength.

---

## Key Differences Between L1 and L2:

| **Aspect**               | **L1 Regularization**               | **L2 Regularization**               |
|--------------------------|-------------------------------------|-------------------------------------|
| **Penalty**              | Sum of absolute values of weights   | Sum of squared values of weights    |
| **Effect on Weights**    | Forces many weights to zero (sparse) | Shrinks weights but doesn't force them to zero |
| **Feature Selection**    | Yes, by removing irrelevant features | No, keeps all features but reduces their impact |
| **Use Case**             | When expecting many irrelevant features | When expecting all features to be somewhat relevant |

---

## Preventing Overfitting

Both L1 and L2 regularization prevent overfitting by controlling the complexity of the model:

- **L1 Regularization**: Helps by reducing the number of features (creating sparse models). It effectively performs **feature selection** and eliminates irrelevant features.
- **L2 Regularization**: Helps by shrinking the weights, ensuring that the model is less sensitive to fluctuations in the training data.

Both methods reduce the model's ability to memorize the training data, making it more likely to generalize well to unseen data.

---

## Combining L1 and L2: Elastic Net

Sometimes, a combination of both L1 and L2 regularization, known as **Elastic Net**, is used to take advantage of both approaches. It balances between feature selection (L1) and weight shrinkage (L2).

### Elastic Net Formula:
\[
\text{Elastic Net penalty} = \alpha \cdot \lambda \sum |w_i| + \frac{1-\alpha}{2} \cdot \lambda \sum w_i^2
\]
Where:
- **α** controls the balance between L1 and L2 regularization.

---

## Summary

- **L1**: Reduces overfitting by eliminating irrelevant features (creating sparse models).
- **L2**: Reduces overfitting by shrinking the weights of all features (creating smoother models).
- **Elastic Net**: Combines L1 and L2 to benefit from both feature selection and weight shrinkage.

Regularization is a powerful technique for improving model performance and ensuring that it generalizes well to new, unseen data.
