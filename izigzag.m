function M = izigzag(v)
  % M = zigzag(v)
  % sa¨ªda ¨¦ uma matriz de tamanho NxN
  % entrada ¨¦ um vetor de tamanho 1xN^2
  % segue o zigzag inverso do JPEG
  N = sqrt(length(v));
  i=1;
  j=1;
  k=1;
  M(i,j) = v(k);
  
  while(k<N^2)
  
  if ((i==1||i==N)&&rem(j,2)~=0) %direita
    j=j+1;
    k=k+1;
    M(i,j) = v(k);
  end
  
  if((j==1||j==N)&&rem(i,2)==0&&(i~=N)) %baixo
    i=i+1;
    k=k+1;
    M(i,j) = v(k);
  end
  
  if((i==1&&rem(j,2)==0)||(j==N&&rem(i,2)~=0))
    while(j~=1&&i~=N)
      i=i+1;
      j=j-1;
      k=k+1;
      M(i,j) = v(k);
    end
  end
  
  if((j==1&&rem(i,2)~=0)||(i==N&&rem(j,2)==0))
    while(i~=1&&j~=N)
      j=j+1;
      i=i-1;
      k=k+1;
      M(i,j) = v(k);
    end
  end
  end
  
endfunction
