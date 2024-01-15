function chua_memristor
clear all
figure(1)
%This program originally computed by S. Sabarathinam 
%based on 'Memristor Based Chaotic Circuits-M. Bharathwaj'
%don't forgot to rate my files...
%To vary the value of 'r' you can get the bifurcation scenario.
       display('S. SABARATHINAM>>>please rate my files..');
            r=2000.0; c1=6.8e-9;	c2=68.0e-9;	bind=18.0e-3;
            alpha = -0.667D-03;beta=0.029D-03; xx=bind*c2;tau=3.499e-05;
          cn1=tau/c1*r;cn2=tau/c2*r; cn3=tau/bind;
 %                     
            tspan = 0:0.01:500;  
            x10 = 0.1; x20 = -0.2; x30 = -0.003;
            x40 = 0.05; 

            y0 = [x10; x20; x30 ; x40 ];
           op=odeset('abstol',1e-9,'reltol',1e-9);
          
            [t,y] = ode45(@(t,x) f(t,x,tau,c1,c2,bind,r,alpha,beta),tspan,y0,op);    
        
            x1=y(:,1); x2=y(:,2); x3=y(:,3); 
             x4=y(:,4); tim=t(:);
            
            subplot(2,2,1),plot(x1,x2);
            subplot(2,2,2),plot(x1,x4);
             subplot(2,2,3),plot(x1,x3);
             subplot(2,2,4),plot(x2,x4);
        
      
       function dy = f(t,y,tau,c1,c2,bind,r,alpha,beta)
        
   x1 = y(1);    x2 = y(2);    x3 = y(3);
   x4 = y(4);   
    
	dx1=tau*x2;
	dx2=(tau/c1)*((x3-x2)/r-(alpha+3*beta*x1*x1)*x2);
    dx3=(tau/c2)*(((x2-x3)/r)-x4);
    dx4=(tau*x3)/bind;  
 	
     dy = [dx1; dx2; dx3; dx4 ];    
     