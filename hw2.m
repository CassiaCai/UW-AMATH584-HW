close all
clear all
clc

imagedemo;
who;
type imagedemo; 
[U,S,V]=svd(X);

% The 648 by 509 matrix X contains a grayscale number (from 1 to 128) for each pixel in a grid. 
% This number determines how dark or light that pixel will be shaded when the
% command imagesc(X) is executed. This is fine if one can store a 648 by 509 matrix,
% but if there are many such images and they are, say, being sent from outer space, using
% this large a matrix to represent each one could be prohibitive!

[U,S,V] = svd(X); %% Compute the SVD of X

% Executing the above commands with X replaced by some
% low rank approximations formed from the largest singular values and corresponding
% singular vectors, and decide about how many singular values/vectors are needed to
% make the picture recognizable. 

% Using different number of singular values (diagonal of S) to compress and reconstruct the image
dispEr = [];
numSVals = [];
for N=5:25:300
    % store the singular values in a temporary var
    C = S;
    % discard the diagonal values not required for compression
    C(N+1:end,:)=0;
    C(:,N+1:end)=0;

    % Construct an Image using the selected singular values
    D=U*C*V';

    % display and compute error
    figure;
    buffer = sprintf('rank %d', N) % image outpuut using 5 singular values
    imshow(uint8(D));
    title(buffer);
    error=sum(sum((X-D).^2));

    % store vals for display
    dispEr = [dispEr; error];
    numSVals = [numSVals; N];
end

% dislay the error graph 
figure; 
title('Error in compression');
plot(numSVals, dispEr);
grid on
xlabel('Number of Singular Values used');
ylabel('Error between compress and original image');
