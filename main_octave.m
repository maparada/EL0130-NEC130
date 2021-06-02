clear all
close all
clc
pkg load image
pkg load signal
pkg load video
tic
S=1;
numbframes = 10; %n¨²mero de quadros
fps_rec = 5; %frames por segundo do v¨ªdeo

%se for 1 ignora a subamostragem. 
%Se for 2 faz com subamostragem 4:2:0
sub_taxa = 2;

%% Le o video
[S_img,tambindescomp] = fonte('video3.mp4',numbframes);

%% Subamostragem
struct_Ycbcr = subamostragem (S_img,sub_taxa);
L = size(struct_Ycbcr(1).y,1);
C = size(struct_Ycbcr(1).y,2);

%% Predicao temporal
S_img2 = timePred (struct_Ycbcr);

%% DCT / Quantizacao
S_Q = DCT_Quant(S_img2,S);

%% zigzag
S_v = zigzag_aux(S_Q);

%% conversao a binario
[bin,tambincomp] = binarioaux (S_v);
tam = length(S_v(1).vycbcr);

taxa = ((tambindescomp-tambincomp)/tambindescomp)*100;

%% Conversao a decimal
S_v2 = decimalaux(bin,tam);

%% zigzag inv
S_Q2 = zigzaginv_aux(S_v2,L,C,sub_taxa);

%% IDCT
S_Qinv = IDCT_Quant(S_Q2,S);

%% Predicao temporal inversa
rgbStruct = invTimePred(S_Qinv);

% for i=1:length(rgbStruct)
% rgbStruct(i).imagem = uint8(rgbStruct(i).imagem);
% end

%% subamostragem
S_up = subamostragem_up(rgbStruct,sub_taxa);

%% grava o video 
destino(S_up,'videonovo.avi',fps_rec);
toc


