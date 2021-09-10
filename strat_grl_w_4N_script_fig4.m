% FIGURE 4
clear all;close;clc;

f1='/DATA1/N_0.0_cev6_hvis6_per/roms_his.nc';
f2='/DATA1/N_0.001_cev6_hvis6_per/roms_his.nc';
f3='/DATA1/N_0.002_cev6_hvis6_per/roms_his.nc';
f4='/DATA1/N_0.0049_cev6_hvis6_per/roms_his.nc';


lm=100;mm=250;N=200;dt=100;nsteps=30000;nhis=30;depth=2000;


z_rho=(squeeze(ncread(f1,'z_rho',[lm/2,mm/2,1,560],[1,1,N,1])))';


%% velocity 4N subplots
 
%% vertical velocity pseudocolor 4N subplots

figure('units','normalized','outerposition',[0 0 0.6 1])
ts=400;
u=(squeeze(ncread(f1,'w',[lm/2,1,1,ts],[1,mm,N,1])))'; 

   ax(1)= subplot(4,1,1);
    image=pcolor(u);
    colormap('jet')
    set(image,'EdgeColor','none');
  caxis([-5*10^-5 5*10^-5])
    ylabel({'Depth','(m)'})
    set(gca,'FontSize',13,'Fontweight','bold')
    xticklabels([])
    yticklabels([-1500 -1000 -500 0])
    hold on 
    plot([100,100],[1,200],'k--','linewidth',3)
   
    a1=annotation('textbox',[0.835, 0.71, 0.1, 0.1], 'String',"(a)",'FitBoxToText','on')
    a1.FontSize = 17;
    a1.FontWeight = 'bold';
    a1.HorizontalAlignment = 'center';
    set(a1,'EdgeColor','none');
    
   u=(squeeze(ncread(f2,'w',[lm/2,1,1,ts],[1,mm,N,1])))'; 

   ax(2)= subplot(4,1,2);
    image=pcolor(u);
    set(image,'EdgeColor','none');
    colormap('jet')

    ylabel({'Depth','(m)'})
xticklabels([])
yticklabels([-1500 -1000 -500 0])

 caxis([-5*10^-5 5*10^-5])

    set(gca,'FontSize',14,'Fontweight','bold')
    hold on 
    plot([100,100],[1,200],'k--','linewidth',3)
    
    a2=annotation('textbox',[0.835, 0.49, 0.1, 0.1], 'String',"(b)",'FitBoxToText','on')
    a2.FontSize = 17;
    a2.FontWeight = 'bold';
    a2.HorizontalAlignment = 'center';
    set(a2,'EdgeColor','none');
    
     u=(squeeze(ncread(f3,'w',[lm/2,1,1,ts],[1,mm,N,1])))'; 

   ax(2)= subplot(4,1,3);
    image=pcolor(u);
    set(image,'EdgeColor','none');
    colormap('jet')

    ylabel({'Depth','(m)'})

xticklabels([])
yticklabels([-1500 -1000 -500 0])

 caxis([-5*10^-5 5*10^-5])
 
    set(gca,'FontSize',14,'Fontweight','bold')
    
    hold on 
    plot([100,100],[1,200],'k--','linewidth',3)
    
    a3=annotation('textbox',[0.835, 0.27, 0.1, 0.1], 'String',"(c)",'FitBoxToText','on')
    a3.FontSize = 17;
    a3.FontWeight = 'bold';
    a3.HorizontalAlignment = 'center';
    set(a3,'EdgeColor','none');
    
    
     u=(squeeze(ncread(f4,'w',[lm/2,1,1,ts],[1,mm,N,1])))'; 

   ax(2)= subplot(4,1,4);
    image=pcolor(u);
    set(image,'EdgeColor','none');
    colormap('jet')

    xlabel({'y','(km)'})
    ylabel({'Depth','(m)'})

 caxis([-5*10^-5 5*10^-5])

    xticks = get(gca,'xtick') ;
    scaling  = 4 ;
    newlabels = arrayfun(@(x) sprintf('%.1f', scaling * x), xticks, 'un', 0);
    set(gca,'xticklabel',newlabels);
   
    hold on
    plot([44,70],[80,132],'k-','linewidth',2)
    

 set(gca,'FontSize',14,'Fontweight','bold')
 h = colorbar('northoutside');
 set(h,'position',[0.15 0.932 0.75 0.015]);
 xticklabels([200 400 600 800 1000])
 yticklabels([-1500 -1000 -500 0])
 
 hold on 
    plot([100,100],[1,200],'k--','linewidth',3)

    a4=annotation('textbox',[0.835, 0.05, 0.1, 0.1], 'String',"(d)",'FitBoxToText','on')
    a4.FontSize = 17;
    a4.FontWeight = 'bold';
    a4.HorizontalAlignment = 'center';
    set(a4,'EdgeColor','none');



% % vertical velocity profile 4N subplots
    
    figure('units','normalized','outerposition',[0 0 0.175 1])
% % 
v1=(squeeze(ncread(f1,'w',[lm/2,100,1,400],[1,1,N,1]))); 
v2=(squeeze(ncread(f2,'w',[lm/2,100,1,400],[1,1,N,1])));
v3=(squeeze(ncread(f3,'w',[lm/2,100,1,400],[1,1,N,1])));
v4=(squeeze(ncread(f4,'w',[lm/2,100,1,400],[1,1,N,1])));
  
   ax1=subplot(4,1,1)
   plot(v1,z_rho,'k-o','linewidth',3,'MarkerIndices', 1:20:length(v1))

axis([-6*10^-5 7*10^-5 -2000 0])

xticklabels([])

    set(gca,'FontSize',14,'Fontweight','bold')
b1=annotation('textbox',[0.75, 0.72, 0.1, 0.1], 'String',"N_0",'FitBoxToText','on')
b1.FontSize = 13;
b1.FontWeight = 'bold';
b1.HorizontalAlignment = 'center';
   
   subplot(4,1,2)
   plot(v2,z_rho,'k-o','linewidth',3,'MarkerIndices', 1:20:length(v2))

axis([-6*10^-5 7*10^-5 -2000 0])

xticklabels([])

    set(gca,'FontSize',14,'Fontweight','bold')
b2=annotation('textbox',[0.75, 0.50, 0.1, 0.1], 'String',"N_1",'FitBoxToText','on')
b2.FontSize = 13;
b2.FontWeight = 'bold';
b2.HorizontalAlignment = 'center';
   
   subplot(4,1,3)
   plot(v3,z_rho,'k-o','linewidth',3,'MarkerIndices', 1:20:length(v3))

axis([-6*10^-5 7*10^-5 -2000 0])

xticklabels([])

    set(gca,'FontSize',14,'Fontweight','bold')
b3=annotation('textbox',[0.75, 0.28, 0.1, 0.1], 'String',"N_2",'FitBoxToText','on')
b3.FontSize = 13;
b3.FontWeight = 'bold';
b3.HorizontalAlignment = 'center';
  
   subplot(4,1,4)
   plot(v4,z_rho,'k-o','linewidth',3,'MarkerIndices', 1:20:length(v4))

axis([-6*10^-5 7*10^-5 -2000 0])
xticklabels([-5 0 5])

    xlabel({'w \times 10^5','(ms^{-1})'})

    set(gca,'FontSize',14,'Fontweight','bold')
b4=annotation('textbox',[0.75, 0.06, 0.1, 0.1], 'String',"N_5",'FitBoxToText','on')
b4.FontSize = 13;
b4.FontWeight = 'bold';
b4.HorizontalAlignment = 'center';
