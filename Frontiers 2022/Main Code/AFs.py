import numpy as np
from scipy.stats import norm

from sklearn.gaussian_process import GaussianProcessRegressor
from sklearn.gaussian_process.kernels import RBF, ConstantKernel


def expected_improvement(X, X_sample, surrogate_model, epsilon=0.075):
    """
    Computes the Expected Improvement at points X based on existing samples
    X_sample using Gaussian Process Surrogate Model.

    Args:
        X: Points at which EI will be computed --> mxd matrix
        X_sample: Sampled Locations --> nxd matrix
        surrogate_model: A Gaussian Process Regressor fitted to X_sample
        epsilon: Exploration-Exploitation Parameter

    Returns:
        Expected Improvements at points X.
    """

    # Predict the mean, standard deviation for the alternative set
    mu, sigma = surrogate_model.predict(X, return_std=True)

    # reshape
    mu = mu.reshape(-1, 1)
    sigma = sigma.reshape(-1, 1)

    if X_sample.size != 0:
        mu_sample = surrogate_model.predict(X_sample)
        mu_star = np.max(mu_sample)  # Single Value

        with np.errstate(divide='ignore'):
            imp = mu - mu_star - epsilon
            Z = imp / sigma
            ei = imp * norm.cdf(Z) + sigma * norm.pdf(Z)
            ei[sigma == 0.0] = 0.0
    else:
        mu_sample = mu
        mu_star = np.max(mu_sample)  # Single Value

        with np.errstate(divide='ignore'):
            imp = mu - mu_star - epsilon
            Z = imp / sigma
            ei = imp * norm.cdf(Z) + sigma * norm.pdf(Z)
            ei[sigma == 0.0] = 0.0

    return ei


def probability_of_improvement(X, X_sample, surrogate_model, epsilon=0.075):
    """
    Computes the Probability of Improvement at points X based on existing samples
    X_sample using Gaussian Process Surrogate Model.

    Args:
        X: Points at which PI will be computed --> mxd matrix
        X_sample: Sampled Locations --> nxd matrix
        surrogate_model: A Gaussian Process Regressor fitted to X_sample
        epsilon: Exploration-Exploitation Parameter

    Returns:
        Probability of Improvements at points X.
    """
    # Predict the mean, standard deviation for the alternative set
    mu, sigma = surrogate_model.predict(X, return_std=True)

    mu = mu.reshape(-1, 1)
    sigma = sigma.reshape(-1, 1)

    if X_sample.size != 0:
        mu_sample = surrogate_model.predict(X_sample)
        mu_star = np.max(mu_sample)  # Single Value

        with np.errstate(divide='ignore'):
            imp = mu - mu_star - epsilon
            Z = imp / sigma
            pi = norm.cdf(Z)
    else:
        mu_sample = mu
        mu_star = np.max(mu_sample)  # Single Value

        with np.errstate(divide='ignore'):
            imp = mu - mu_star - epsilon
            Z = imp / sigma
            pi = norm.cdf(Z)

    return pi


def upper_confidence_bound(X, iteration_num, surrogate_model):
    """
    Computes the UCB at points X using a Gaussian process surrogate model.

    Args:
        X: Points at which UCB shall be computed (m x d).
        surrogate_model: A Gaussian Process Regressor fitted to X_sample

    Returns:
        Upper Confidence Bound at points X.
    """
    n = iteration_num  # Iteration Number
    D = 1  # Dimension of the design space
    delta = 0.5  # A constant value takes its value from (0,1).
    # The close this value to 0, the larger kappa is and as a result, the more optimistic the selection will be.

    kappa = np.sqrt((2 * np.log((n ** (D / 2 + 2) * (np.pi ** 2)) / 3 * delta)))

    # calculate mean and stdev via surrogate function
    mu, std = surrogate_model.predict(X, return_std=True)

    mu = mu.reshape(-1, 1)
    std = std.reshape(-1, 1)

    ucb = mu + kappa * std

    return ucb


def maxvalue_entropy_search(X, gpr):
    sampled_y = gpr.sample_y(X, n_samples=1000).reshape(len(X), 1, 1000)

    Y_star = np.max(sampled_y, axis=0)

    Y_star = Y_star.T

    # Mu and std
    y_mean, y_std = gpr.predict(X, return_std=True)

    x_pred = np.zeros((len(X), 1))
    for j in range(len(X)):
        mu = y_mean[j]
        std = y_std[j]
        gamma_ystar = (Y_star - mu) / std
        alpha = (gamma_ystar * norm.pdf(gamma_ystar) / (2 * norm.cdf(gamma_ystar))) - \
                (np.log(norm.cdf(gamma_ystar)))
        x_pred[j] = np.average(alpha)

    return x_pred


def kg_helper(data, new_size):
    c = np.zeros((new_size, 1))
    c[0] = float('-inf')
    # c[1] = float('inf')

    A = np.array([0])

    a = data[:, 0].reshape(-1, 1)
    b = data[:, 1].reshape(-1, 1)
    # print(a)
    # print(b)
    for i in range(new_size - 1):
        c[i + 1] = float('inf')
        loopdone = False
        while not loopdone:
            j = A[-1]

            try:
                c[j] = (a[j] - a[i + 1]) / (b[i + 1] - b[j])
            except ZeroDivisionError:
                c[j] = 0
            if len(A) != 1:
                k = A[-2]
            if len(A) != 1 and c[j] <= c[k]:
                A = A[:-1]
                loopdone = False
            else:
                loopdone = True

        A = np.vstack((A, i + 1))
    return c, A


def remove_row(a, i):
    return np.vstack([a[:i, :], a[(i + 1):, :]])


def knowledge_gradient(X, y_mean, y_cov, noise):
    # np.seterr(all='warn')

    final_alpha = np.zeros((len(X), 1))

    for j in range(len(X)):  # Line 1

        a = y_mean.reshape(-1, 1)  # Line 2
        b = y_cov[:, j].reshape(-1, 1)  # Line 2
        b = b / np.sqrt(y_cov[j, j] + np.square(noise))

        # Unsorted data!
        sorted_data = np.concatenate((a, b), axis=1)

        # In-place sorting
        sorted_data.view('f8, f8').sort(order=['f1', 'f0'], axis=0)

        mask = np.ones(len(sorted_data), dtype=bool)

        for i in range(len(X) - 1):
            if i + 1 >= len(sorted_data):
                break
            if sorted_data[i, 1] == sorted_data[i + 1, 1]:
                mask[i] = False

        new_data = sorted_data[mask]
        # Get the sorted a
        sorted_a = new_data[:, 0].reshape(-1, 1)
        # Get the sorted b
        sorted_b = new_data[:, 1].reshape(-1, 1)

        # print(new_data)
        # New size of the sorted_data
        new_size = len(new_data)

        c, A = kg_helper(new_data, new_size)

        # print(c)

        final_a = sorted_a[A].reshape(-1, 1)
        final_b = sorted_b[A].reshape(-1, 1)

        C = c[A].reshape(-1, 1)

        C = np.vstack((C, float('inf')))

        A_Length = len(A)

        total = 0
        # print(c)
        for k in range(A_Length - 1):
            z = -np.abs(C[k])

            alpha = (final_b[k + 1] - final_b[k]) * (z * norm.cdf(z) + norm.pdf(z))
            total = total + alpha

        final_alpha[j] = np.log(total)

    return final_alpha
