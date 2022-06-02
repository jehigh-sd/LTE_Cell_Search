function [z] = correlate(x,y)
%Performs the correlation operation on two vectors.

% find longest vector
L=max(length(x),length(y));
M=min(length(x),length(y));

% making sure the length of the two vectors will be the same
% by zero-padding the smaller vector
if(L==length(x))
    shift(1:M)=y;
    vec(1:L)=x;
else
    shift(1:M)=x;
    vec(1:L)=y;
end

% zero-pad
vec(L+1:L+(M-1))=0;

% pre-allocate
z = zeros(1,L);

% perform the correlation
for ii=1:L
    z(ii)=shift*vec(ii:ii+(M-1))';
    z(ii) = abs(z(ii))*abs(z(ii));
end

