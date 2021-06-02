function S_v2 = decimalaux(bin,tam)

v=zeros(1,tam);
S_v2(length(bin)) = struct('quadro',[]);
for i = 1:length(bin)
  eob = find(bin(i).quadro(:,1)=='1');
  j=1;
  l=1;
  for k=1:length(eob)
     v(l:l+63) = decimal(bin(i).quadro(j:eob(k),:));
     j = eob(k)+1;
     l=l+64;
   end
   S_v2(i).quadro=v;
   v=[];
end
end