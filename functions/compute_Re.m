function Re = compute_Re(y_m, y_p, z_p, par)
    Re = par.beta * ( (1 - y_m - z_p)/par.gamma_m + par.rho*(z_p - y_p)/par.gamma_p );
end