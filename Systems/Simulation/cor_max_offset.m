%Finds the offset where correlation is max
function [y] = cor_max_offset(tx,rx)

for lag = 1:length(rx)-length(tx)-1
    cor(lag) = tx*rx(lag:length(tx)-1+lag)';
end

y = find(cor == max(cor))-1;
end