function v = zigzag(M)
  % v = zigzag(M)
  % entrada ¨¦ uma matriz de tamanho NxN
  % sa¨ªda ¨¦ um vetor de tamanho 1xN^2
  % segue o zigzag do JPEG
  L = size(M,1);
  C = size(M,2);
  i=1;
  j=1;
  k=1;
  v(k) = M(i,j);
  
  while(k<L*C)
  
  if ((i==1||i==L)&&rem(j,2)~=0) %direita
    j=j+1;
    k=k+1;
    v(k)=M(i,j);
  end
  
  if((j==1||j==C)&&rem(i,2)==0&&(i~=L)) %baixo
    i=i+1;
    k=k+1;
    v(k)=M(i,j);
  end
  
  if((i==1&&rem(j,2)==0)||(j==C&&rem(i,2)~=0))
    while(j~=1&&i~=L)
      i=i+1;
      j=j-1;
      k=k+1;
      v(k)=M(i,j);
    end
  end
  
  if((j==1&&rem(i,2)~=0)||(i==L&&rem(j,2)==0))
    while(i~=1&&j~=C)
      j=j+1;
      i=i-1;
      k=k+1;
      v(k)=M(i,j);
    end
  end
  end
  
end
