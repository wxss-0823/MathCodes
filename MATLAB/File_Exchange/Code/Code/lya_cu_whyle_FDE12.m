function [Texp,Lp]=lya_cu_whyle_FDE12(Dim,fcn_system,fcn_integrator,tstart,stept,tend,ystart,h,q)
%figure;   
% Memory allocation 
Num=Dim*(Dim+1);
nit = round((tend-tstart)/stept);
Lp=zeros(Dim,nit);
y=zeros(Num,1);  
y0=y;
cum=zeros(Dim,1);
gsc=cum; znorm=cum;

% Initial values
y(1:Dim)=ystart(:);
i=1;
while i<=Dim
    y((Dim+1)*i)=1.0;
    i=i+1;
end
t=tstart;
% Main loop
ITERLYAP=1;

while ITERLYAP<=nit
   lp=zeros(Dim,1);
    % Solutuion of extended ODE system 
    [T,Y] = fcn_integrator(q,fcn_system,t,t+stept,y,h); 
    YY=transpose(Y);
    t=t+stept;
%     disp(y)
    y=YY(size(YY,1),:);
    i=1;
    while i<=Dim
        j=1;
        while j<=Dim;
            y0(Dim*i+j)=y(Dim*j+i);
            j=j+1;
        end;
        i=i+1;
    end;
%       construct new orthonormal basis by gram-schmidt
    znorm(1)=0.0;
    j=1;
    while j<=Dim
        znorm(1)=znorm(1)+y0(Dim*j+1)^2; 
        j=j+1;
    end;
    znorm(1)=sqrt(znorm(1));
    j=1;
    while j<=Dim
        y0(Dim*j+1)=y0(Dim*j+1)/znorm(1); 
        j=j+1;
    end
    j=2;
    while j<=Dim
        k=1;
        while k<=j-1
            gsc(k)=0.0;
            l=1;
            while l<=Dim;
                gsc(k)=gsc(k)+y0(Dim*l+j)*y0(Dim*l+k); 
                l=l+1;
            end
            k=k+1;
        end
        k=1;
        while k<=Dim
            l=1;
            while l<=j-1
                y0(Dim*k+j)=y0(Dim*k+j)-gsc(l)*y0(Dim*k+l);
                l=l+1;
            end
            k=k+1;
        end;
        znorm(j)=0.0;
        k=1;
        while k<=Dim
            znorm(j)=znorm(j)+y0(Dim*k+j)^2; 
            k=k+1;
        end
        znorm(j)=sqrt(znorm(j));
        k=1;
        while k<=Dim
            y0(Dim*k+j)=y0(Dim*k+j)/znorm(j);
            k=k+1;
        end
        j=j+1;
    end
%      update ruDiming vector magnitudes
    k=1;
    while k<=Dim;
        cum(k)=cum(k)+log(znorm(k)); 
        k=k+1;
    end;
%       normalize exponent
    k=1;
    while k<=Dim
        lp(k)=cum(k)/(t-tstart); 
        k=k+1;
    end
    % Output modification

    if ITERLYAP==1
        Lexp=lp;
        Texp=t;
    else
        Lexp=[Lexp; lp];
        Texp=[Texp; t];
    end

%if (mod(ITERLYAP,ioutp)==0)
  %   fprintf('t=%6.4f',t);
    %   for k=1:Dim fprintf(' %10.6f',lp(k)); end;
        %   fprintf('\n');
        %end;
        %if mod(ITERLYAP, 50)==0 plot(t,lp); end
    i=1;
%  if mod(ITERLYAP, 10)==0 plot(t,lp); end
%plot(t,lp)
    while i<=Dim
        j=1;
        while j<=Dim;
            y(Dim*j+i)=y0(Dim*i+j);
            j=j+1;
        end
        i=i+1;
    end;
    y=transpose(y);
    Lp(:,ITERLYAP)=lp;
    ITERLYAP=ITERLYAP+1;    

    %fprintf('q=%6.4f',q);
    %fprintf('\n');
end
    

%xlabel('$$t$$','Interpreter','LaTex','fontsize',16)
%ylabel('LEs','fontsize',14)
%set(gca,'fontsize',14)
%line([0,t],[0,0],'color','k')
%title('') 