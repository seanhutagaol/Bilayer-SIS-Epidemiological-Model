function Y = simulate_system(u_fine, par, policy_type)
    N = length(par.t_sim);
    Y = zeros(N, 5);
    Y(1,:) = par.Y0';

    for k = 1:N-1
        dt = par.dt;
        y_m = Y(k,1); y_p = Y(k,2); z_p = Y(k,3);
        y_total = y_m + y_p;
        u_t = u_fine(k);

        % Behavioral Control Logic
        if strcmp(policy_type, 'Policy_A')
            panic_arg = (1 + u_t) * y_total - par.ic;
            f_y = par.alpha * max(0, panic_arg);
        elseif strcmp(policy_type, 'Policy_B')
            panic_arg = y_total - par.ic;
            f_y = (par.alpha + u_t) * max(0, panic_arg);
        else % Baseline
            panic_arg = y_total - par.ic;
            f_y = par.alpha * max(0, panic_arg);
        end

        % ODEs
        dy_m = par.beta * (1 - y_m - z_p) * (y_m + par.rho * y_p) - par.gamma_m * y_m;
        dy_p = par.beta * (z_p - y_p) * (y_m + par.rho * y_p) - par.gamma_p * y_p;
        dz_p = f_y * (1 - y_m - z_p) - par.delta * (z_p - y_p) - par.gamma_p * y_p;
        
        % Euler Integration
        Y(k+1,1) = y_m + dt*dy_m;
        Y(k+1,2) = y_p + dt*dy_p;
        Y(k+1,3) = z_p + dt*dz_p;
        Y(k+1,4) = Y(k,4) + dt*y_p;  % Accumulate A_y
        Y(k+1,5) = Y(k,5) + dt*z_p;  % Accumulate A_z

        % Prevent negative populations (Numerical stability)
        Y(k+1,1:3) = max(Y(k+1,1:3), 0);
    end
end