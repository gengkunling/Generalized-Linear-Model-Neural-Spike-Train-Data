function MA = X2V(X, M, L, alpha, ModelOrder)
%M = X2M(X, M, L, alpha, ModelOrder)
%   Prepare Qth order Volterra Laguerre Matrix
%   X: input (N,1) vector

% Laguerre basis functions
for i = 1:L
    lagu(:,i) = lagu_re(i, M, alpha);
end;

% calculate V
V = [];
X = X(:,1);
length(X)
for i = 1:L
    V_tmp = conv(X, lagu(:,i));
    V(:,i) = V_tmp(1:length(X));
end;

M1 = V;

if ModelOrder==1
    MA = M1;
    
elseif ModelOrder==2
    M2 = zeros(length(X), L*(L+1)/2);
    ni = 0; 
    for i = 1:L
        for j = i:L
            ni = ni + 1;
            M2(:,ni) = V(:,i).*V(:,j);
        end;
    end;
    MA = horzcat(M1, M2);
    
elseif ModelOrder==3
    M2 = zeros(length(X), L*(L+1)/2);
    ni = 0; 
    for i = 1:L
        for j = i:L
            ni = ni + 1;
            M2(:,ni) = V(:,i).*V(:,j);
        end;
    end;
    M3 = zeros(length(X), L*(L+1)*(L+2)/6);
    ni = 0; 
    for i = 1:L
        for j = i:L
            for k = j:L
                ni = ni + 1;
                M3(:,ni) = (V(:,i).*V(:,j)).*V(:,k);
            end;
        end;
    end;
    MA = horzcat(M1, M2);
    MA = horzcat(M1, M2, M3);
else
    error('Invalid Model Order');
end;





