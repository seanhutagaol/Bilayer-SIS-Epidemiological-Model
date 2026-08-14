function J = objective_cost(u_nodes, par, policy_type)
    u_fine = interp1(par.t_nodes, u_nodes, par.t_sim, 'linear');
    Y = simulate_system(u_fine, par, policy_type);
    integrand = 0.5 * par.W_u * (u_fine.^2)' + par.W_I * (Y(:,1) + Y(:,2));
    J = trapz(par.t_sim, integrand);
end