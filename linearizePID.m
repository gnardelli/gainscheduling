mdl='PlantNL';

% Obtain default operating point
op = operspec(mdl);
% Set the value of output concentration C to be known
op.Outputs.Known = true;
% Specify operating regions
C = [2 3 4 5 6 7 8 9];
% Initialize an array of state space systems
Plants = rss(1,1,1,8);
for ct = 1:length(C)
    % Compute equilibrium operating point corresponding to the value of C
    op.Outputs.y = C(ct);
    opoint = findop(mdl,op,findopOptions('DisplayReport','off'));
    % Linearize plant at this operating point
    Plants(:,:,ct) = linearize(mdl, opoint);
end