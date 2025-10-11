Question 1 : What is cross-validation, and why is it important?

Answer: 

Cross-validation is a technique used in machine learning to check how well a model will perform on unseen data.

Simply put, you divide the data into smaller sets, such as five or ten smaller sets (referred to as folds), rather than training your model on all the data at once. Some of these folds are used to train the model, while the other is used for testing. This procedure is repeated multiple times, using a different test fold each time.

The main goal is to make sure the model isn’t just memorizing the data (overfitting) but actually learning patterns that generalize well.

Why it’s important:

 - It gives a more reliable estimate of how your model will perform on new data.

 - It helps prevent overfitting and underfitting.

 - It makes better use of limited data by using every data point for both training and testing at different times.