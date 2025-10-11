# Questions

---

## 1.

How do you evaluate a machine learning model’s performance? Explain metrics like accuracy, precision, recall, F1-score, and ROC-AUC.


Accuracy measures how often the model makes correct predictions out of all predictions. It is useful when the dataset has an equal number of positive and negative samples. However, it can be misleading in imbalanced datasets where one class dominates.

Precision tells you, out of all the samples the model predicted as positive, how many were actually positive. It is important in situations where false positives are costly. For example, in spam detection, marking a legitimate email as spam is undesirable, so higher precision is preferred.

Recall measures how many of the actual positive samples the model was able to correctly identify. It is important when missing a positive case is risky. For example, in disease detection, failing to identify a sick person is dangerous, so higher recall is preferred.

F1-score is a balance between precision and recall. It is the harmonic mean of the two and is useful when both false positives and false negatives matter. It is commonly used when the dataset is imbalanced.

ROC-AUC represents how well the model can distinguish between positive and negative classes. The ROC curve plots the true positive rate against the false positive rate at various threshold settings, and the AUC value summarizes the overall performance. A higher AUC means the model is better at ranking positives above negatives, regardless of the chosen threshold.

---

## 2.

Explain the difference between CNN (Convolutional Neural Network) and RNN (Recurrent Neural Network).

A Convolutional Neural Network (CNN) and a Recurrent Neural Network (RNN) are both types of neural networks, but they are designed for different kinds of data.

A CNN is mainly used for spatial data like images. It processes data by applying filters that detect patterns such as edges, textures, or shapes. CNNs work well where nearby pixels or features are related, and they capture this local spatial structure through convolution layers. They do not keep track of previous inputs; they analyze the entire input at once.

An RNN, on the other hand, is designed for sequential data like text, speech, or time series. It processes data step by step and remembers previous information through internal memory. This allows it to understand context across time. However, standard RNNs can suffer from problems like vanishing gradients, which is why variants like LSTM and GRU are often used.

In simple terms, CNNs are best for images or grid-like data where space matters, while RNNs are best for sequences where order and context over time matter.

---

## 3.

What is gradient descent, and what are its variants?
Gradient descent is an optimization technique used to minimize the error or loss of a machine learning model. It works by repeatedly adjusting the model’s parameters in the direction that reduces the loss the most. This direction is determined by the negative of the gradient, which is like the slope showing how the loss changes with respect to each parameter. By taking small steps in this direction, the model gradually improves its accuracy.

There are several variants of gradient descent:

Batch Gradient Descent calculates the gradient using the entire dataset before updating the parameters. It is stable but can be slow for large datasets.

Stochastic Gradient Descent (SGD) updates the parameters using only one training sample at a time. It is faster and adds randomness, which can help escape local minima but makes convergence noisy.

Mini-Batch Gradient Descent combines both approaches by updating the parameters using small batches of data. It is widely used because it offers a good balance between speed and stability.

There are also adaptive variants that adjust the learning rate automatically during training. Examples include Momentum, which helps accelerate learning by remembering past gradients; RMSProp, which adjusts learning rates based on recent gradients; and Adam, which combines Momentum and RMSProp and is one of the most popular optimization methods.

In simple words, gradient descent helps a model learn by slowly correcting itself, and its variants change how fast and how smoothly it learns.
---

## 4.

What is the difference between classification and regression?

---

## 5.

What are decision trees, and how do they decide splits?

---

## 6.

Given two integers `dividend` and `divisor`, divide two integers without using multiplication, division, and mod operator.  

The integer division should truncate toward zero, which means losing its fractional part. For example, 8.345 would be truncated to 8, and -2.7335 would be truncated to -2.  

Return the quotient after dividing `dividend` by `divisor`.  

**Note:** Assume we are dealing with an environment that could only store integers within the 32-bit signed integer range: `[−2^31, 2^31 − 1]`. For this problem, if the quotient is strictly greater than `2^31 - 1`, then return `2^31 - 1`, and if the quotient is strictly less than `-2^31`, then return `-2^31`.

### Example 1:
- Input: `dividend = 10, divisor = 3`  
- Output: `3`  
- Explanation: `10 / 3 = 3.33333..` which is truncated to `3`.

### Example 2:
- Input: `dividend = 7, divisor = -3`  
- Output: `-2`  
- Explanation: `7 / -3 = -2.33333..` which is truncated to `-2`.
