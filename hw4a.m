% p.85 Exercise 11.3
m = 50; n = 12;; t = linspace(0,1,m);

A = fliplr(vander(t));; A = A(:,1:n);
b = transpose(cos(4*t));

% (a) formation and solution of the normal equations, using MATLAB's \,
R = chol(A'*A) % Cholesky factorization
xa = R\(R'\(A'*b))

% (b) QR factorization computed by mgs (modified Gram-Schmidt)
% (c) QR factorization computed by Householder triangularization

% (d) QR factorization computed by MATLAB's qr (also Householder
% triangularization)
[Q,R] = qr(A) % [Q,R] = qr(A,0) % reduced QR factorization
xd = R\(Q'*b)

% (e) x = A\b in MATLAB (also based on QR factorization)
xe = A\b

% (f) SVD using MATLAB's svd
[U, S, V] = svd(A,0)
xf = V*(S\(U'*b))

% (g) 
x = [xa, xd, xe, xf]