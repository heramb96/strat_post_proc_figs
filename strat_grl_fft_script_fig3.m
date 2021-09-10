% FIGURE 3
clear all;close;clc;

%reading roms output nc files
f1='/DATA1/N_0.0_cev6_hvis6_per/roms_his.nc';
f2='/DATA1/N_0.001_cev6_hvis6_per/roms_his.nc';
f3='/DATA1/N_0.002_cev6_hvis6_per/roms_his.nc';
f4='/DATA1/N_0.0049_cev6_hvis6_per/roms_his.nc';

lm=100;mm=250;N=200;dt=100;nsteps=30000;nhis=30;depth=2000;NT=1000;
f0=4.505e-5;
L=427;Fs=0.00027778;

%% fft with w and 4N (a)-(h)

figure('units','normalized','outerposition',[0 0 0.4 1])

u=(squeeze(ncread(f1,'w',[lm/2,62,161,1],[1,1,1,NT])))'; 
u=(u(1,489:1000));
   ax(1)= subplot(4,2,1);
 
    Y=fft(u);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f=2*pi.*Fs.*(0:(L/2))./L;
    plot(f(1,2:27)./f0,10^5.*P1(1,2:27),'k-','linewidth',3)
    hold on 
    plot([0.9073,0.9073],[0,0.9076],'k-','linewidth',1.2)
    axis([0 2.5 0 3.21])

    
    xticks([0 0.907 1.996])
    xticklabels({'0','0.907','1.996'})

    set(gca,'FontSize',14,'Fontweight','bold')

    ylabel('|P1(f)| \times 10^5')  

    b1=annotation('textbox',[0.25, 0.87, 0.1, 0.1], 'String',"z=-80m",'FitBoxToText','on');
    b1.FontSize = 14;
    b1.FontWeight = 'bold';
    b1.HorizontalAlignment = 'center';

    c1=annotation('textbox',[0.12, 0.82, 0.1, 0.1], 'String',"(a)",'FitBoxToText','on');
    c1.FontSize = 14;
    c1.FontWeight = 'bold';
    c1.HorizontalAlignment = 'center';
    set(c1,'EdgeColor','none');
    
    
    
    
    u=(squeeze(ncread(f1,'w',[lm/2,62,101,1],[1,1,1,NT])))'; 

    u=(u(1,489:1000));
    ax(7)= subplot(4,2,2);
    
    Y=fft(u);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f=2*pi.*Fs.*(0:(L/2))./L;
    plot(f(1,2:27)./f0,10^5.*P1(1,2:27),'k-','linewidth',3)
    hold on 
    plot([0.907,0.907],[0,0.7072],'k-','linewidth',1.2)

    axis([0 2.5 0 3.21])
        xticks([0 0.907 1.996])
    xticklabels({'0','0.907','1.996'})
	set(gca,'FontSize',14,'Fontweight','bold')

    
    b1=annotation('textbox',[0.69, 0.87, 0.1, 0.1], 'String',"z=-500m",'FitBoxToText','on');
    b1.FontSize = 14;
    b1.FontWeight = 'bold';
    b1.HorizontalAlignment = 'center';
    
    b2=annotation('textbox',[0.9, 0.76, 0.1, 0.1], 'String',"N_0",'FitBoxToText','on');
    b2.FontSize = 14;
    b2.FontWeight = 'bold';
    b2.HorizontalAlignment = 'center';
    
    c7=annotation('textbox',[0.55, 0.82, 0.1, 0.1], 'String',"(b)",'FitBoxToText','on');
    c7.FontSize = 14;
    c7.FontWeight = 'bold';
    c7.HorizontalAlignment = 'center';
    set(c7,'EdgeColor','none');
    
    
    
    
u=(squeeze(ncread(f2,'w',[lm/2,62,161,1],[1,1,1,NT])))'; 
u=(u(1,489:1000));
   ax(1)= subplot(4,2,3);
 
    Y=fft(u);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f=2*pi.*Fs.*(0:(L/2))./L;
    plot(f(1,2:27)./f0,10^5.*P1(1,2:27),'k-','linewidth',3)
    hold on 
    plot([0.9073,0.9073],[0,0.9662],'k-','linewidth',1.2)
    axis([0 2.5 0 3.21])
    hold on 
    plot([1.905,1.905],[0,0.4091],'k-','linewidth',1.2)
    
        xticks([0 0.907 1.905])
    xticklabels({'0','0.907','1.905'})

    set(gca,'FontSize',14,'Fontweight','bold')

    ylabel('|P1(f)| \times 10^5')  

    c1=annotation('textbox',[0.12, 0.6, 0.1, 0.1], 'String',"(c)",'FitBoxToText','on');
    c1.FontSize = 14;
    c1.FontWeight = 'bold';
    c1.HorizontalAlignment = 'center';
    set(c1,'EdgeColor','none');
    
    
    
    
    
    u=(squeeze(ncread(f2,'w',[lm/2,62,101,1],[1,1,1,NT])))'; 

    u=(u(1,489:1000));
    ax(7)= subplot(4,2,4);
    
    Y=fft(u);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f=2*pi.*Fs.*(0:(L/2))./L;
    plot(f(1,2:27)./f0,10^5.*P1(1,2:27),'k-','linewidth',3)
    hold on 
    plot([0.998,0.998],[0,3.208],'k-','linewidth',1.2)
    hold on 
    plot([1.905,1.905],[0,2.249],'k-','linewidth',1.2)
    axis([0 2.5 0 3.21])
        xticks([0 0.998 1.905])
    xticklabels({'0','0.998','1.905'})
	set(gca,'FontSize',14,'Fontweight','bold')
