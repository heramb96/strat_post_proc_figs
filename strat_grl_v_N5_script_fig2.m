% FIGURE 2
clear all;close;clc;

f1='/DATA1/N_0.0049_cev6_hvis6_per/roms_his.nc';


lm=100;mm=250;N=200;dt=100;nsteps=30000;nhis=30;depth=2000;

levels=50:50:200;
z_rho=(squeeze(ncread(f1,'z_rho',[lm/2,mm/2,1,560],[1,1,N,1])))';
z_rho=z_rho(1,50:50:200);

%% velocity pseudocolor 4 subplots N5

ax=zeros(4,1);
figure('units','normalized','outerposition',[0 0 0.5 0.65])

u=(squeeze(ncread(f1,'v',[lm/2,1,1,31],[1,mm,N,1])))'; 

   ax(1)= subplot(2,2,1);
    image=pcolor(u);
    colormap('jet')
    set(image,'EdgeColor','none');
    caxis([-0.04 0.04])

    ylabel({'Depth','(m)'})
    set(gca,'FontSize',12,'Fontweight','bold')
     xticklabels([200 400 600 800 1000])
 yticklabels([-1500 -1000 -500 0])

u=(squeeze(ncread(f1,'v',[lm/2,1,1,186],[1,mm,N,1])))'; 

   ax(2)= subplot(2,2,2);
    image=pcolor(u);
    colormap('jet')
    set(image,'EdgeColor','none');
    caxis([-0.04 0.04])

    set(gca,'FontSize',12,'Fontweight','bold')
     xticklabels([200 400 600 800 1000])
 yticklabels([-1500 -1000 -500 0])

u=(squeeze(ncread(f1,'v',[lm/2,1,1,352],[1,mm,N,1])))'; 

   ax(3)= subplot(2,2,3);
    image=pcolor(u);
    colormap('jet')
    set(image,'EdgeColor','none');
    caxis([-0.04 0.04])
    xlabel({'y','(km)'})
    ylabel({'Depth','(m)'})
    set(gca,'FontSize',12,'Fontweight','bold')
     xticklabels([200 400 600 800 1000])
 yticklabels([-1500 -1000 -500 0])
    
u=(squeeze(ncread(f1,'v',[lm/2,1,1,557],[1,mm,N,1])))'; 

   ax(4)= subplot(2,2,4);
    image=pcolor(u);
    colormap('jet')
    set(image,'EdgeColor','none');
    caxis([-0.04 0.04])
    xlabel({'y','(km)'})

    
     xticklabels([200 400 600 800 1000])
 yticklabels([-1500 -1000 -500 0])
    set(gca,'FontSize',12,'Fontweight','bold')
subplot(ax(1))
title('(a)')
subplot(ax(2))
title('(b)')
subplot(ax(3))
title('(c)')
subplot(ax(4))
title('(d)')

 h = colorbar;
 set(h,'position',[0.93 0.04 0.02 0.9]);

caxis([-0.04 0.04])
