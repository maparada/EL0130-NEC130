function S = fonte(nome,numbframes)
v = VideoReader(nome);
S = struct('imagem',[]);
if (length(numbframes)==0)
  numbframes = v.NumberOfFrames;
end
for i=1:numbframes
   im = readFrame (v);
   V=floor(size(im,1)./8).*8;
   H=floor(size(im,2)./8).*8;
   im=im(1:V,1:H,:);
   S(i).imagem = im;
end
end