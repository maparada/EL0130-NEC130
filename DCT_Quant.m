function struct_Q = DCT_Quant (struct_img,S)

struct_Q(length(struct_img)) = struct('y',[],'cb',[],'cr',[]);
V = size(struct_img(1).y,1);% mede a quantidade de linhas de X
H = size(struct_img(1).y,2);% mede a quantidade de colunas de X

V2 = size(struct_img(1).cb,1);% mede a quantidade de linhas de X
H2 = size(struct_img(1).cb,2);% mede a quantidade de colunas de X

Q=[16	11	10	16	24	40	51	61;
   12	12	14	19	26	58	60	55;
   14	13	16	24	40	57	69	56;
   14	17	22	29	51	87	80	62;
   18	22	37	56	68	109	103	77;
   24	35	55	64	81	104	113	92;
   49	64	78	87	103	121	120	101;
   72	92	95	98	112	100	103	99];%matriz de quantização para canais de luminância.
QLumi=repmat(Q,V/8,H/8);

Q2 =[17 18 24 47 99 99 99 99;
    18 21 26 66 99 99 99 99;
    24 26 56 99 99 99 99 99;
    47 66 99 99 99 99 99 99;
    99 99 99 99 99 99 99 99;
    99 99 99 99 99 99 99 99;
    99 99 99 99 99 99 99 99;
    99 99 99 99 99 99 99 99;];%matriz de quantização para canais de crominância.
QCromi=repmat(Q2,V2/8,H2/8);

for i=1:length(struct_img)
y = double(struct_img(i).y);
cb = double(struct_img(i).cb);
cr = double(struct_img(i).cr);
%V=floor(size(Xi,1)./8).*8;
%H=floor(size(Xi,2)./8).*8;
%X=Xi(1:V,1:H,:);



%realiza a DCT bi-dimensional em Y, cb, cr
ya=reshape(y,8,[]);
ya_dct=dct(ya);
y_dct=reshape(ya_dct,V,[]);
ya=reshape(y_dct',8,[]);
ya_dct=dct(ya);
y_dct=reshape(ya_dct,H,[])';

cba=reshape(cb,8,[]);
cba_dct=dct(cba);
cb_dct=reshape(cba_dct,V2,[]);
cba=reshape(cb_dct',8,[]);
cba_dct=dct(cba);
cb_dct=reshape(cba_dct,H2,[])';

cra=reshape(cr,8,[]);
cra_dct=dct(cra);
cr_dct=reshape(cra_dct,V2,[]);
cra=reshape(cr_dct',8,[]);
cra_dct=dct(cra);
cr_dct=reshape(cra_dct,H2,[])';

%realiza a quantização
y_q=round(y_dct./(QLumi*S));
cb_q=round(cb_dct./(QCromi*S));
cr_q=round(cr_dct./(QCromi*S));
 
struct_Q(i).y = y_q;
struct_Q(i).cb = cb_q;
struct_Q(i).cr = cr_q;

end
end
