function [c, ceq] = hard_constraints(u_nodes, par, policy_type)
    u_fine = interp1(par.t_nodes, u_nodes, par.t_sim, 'linear');
    Y = simulate_system(u_fine, par, policy_type);
    
    I_total = Y(:,1) + Y(:,2);
    
    % Path Constraints (Ensure vectors are <= 0 everywhere)
    c_path = I_total - par.I_max;              % Healthcare capacity
    c_LRP = Y(:,4) - par.L_max .* Y(:,5);      % Actuarial solvency
    
    c = [c_path; c_LRP];
    ceq = [];
end