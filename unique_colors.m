rgb = imread('ngc6543a.jpg');
[nRow,nCol,nChannel] = size(rgb);
A = zeros(nRow*nCol,nChannel+2);

for i = 1:nRow
     for j = 1:nCol
         z = nCol*(i-1)+j;
         A(z,1) = i;
         A(z,2) = j;
         A(z,3:end) = rgb(i,j,:);
     end
end

[~,I,~]=unique(A(:,3:end),'rows');
size(I)