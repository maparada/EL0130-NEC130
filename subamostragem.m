function struct_Ycbcr = subamostragem (struct_RGB,sub)

taxa=2;
struct_Ycbcr(length(struct_RGB)) = struct('y',[],'cb',[],'cr',[]);


for i=1:length(struct_RGB)
    
    X = struct_RGB(i).imagem;
    R = X(:,:,1);
    G = X(:,:,2);
    B = X(:,:,3);
    
    %converte para Ycbcr
    y = 0.587*G + 0.299*R + 0.114*B;
    cb = 128+0.564*(B-y);
    cr = 128+0.713*(R-y);
    
    if (sub==1)
        struct_Ycbcr(i).y = y;
        struct_Ycbcr(i).cb = cb;
        struct_Ycbcr(i).cr = cr;  
    else
        %Downscaling Cb
        linhas = size(cb,1);
        colunas = size(cb,2);
        
        if(rem(linhas,2)~=0)
            cb (end+1,:)=0;
        end
        if(rem(colunas,2)~=0)
            cb(:,end+1)=0;
        end
        A = cb(1:taxa:end,1:taxa:end);
        B = cb(1:taxa:end,2:taxa:end);
        C = cb(2:taxa:end,1:taxa:end);
        D = cb(2:taxa:end,2:taxa:end);
        
        sub_cb = round((A+B+C+D)/4);
        
        %Downscaling Cr
        linhas = size(cr,1);
        colunas = size(cr,2);
        
        if(rem(linhas,2)~=0)
            cr (end+1,:)=0;
        end
        if(rem(colunas,2)~=0)
            cr(:,end+1)=0;
        end
        A = cr(1:taxa:end,1:taxa:end);
        B = cr(1:taxa:end,2:taxa:end);
        C = cr(2:taxa:end,1:taxa:end);
        D = cr(2:taxa:end,2:taxa:end);
        
        sub_cr = round((A+B+C+D)/4);
        
        
        Xi = sub_cb;
        Xz = sub_cr;
        V=floor(size(Xi,1)./8).*8;
        H=floor(size(Xi,2)./8).*8;
        sub_cb=Xi(1:V,1:H,:);
        sub_cr=Xz(1:V,1:H,:);
        
        
        struct_Ycbcr(i).y = y;
        struct_Ycbcr(i).cb = sub_cb;
        struct_Ycbcr(i).cr = sub_cr;
    end
end
end