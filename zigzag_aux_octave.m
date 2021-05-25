function S_V = zigzag_aux_octave(S_Q)
 S_V(length(S_Q)) = struct('vycbcr',[]);
 fun = @(block_struct) zigzag(block_struct);
 linhas = size(S_Q(1).y,1);
 colunas = size(S_Q(1).y,2);
 vycbcr=zeros(1,linhas*colunas*3);

 for k=1:length(S_Q)
  yq = S_Q(k).y;
  cbq = S_Q(k).cb;
  crq = S_Q(k).cr;
  a = blockproc(yq,[8 8],fun); 
  b = blockproc(cbq,[8 8],fun); 
  c = blockproc(crq,[8 8],fun);
  A = reshape(a',1,[]);
  B = reshape(b',1,[]);
  C = reshape(c',1,[]);
  S_V(k).vycbcr = [A,B,C];
 end
end

