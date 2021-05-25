function destino(struct_IDCT,nome)
  
v = VideoWriter(nome);
v.FrameRate = 1;
open(v)

for i =1:60
  im = struct_IDCT(i).imagem;
  writeVideo(v,im);
end

close(v)
end


