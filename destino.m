function destino(struct_IDCT,nome,frames)
  
v = VideoWriter(nome);
v.FrameRate = frames;
open(v)

for i =1:length(struct_IDCT)
  im = struct_IDCT(i).imagem;
  writeVideo(v,im);
end

close(v)
end


