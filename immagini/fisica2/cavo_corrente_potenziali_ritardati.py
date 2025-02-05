import numpy as np
from matplotlib import pyplot as plt


def compute_B_turnon(r, v, t):
    return np.where(t < r / v - 1e-2, 0, 1 / r * (v * t) / np.sqrt((v * t) ** 2 - r**2))


def compute_E_turnon(r, v, t):
    return np.where(t < r / v - 1e-2, 0, v / np.sqrt((v * t) ** 2 - r**2))


def compute_B_infty(r):
    return 1 / r


def compute_B_delta(r, v, t):
    return np.where(t < r / v - 1e-2, 0, -v * r / (v**2 * t**2 - r**2) ** (3 / 2))


def compute_E_delta(r, v, t):
    return np.where(t < r / v - 1e-2, 0, v**3 * t / (v**2 * t**2 - r**2) ** (3 / 2))


def compute_B_linear(r, v, t, tau=1):
    h1 = np.heaviside(t - r / v, 0)
    h2 = np.heaviside(t - tau - r / v, 0)
    return np.where(
        t < r / v - 1e-2,
        0,
        1
        / (v * r * tau)
        * (
            h1 * np.sqrt(v**2 * t**2 - r**2)
            - h2 * np.sqrt(v**2 * (t - tau) ** 2 - r**2)
        ),
    )


def compute_E_linear(r, v, t, tau=1):
    h1 = np.heaviside(t - r / v, 0)
    h2 = np.heaviside(t - tau - r / v, 0)
    arg_log1 = v * t / r + np.sqrt(v**2 * t**2 - r**2) / r
    arg_log2 = v * (t - tau) / r + np.sqrt(v**2 * (t - tau) ** 2 - r**2) / r
    return np.where(
        t < r / v - 1e-2, 0, -1 / tau * (h1 * np.log(arg_log1) - h2 * np.log(arg_log2))
    )


def plot(compute_B, compute_E):
    r = np.linspace(0.1, 10, 100000)
    v = 1

    fig1, ax = plt.subplots()

    B = compute_B_infty(r)

    for t in 1, 2, 5, 100:
        B = compute_B(r, v, t)
        ax.plot(r, B, label=f"t={t}")

    ax.legend()

    ax.set_xlabel(r"$\rho$", loc="right")
    ax.set_ylabel("$B$", loc="top")

    ax.set_ylim(0, 10)

    fig2, ax = plt.subplots()

    for t in 1, 2, 5, 100:
        E = compute_E(r, v, t)
        ax.plot(r, E, label=f"t={t}")
    ax.legend()
    ax.set_xlabel(r"$\rho$", loc="right")
    ax.set_ylabel("$E$", loc="top")

    return fig1, fig2


fig1, fig2 = plot(compute_B_turnon, compute_E_turnon)
fig1.savefig("cavo_corrente_potenziali_ritardati_turnon_B.pdf", bbox_inches="tight")
fig2.savefig("cavo_corrente_potenziali_ritardati_turnon_E.pdf", bbox_inches="tight")

fig1, fig2 = plot(compute_B_delta, compute_E_delta)
fig1.savefig("cavo_corrente_potenziali_ritardati_delta_B.pdf", bbox_inches="tight")
fig2.savefig("cavo_corrente_potenziali_ritardati_delta_E.pdf", bbox_inches="tight")

fig1, fig2 = plot(compute_B_linear, compute_E_linear)
fig1.savefig("cavo_corrente_potenziali_ritardati_linear_B.pdf", bbox_inches="tight")
fig2.savefig("cavo_corrente_potenziali_ritardati_linear_E.pdf", bbox_inches="tight")
