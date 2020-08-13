clc;
clear all;
P0=[
46
48
79
130
159
196
262
482
670
799
1040
1176
1457
1908
2078
3675
4585
5795
7272
9257
12327
15320
19848
22213
24873
29056
32986
37323
43938
50871
57695
62095
66885
71808
77872
84794
91159
96092
100123
103374
107663
113296
118181
122171
124908
127854
130072
132210
134753
137698
141397
143724
145742
148046
150383
];

 m=length(P0);


 P=P0;
 %minerror =10000000000000;
 noc=1;
 f=zeros(m,noc);
 eps=zeros(noc,1);
 minerror=ones(noc,1);
 minerror=minerror*10000000000000;
             optimala=zeros(noc,1);
             optimalA=zeros(noc,1);
             optimalf0=zeros(noc,1);
             optimalniu=zeros(noc,1);
             optimalb=zeros(noc,1);
 niu1=linspace(1,1,noc);
for jj=1:noc
    niu=niu1(jj);
     for A=162000:1000:162000
         f0=A;
         A
  % for f0=120000:120000
     for a=0.002:0.0001:0.002
        % a
        for b=55:1:55
          %  b
           
                %A
          %  eps=0;
            eps1=0;
            eps2=0;
            eps3=0;
            for i=1:m
                ah=[1/2 1];
bh=[ niu/2 (niu+1)/2];
z=-a*(i-b).^2;
val=hypergeom(ah,bh,z);
% da=0.001;
% db=1;
% dza=-(a+da)*(i-b).^2;
% val1=hypergeom(ah,bh,z+dza);
ah1=[3/2 2];
bh1=[ (niu+2)/2 (niu+3)/2];
z1=-a*(i-b).^2;
dvala=hypergeom(ah1,bh1,z1);
dvala=dvala*(-2)*(b-i).^2/(niu*(niu+1));

% ah2=[3/2 2];
% bh1=[ (niu+2)/2 (niu+3)/2];
% z1=-a*(i-b).^2;
dvalb=hypergeom(ah1,bh1,z1);
dvalb=dvalb*(-4)*(b-i)*a/(niu*(niu+1));

             f(i,jj)=f0+A/gamma(niu)*( val-(2*b-i).^(niu-1) ); 
            % f
            %eps=eps+(P0(i)-f(i)).^2;
            % eps(jj)=eps(jj)+(P0(i)-f(i,jj)).^2;
          eps1=eps1+abs((P0(i)-f(i,jj))*(-(2*b-i).^(niu-1)+val));
          eps2=eps2+abs((P0(i)-f(i,jj))*dvala);
           eps3=eps3+abs((P0(i)-f(i,jj))*(-(niu-1)*(2*b-i).^(niu-2)+dvalb));
          %(P0(i)-f(i,jj))
            end
       %  eps(jj)=eps(jj)/m;
         eps(jj)=abs(eps1)+abs(eps2)+abs(eps3);
         
          % eps(jj)=abs(eps1)*abs(eps2)*abs(eps3);
        
           if eps(jj)<minerror(jj) 
             minerror(jj)=eps(jj);
             optimala(jj)=a;
             optimalA(jj)=A;
             optimalf0(jj)=f0;
             optimalniu(jj)=niu;
             optimalb(jj)=b;
   
            end 
                
            end
        %end
      end
    end
end
[M,I] = min(minerror) 

      minerror(I)
      optimala(I)
      optimalA(I)
      optimalf0(I)
      optimalniu(I)
       optimalb(I)
   
%       optimala=0.005
%       optimalA=82000
%       optimalf0=82000
%       optimalniu=1
%        optimalb   =30 
       
       m1=m;
 finalf=zeros(m1,1);
       for i=1:m1
           finalf(i)=optimalf0(I)+optimalA(I)*C(i,optimala(I),optimalb(I),optimalniu(I));
          % C(i,optimala,optimalb,optimalniu)
       end
 
        figure(1)
       plot(P0);
       hold on;
      
       plot(finalf);
        grid on;
 set(gca,'xtick',1:2:m1)
       
      m1=2*optimalb(I);
   
 finalf=zeros(m1,1);
       for i=1:m1
           finalf(i)=optimalf0(I)+optimalA(I)*C(i,optimala(I),optimalb(I),optimalniu(I));
          % finalf(i)=optimalf0(I)+optimalA(I)*C(i,optimala(I),optimalb(I),0.8);
         
       end   
       
      
       
       
        figure(2)
       plot(finalf)
        grid on;
 set(gca,'xtick',1:2:m1)
 
%   finalf1=zeros(m1,1);
%  P1=zeros(m1,1);
%  for i=1:2*optimalb(I)
%      finalf1(i)= finalf(2*optimalb(I)-i+1)
%      
%  end
%   finalf2=zeros(m,1);
% for i=1:m
%    finalf2(i)= finalf1(i);
%    
% end
%  
%   figure(3)
%        plot(finalf2)
%        hold on;
%        plot(P0);
  