function S_Q = zigzaginv_aux(S_V,L,C)
 S_Q(length(S_V)) = struct('y',[],'cb',[],'cr',[]);
 %fun = @(block_struct) izigzag(block_struct.data);
 
L2=floor((L/2)./8).*8;
C2=floor((C/2)./8).*8;

 for k=1:length(S_V)
     vy = S_V(k).quadro(1:L*C);
     vcb = S_V(k).quadro(L*C+1:L*C+(L2*C2));
     vcr = S_V(k).quadro(L*C+((L2*C2))+1:(L*C)+((L2*C2)*2));
       
    l=1;
    for i = 1:8:L
        for j=1:8:C
            a(i:i+7,j:j+7) = izigzag(vy(l:l+63)); 
            l=l+64;
        end
    end
    l=1;
    for i = 1:8:L2
        for j=1:8:C2
            b(i:i+7,j:j+7) = izigzag(vcb(l:l+63)); 
            c(i:i+7,j:j+7) = izigzag(vcr(l:l+63)); 
            l=l+64;
        end
    end

  %E = mat2cell(a,8,8*ones(size(a,2)/8,1));
  %F = reshape(E,[C/8 L/8])';
  %S_Q(k).y = double(cell2mat(F));
  S_Q(k).y = a;
  
%   E = mat2cell(b,8,8*ones(size(b,2)/8,1));
%   F = reshape(E,[C2/8 L2/8])';
%   S_Q(k).cb = double(cell2mat(F));
  S_Q(k).cb = b;
  
%   E = mat2cell(c,8,8*ones(size(c,2)/8,1));
%   F = reshape(E,[C2/8 L2/8])';
%   S_Q(k).cr = double(cell2mat(F));
  S_Q(k).cr = c;
 end
end

