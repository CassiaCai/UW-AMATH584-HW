% initialize a random 4x4 matrix B
B = randn(4);
%% 1a) show as a product of 8 matrices

% p9. exercise 1. Take an indentity matrix. For row operations, multiply
% from the left. For column operations, multiply from the right.
% double column 1
s1 = B*[2 0 0 0 ; 0 1 0 0 ; 0 0 1 0 ; 0 0 0 1]; 
s1
% halve row 3
s2 = [1 0 0 0 ; 0 1 0 0 ; 0 0 1/2 0 ; 0 0 0 1]*s1; 
s2
% add row 3 to row 1
s3 = [1 0 1 0 ; 0 1 0 0 ; 0 0 1 0 ; 0 0 0 1]*s2; 
s3
% interchange column 1 and column 4
s4 = s3*[0 0 0 1 ; 0 1 0 0 ; 0 0 1 0 ; 1 0 0 0 ];
s4
% subtract row 2 from each of the other rows
s5 = [1 -1 0 0 ; 0 1 0 0 ; 0 -1 1 0 ; 0 -1 0 1]*s4;
s5
% replace column 4 by column 3
s6 = s5*[1 0 0 0 ; 0 1 0 0 ; 0 0 1 1 ; 0 0 0 0];
s6
% delete column 1
s7 = s6*[0 0 0 ; 1 0 0 ; 0 1 0 ; 0 0 1];
% output the product of 8 matrices
s7
%% 1b) Write as the product of ABC

% matrix A is the product of the matrices on the left
A = [1 -1 0 0 ; 0 1 0 0 ; 0 -1 1 0 ; 0 -1 0 1]*[1 0 1 0 ; 0 1 0 0 ; 0 0 1 0 ; 0 0 0 1]*[1 0 0 0 ; 0 1 0 0 ; 0 0 1/2 0 ; 0 0 0 1];
A
% matric C is the product of the matrices on the right
C = [2 0 0 0 ; 0 1 0 0 ; 0 0 1 0 ; 0 0 0 1]*[0 0 0 1 ; 0 1 0 0 ; 0 0 1 0 ; 1 0 0 0]*[1 0 0 0 ; 0 1 0 0 ; 0 0 1 1 ; 0 0 0 0]*[0 0 0 ; 1 0 0 ; 0 1 0 ; 0 0 1];
C
% matrix D is the product of ABC
D = A*B*C;
D
%% 
%