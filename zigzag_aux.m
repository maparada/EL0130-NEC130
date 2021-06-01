function S_V = zigzag_aux(S_Q)
 S_V(length(S_Q)) = struct('vycbcr',[]);

 H = size(S_Q(1).y,2);
 V = size(S_Q(1).y,1);
 H2 = size(S_Q(1).cb,2);
 V2 = size(S_Q(1).cb,1);

 for k=1:length(S_Q)
  yq = S_Q(k).y;
  cbq = S_Q(k).cb;
  crq = S_Q(k).cr;
  l=1;
    for i = 1:8:V
        for j=1:8:H
            a(l:l+63) = zigzag(yq(i:i+7,j:j+7)); 
            l=l+64;
        end
    end
    l=1;
    for i = 1:8:V2
        for j=1:8:H2
            b(l:l+63) = zigzag(cbq(i:i+7,j:j+7)); 
            c(l:l+63) = zigzag(crq(i:i+7,j:j+7)); 
            l=l+64;
        end
    end
  S_V(k).vycbcr = [a,b,c];
 end
end

