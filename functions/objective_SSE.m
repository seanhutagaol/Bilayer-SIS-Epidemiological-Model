function error = objective_SSE(params, t_data, real_daily_newcases, N)
    beta = params(1);
    gamma_minus = params(2);
    I0 = params(3);
    y0 = I0 / N;

    [~, y_sim] = ode45(@(t,y) ode_phase1(t, y, beta, gamma_minus), t_data, y0);
    simulated_incidence_fraction = beta .* (1 - y_sim) .* y_sim;
    simulated_daily_cases = simulated_incidence_fraction * N;
    error = sum((simulated_daily_cases(:) - real_daily_newcases(:)).^2);

    if isnan(error) || isinf(error)
        error = 1e12;
    end
end