\
        b2=annotation('textbox',[0.9, 0.54, 0.1, 0.1], 'String',"N_1",'FitBoxToText','on');
    b2.FontSize = 14;
    b2.FontWeight = 'bold';
    b2.HorizontalAlignment = 'center';
    
    c7=annotation('textbox',[0.55, 0.6, 0.1, 0.1], 'String',"(d)",'FitBoxToText','on');
    c7.FontSize = 14;
    c7.FontWeight = 'bold';
    c7.HorizontalAlignment = 'center';
    set(c7,'EdgeColor','none');

    
    
    
    u=(squeeze(ncread(f3,'w',[lm/2,62,161,1],[1,1,1,NT])))'; 
    u=(u(1,489:1000));
    ax(1)= subplot(4,2,5);
 
    Y=fft(u);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f=2*pi.*Fs.*(0:(L/2))./L;
    plot(f(1,2:27)./f0,10^5.*P1(1,2:27),'k-','linewidth',3)
    hold on 
    plot([0.9073,0.9073],[0,1.048],'k-','linewidth',1.2)
    axis([0 2.5 0 3.5])
    hold on 
    plot([1.996,1.996],[0,0.3921],'k-','linewidth',1.2)
    
        xticks([0 0.907 1.996])
    xticklabels({'0','0.907','1.996'})

    set(gca,'FontSize',14,'Fontweight','bold')

    ylabel('|P1(f)| \times 10^5')  


    c1=annotation('textbox',[0.12, 0.38, 0.1, 0.1], 'String',"(e)",'FitBoxToText','on');
    c1.FontSize = 14;
    c1.FontWeight = 'bold';
    c1.HorizontalAlignment = 'center';
    set(c1,'EdgeColor','none');
    
    
    
    
    
    u=(squeeze(ncread(f3,'w',[lm/2,62,101,1],[1,1,1,NT])))'; 

    u=(u(1,489:1000));
    ax(7)= subplot(4,2,6);
    
    Y=fft(u);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f=2*pi.*Fs.*(0:(L/2))./L;
    plot(f(1,2:27)./f0,10^5.*P1(1,2:27),'k-','linewidth',3)
    hold on 
    plot([1.089,1.089],[0,2.575],'k-','linewidth',1.2)
    hold on 
    plot([1.996,1.996],[0,2.064],'k-','linewidth',1.2)
    axis([0 2.5 0 3.21])
        xticks([0 1.089 1.996])
    xticklabels({'0','1.089','1.996'})
	set(gca,'FontSize',14,'Fontweight','bold')
        b2=annotation('textbox',[0.9, 0.32, 0.1, 0.1], 'String',"N_2",'FitBoxToText','on');
    b2.FontSize = 14;
    b2.FontWeight = 'bold';
    b2.HorizontalAlignment = 'center';
    
    c7=annotation('textbox',[0.55, 0.38, 0.1, 0.1], 'String',"(f)",'FitBoxToText','on');
    c7.FontSize = 14;
    c7.FontWeight = 'bold';
    c7.HorizontalAlignment = 'center';
    set(c7,'EdgeColor','none');
    
    
    
    
    u=(squeeze(ncread(f4,'w',[lm/2,62,161,1],[1,1,1,NT])))'; 
u=(u(1,489:1000));
   ax(1)= subplot(4,2,7);
 
    Y=fft(u);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f=2*pi.*Fs.*(0:(L/2))./L;
    plot(f(1,2:27)./f0,10^5.*P1(1,2:27),'k-','linewidth',3)
    hold on 
    plot([0.9073,0.9073],[0,0.8909],'k-','linewidth',1.2)
    axis([0 2.5 0 3.21])
    hold on 
    plot([1.996,1.996],[0,1.2],'k-','linewidth',1.2)
    
        xticks([0 0.907 1.996])
    xticklabels({'0','0.907','1.996'})

    set(gca,'FontSize',14,'Fontweight','bold')
  xlabel('f/f_0')
    ylabel('|P1(f)| \times 10^5')  

    c1=annotation('textbox',[0.12, 0.16, 0.1, 0.1], 'String',"(g)",'FitBoxToText','on');
    c1.FontSize = 14;
    c1.FontWeight = 'bold';
    c1.HorizontalAlignment = 'center';
    set(c1,'EdgeColor','none');
    
    u=(squeeze(ncread(f4,'w',[lm/2,62,101,1],[1,1,1,NT])))'; 

    u=(u(1,489:1000));
    ax(7)= subplot(4,2,8);
    
    Y=fft(u);
    P2 = abs(Y/L);
    P1 = P2(1:L/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f=2*pi.*Fs.*(0:(L/2))./L;
    plot(f(1,2:27)./f0,10^5.*P1(1,2:27),'k-','linewidth',3)
    hold on 
    plot([0.998,0.998],[0,2.473],'k-','linewidth',1.2)
    hold on 
    plot([1.996,1.996],[0,1.93],'k-','linewidth',1.2)
    axis([0 2.5 0 3.5])
        xticks([0 0.998 1.996])
    xticklabels({'0','0.998','1.996'})
	set(gca,'FontSize',14,'Fontweight','bold')

    xlabel('f/f_0')
   
    b2=annotation('textbox',[0.9, 0.1, 0.1, 0.1], 'String',"N_5",'FitBoxToText','on');
    b2.FontSize = 14;
    b2.FontWeight = 'bold';
    b2.HorizontalAlignment = 'center';
    
    c7=annotation('textbox',[0.55, 0.16, 0.1, 0.1], 'String',"(h)",'FitBoxToText','on');
    c7.FontSize = 14;
    c7.FontWeight = 'bold';
    c7.HorizontalAlignment = 'center';
    set(c7,'EdgeColor','none');
