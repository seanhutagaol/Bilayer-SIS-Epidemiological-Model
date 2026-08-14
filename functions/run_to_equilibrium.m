function [t_full, Y_full] = run_to_equilibrium(ode_func, Y0, par, initial_tmax, label)
    tspan = [0, initial_tmax];
    [t_full, Y_full] = ode45(@(t,Y) ode_func(t,Y,par), tspan, Y0);

    max_allowed_time = 200000;
    tol = 1e-6; 

    while t_full(end) < max_allowed_time
        dy = ode_func(t_full(end), Y_full(end,:)', par);

        if max(abs(dy)) < tol
            fprintf('  [+] %s: Converged to equilibrium at t = %.0f days.\n', label, t_full(end));
            break;
        end

        last_t = t_full(end);
        last_Y = Y_full(end,:)';
        
        [t_new, Y_new] = ode45(@(t,Y) ode_func(t,Y,par), [last_t, last_t + initial_tmax], last_Y);

        t_full = [t_full; t_new(2:end)];
        Y_full = [Y_full; Y_new(2:end, :)];
    end

    if t_full(end) >= max_allowed_time
        fprintf('  [!] %s: Stopped at max time (t = %d) without reaching strict equilibrium.\n', label, max_allowed_time);
    end
end