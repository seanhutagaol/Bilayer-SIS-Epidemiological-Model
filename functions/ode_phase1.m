function dydt = ode_phase1(~, y, beta, gamma_minus)
    dydt = beta * (1 - y) * y - (gamma_minus) * y;
end