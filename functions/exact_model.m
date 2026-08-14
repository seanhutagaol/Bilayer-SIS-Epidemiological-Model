function dYdt = exact_model(~, Y, par)
    y_m = Y(1); y_p = Y(2); z_p = Y(3);
    y_total = y_m + y_p;
    
    % Piecewise behavioral response
    f_y = 0;
    if y_total >= par.ic
        f_y = par.alpha * (y_total - par.ic);
    end
    
    y_eff = y_m + par.rho * y_p;
    x_p = z_p - y_p;
    
    dy_m = par.beta * (1 - y_m - z_p) * y_eff - par.gamma_m * y_m;
    dy_p = par.beta * x_p * y_eff - par.gamma_p * y_p;
    dz_p = f_y * (1 - y_m - z_p) - par.delta * x_p - par.gamma_p * y_p;
    
    dYdt = [dy_m; dy_p; dz_p];
end