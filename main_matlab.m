clear all
close all
clc
tic
S=1;
numbframes = 20;

%% Lê o vídeo
S_img = fonte('video3.mp4',numbframes);

%% Coder
S_img2 = timePred (S_img);
struct_Ycbcr = subamostragem (S_img,2);
L = size(struct_Ycbcr(1).y,1);
C = size(struct_Ycbcr(1).y,2);
S_Q = DCT_Quant(struct_Ycbcr,S);
S_v = zigzag_aux_octave2(S_Q);
bin(numbframes)=struct('quadro','');
for i = 1:length(S_v)
    for k=1:64:length(S_v(i).vycbcr)
        bin(i).quadro = [bin(i).quadro binario(S_v(i).vycbcr(k:k+63))]; 
    end
end

for i = 1:length(S_v)
bin(i).quadro = reshape(bin(i).quadro,9,[])';
end


%% Decoder
v=zeros(1,length(S_v(1).vycbcr));
S_v2(numbframes) = struct('quadro',[]);
for i = 1:length(S_v)
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
S_Q2 = zigzaginv_aux_octave(S_v2,L,C);
S_Qinv = IDCT_Quant(S_Q2,S);
S_up = subamostragem_up(S_Qinv,2);

%%
rgbStruct = invTimePred(S_up);

%% grava o vídeo 
destino(S_up,'videonovo.avi');
toc


