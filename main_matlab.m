clear all
close all
clc
tic
S=1;
numbframes = 11;
fps_rec = 5;

%se for 1 ignora a subamostragem. 
%Se for 2 faz com subamostragem 4:2:0
sub_taxa = 1; 

%% Lê o vídeo
[S_img,tambindescomp] = fonte('video3.mp4',numbframes);

%% Subamostragem
struct_Ycbcr = subamostragem (S_img,sub_taxa);
L = size(struct_Ycbcr(1).y,1);
C = size(struct_Ycbcr(1).y,2);

%% Predição temporal
S_img2 = timePred (struct_Ycbcr);

%% DCT / Quantização
S_Q = DCT_Quant(S_img2,S);

%% zigzag
S_v = zigzag_aux(S_Q);

%% conversão a binário
[bin,tambincomp] = binarioaux (S_v);
tam = length(S_v(1).vycbcr);

taxa = ((tambindescomp-tambincomp)/tambindescomp)*100;

%% Conversão a decimal
S_v2 = decimalaux(bin,tam);

%% zigzag inv
S_Q2 = zigzaginv_aux(S_v2,L,C,sub_taxa);

%% IDCT
S_Qinv = IDCT_Quant(S_Q2,S);

%% Predição temporal inversa
rgbStruct = invTimePred(S_Qinv);

% for i=1:length(rgbStruct)
% rgbStruct(i).imagem = uint8(rgbStruct(i).imagem);
% end

%% subamostragem
S_up = subamostragem_up(rgbStruct,sub_taxa);

%% grava o vídeo 
destino(S_up,'videonovo.avi',fps_rec);
toc


