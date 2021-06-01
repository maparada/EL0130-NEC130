function destino(struct_IDCT,nome)
  
v = VideoWriter(nome);
v.FrameRate = 10;
open(v)

for i =1:length(struct_IDCT)
  im = struct_IDCT(i).imagem;
  writeVideo(v,im);
end

close(v)
end


