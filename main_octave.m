clear all
close all
clc
pkg load video
pkg load image
pkg load signal
tic
S=1;
numbframes = 2;
S_img = fonte('video3.mp4',numbframes);
S_img2 = timePred (S_img);
struct_Ycbcr = subamostragem (S_img2,2);
S_Q = DCT_Quant(struct_Ycbcr,S);
S_v = zigzag_aux_octave(S_Q);
fun = @(block_struct) binario(block_struct);
bin=struct('quadro',[]);
for i = 1:length(S_v)
bin(i).quadro = blockproc(S_v(i).vycbcr,[1 64],fun); 
end


fun = @(block_struct) decimal(block_struct);
for i = 1:length(S_v)
bin(i).quadro = reshape(bin(i).quadro,9,[])';
end

j=1;
v=[];
for i = 1:length(S_v)
  eob = find(bin(i).quadro(:,1)=='1');
  for k=1:length(eob)
     v = [v decimal(bin(i).quadro(j:eob(k),:))];
     j = eob(k)+1;
   end
   S_v2(i).quadro=v;
   v=[];
end

%S_Qinv = IDCT_Quant(S_Q,S);
%destino(S_Qinv,'videonovo.avi');


