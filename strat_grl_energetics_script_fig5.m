% FIGURE 5
clear all;
close;clc;

f1='/DATA1/N_0.0_cev6_hvis6_per/roms_his.nc';
f2='/DATA1/N_0.001_cev6_hvis6_per/roms_his.nc';
f3='/DATA1/N_0.002_cev6_hvis6_per/roms_his.nc';
f4='/DATA1/N_0.003_cev6_hvis6_per/roms_his.nc';
f5='/DATA1/N_0.004_cev6_hvis6_per/roms_his.nc';
f6='/DATA1/N_0.0049_cev6_hvis6_per/roms_his.nc';

lm=100;mm=250;N=200;dt=100;nsteps=30000;nhis=30;depth=2000;NT=996;

%% mixed layer kinetic energy

T=NT/6;
vake=zeros(T+1,1);
vake1=zeros(T+1,1);
vake2=zeros(T+1,1);
vake3=zeros(T+1,1);
vake4=zeros(T+1,1);
vake5=zeros(T+1,1);
vake6=zeros(T+1,1);

tic
parfor i=1:T+1
    uss=0;vss=0;
    uss1=0;vss1=0;
    uss2=0;vss2=0;
    uss3=0;vss3=0;
    uss4=0;vss4=0;
    uss5=0;vss5=0;
    for l=200:-1:177
        
        if i==1
            us=(squeeze(ncread(f1,'u',[1,1,l,i],[lm,mm,1,1])));
            vs=(squeeze(ncread(f1,'v',[1,1,l,i],[lm,mm,1,1])));
            us=us(:,50:200,:,:);
            vs=vs(:,50:200,:,:);
 
            us1=(squeeze(ncread(f2,'u',[1,1,l,i],[lm,mm,1,1])));
            vs1=(squeeze(ncread(f2,'v',[1,1,l,i],[lm,mm,1,1])));
            us1=us1(:,50:200,:,:);
            vs1=vs1(:,50:200,:,:);
            
            us2=(squeeze(ncread(f3,'u',[1,1,l,i],[lm,mm,1,1])));
            vs2=(squeeze(ncread(f3,'v',[1,1,l,i],[lm,mm,1,1])));
            us2=us2(:,50:200,:,:);
            vs2=vs2(:,50:200,:,:);
 
            us3=(squeeze(ncread(f4,'u',[1,1,l,i],[lm,mm,1,1])));
            vs3=(squeeze(ncread(f4,'v',[1,1,l,i],[lm,mm,1,1])));
            us3=us3(:,50:200,:,:);
            vs3=vs3(:,50:200,:,:);
            
            us4=(squeeze(ncread(f5,'u',[1,1,l,i],[lm,mm,1,1])));
            vs4=(squeeze(ncread(f5,'v',[1,1,l,i],[lm,mm,1,1])));
            us4=us4(:,50:200,:,:);
            vs4=vs4(:,50:200,:,:);
            
            us5=(squeeze(ncread(f6,'u',[1,1,l,i],[lm,mm,1,1])));
            vs5=(squeeze(ncread(f6,'v',[1,1,l,i],[lm,mm,1,1])));
            us5=us5(:,50:200,:,:);
            vs5=vs5(:,50:200,:,:);
            
        else
         
            us=(squeeze(ncread(f1,'u',[1,1,l,(i-1)*6],[lm,mm,1,1])));
            vs=(squeeze(ncread(f1,'v',[1,1,l,(i-1)*6],[lm,mm,1,1])));
            us=us(:,50:200,:,:);
            vs=vs(:,50:200,:,:);
 
            us1=(squeeze(ncread(f2,'u',[1,1,l,(i-1)*6],[lm,mm,1,1])));
            vs1=(squeeze(ncread(f2,'v',[1,1,l,(i-1)*6],[lm,mm,1,1])));
            us1=us1(:,50:200,:,:);
            vs1=vs1(:,50:200,:,:);

            us2=(squeeze(ncread(f3,'u',[1,1,l,(i-1)*6],[lm,mm,1,1])));
            vs2=(squeeze(ncread(f3,'v',[1,1,l,(i-1)*6],[lm,mm,1,1])));
            us2=us2(:,50:200,:,:);
            vs2=vs2(:,50:200,:,:);
 
            us3=(squeeze(ncread(f4,'u',[1,1,l,(i-1)*6],[lm,mm,1,1])));
            vs3=(squeeze(ncread(f4,'v',[1,1,l,(i-1)*6],[lm,mm,1,1])));
            us3=us3(:,50:200,:,:);
            vs3=vs3(:,50:200,:,:);
            
            us4=(squeeze(ncread(f5,'u',[1,1,l,(i-1)*6],[lm,mm,1,1])));
            vs4=(squeeze(ncread(f5,'v',[1,1,l,(i-1)*6],[lm,mm,1,1])));
            us4=us4(:,50:200,:,:);
            vs4=vs4(:,50:200,:,:);
            
            us5=(squeeze(ncread(f6,'u',[1,1,l,(i-1)*6],[lm,mm,1,1])));
            vs5=(squeeze(ncread(f6,'v',[1,1,l,(i-1)*6],[lm,mm,1,1])));
            us5=us5(:,50:200,:,:);
            vs5=vs5(:,50:200,:,:);
                  
        end

        if l==200
            z_rr=(squeeze(ncread(f1,'z_rho',[50,125,l,100],[1,1,1,1])));
            dz=abs(z_rr);
        else
            z_rr=(squeeze(ncread(f1,'z_rho',[50,125,l,100],[1,1,1,1])));
            z_rrp1=(squeeze(ncread(f1,'z_rho',[50,125,l+1,100],[1,1,1,1])));
            dz=z_rrp1-z_rr;
        end


        uss=uss+(sum(sum(us.^2)))*dz; 
        vss=vss+(sum(sum(vs.^2)))*dz;
         
        uss1=uss1+(sum(sum(us1.^2)))*dz; 
        vss1=vss1+(sum(sum(vs1.^2)))*dz;
         
        uss2=uss2+(sum(sum(us2.^2)))*dz; 
        vss2=vss2+(sum(sum(vs2.^2)))*dz;
         
        uss3=uss3+(sum(sum(us3.^2)))*dz; 
        vss3=vss3+(sum(sum(vs3.^2)))*dz;
        
        uss4=uss4+(sum(sum(us4.^2)))*dz; 
        vss4=vss4+(sum(sum(vs4.^2)))*dz;
        
        uss5=uss5+(sum(sum(us5.^2)))*dz; 
        vss5=vss5+(sum(sum(vs5.^2)))*dz;
        
    end
            vake(i)=vake(i)+uss+vss;
            vake1(i)=vake1(i)+uss1+vss1;
            vake2(i)=vake2(i)+uss2+vss2;
            vake3(i)=vake3(i)+uss3+vss3;
            vake4(i)=vake4(i)+uss4+vss4;
            vake5(i)=vake5(i)+uss5+vss5;

end

t=6:6:NT;
t=[1 t];
vake=513.5.*vake;
vake1=513.5.*vake1;
vake2=513.5.*vake2;
vake3=513.5.*vake3;
vake4=513.5.*vake4;
vake5=513.5.*vake5;


plot(t*3000/86400,vake./max(vake),'--o',t*3000/86400,vake1./max(vake1),'-.v',...
    t*3000/86400,vake2./max(vake2),':d',t*3000/86400,vake3./max(vake3),'--x', ...
    t*3000/86400,vake4./max(vake4),'-.+',t*3000/86400,vake5./max(vake5),'-s', ...
    'linewidth',3,'MarkerSize',12,'MarkerIndices', 1:10:length(t))

xlabel({'Time','(days)'})
ylabel('HKE/HKE_0')
set(gca,'FontSize',16,'Fontweight','bold')
title('(a)')
legend('N_0','N_1','N_2','N_3','N_4','N_5','N_6')


%% bottom flux calculation

lm=100;mm=250;N=200;dt=100;nsteps=30000;nhis=30;depth=2000;rho0=1027;NT=930;
dx=5000;dy=4000;

z_rho=(squeeze(ncread(f2,'z_rho',[lm/2,mm/2,1,100],[1,1,N,1])));
z_rho=z_rho(200:-1:1);

tic
u=(squeeze(ncread(f2,'w',[1,1,1,1],[lm,200,N,NT])));
u2=(squeeze(ncread(f3,'w',[1,1,1,1],[lm,200,N,NT])));    
u4=(squeeze(ncread(f4,'w',[1,1,1,1],[lm,200,N,NT])));
u5=(squeeze(ncread(f5,'w',[1,1,1,1],[lm,200,N,NT])));    
u6=(squeeze(ncread(f6,'w',[1,1,1,1],[lm,200,N,NT])));


u=u(:,50:200,200:-1:1,:); 
u2=u2(:,50:200,200:-1:1,:);
u4=u4(:,50:200,200:-1:1,:);
u5=u5(:,50:200,200:-1:1,:);
u6=u6(:,50:200,200:-1:1,:);

u_mt=squeeze(sum(u,4)./930.0);
u_mt2=squeeze(sum(u2,4)./930.0);
u_mt4=squeeze(sum(u4,4)./930.0);
u_mt5=squeeze(sum(u5,4)./930.0);
u_mt6=squeeze(sum(u6,4)./930.0);

for j=1:930
   u(:,:,:,j) =  u(:,:,:,j) - u_mt;
   u2(:,:,:,j) =  u2(:,:,:,j) - u_mt2;
   u4(:,:,:,j) =  u4(:,:,:,j) - u_mt4;
   u5(:,:,:,j) =  u5(:,:,:,j) - u_mt5;
   u6(:,:,:,j) =  u6(:,:,:,j) - u_mt6;

end

clear u_mt u_mt2 u_mt4 u_mt5 u_mt6 

u0= squeeze(trapz(z_rho,u,3))./2000.0;
u02= squeeze(trapz(z_rho,u2,3))./2000.0;
u04= squeeze(trapz(z_rho,u4,3))./2000.0;
u05= squeeze(trapz(z_rho,u5,3))./2000.0;
u06= squeeze(trapz(z_rho,u6,3))./2000.0;
 
for j=1:200
   u_pert(:,:,j,:) =  squeeze(u(:,:,j,:)) - u0;
   u_pert2(:,:,j,:) =  squeeze(u2(:,:,j,:)) - u02;
   u_pert4(:,:,j,:) =  squeeze(u4(:,:,j,:)) - u04;
   u_pert5(:,:,j,:) =  squeeze(u5(:,:,j,:)) - u05;
   u_pert6(:,:,j,:) =  squeeze(u6(:,:,j,:)) - u06;

end

clear u u2 u4 u5 u6 u0 u02 u04 u05 u06;

% calculating pressure perturbation

rho=(squeeze(ncread(f2,'rho',[1,1,1,1],[lm,200,N,NT])))+1000;
rho2=(squeeze(ncread(f3,'rho',[1,1,1,1],[lm,200,N,NT])))+1000;
rho4=(squeeze(ncread(f4,'rho',[1,1,1,1],[lm,200,N,NT])))+1000;
rho5=(squeeze(ncread(f5,'rho',[1,1,1,1],[lm,200,N,NT])))+1000;
rho6=(squeeze(ncread(f6,'rho',[1,1,1,1],[lm,200,N,NT])))+1000;

rho=rho(:,50:200,200:-1:1,:); 
rho2=rho2(:,50:200,200:-1:1,:);
rho4=rho4(:,50:200,200:-1:1,:);
rho5=rho5(:,50:200,200:-1:1,:);
rho6=rho6(:,50:200,200:-1:1,:);

rho_mt = squeeze(sum(rho,4)./930.0);
rho_mt2 = squeeze(sum(rho2,4)./930.0);
rho_mt4 = squeeze(sum(rho4,4)./930.0);
rho_mt5 = squeeze(sum(rho5,4)./930.0);
rho_mt6 = squeeze(sum(rho6,4)./930.0);


parfor j=1:930
    rho(:,:,:,j)= rho(:,:,:,j) - rho_mt;
    rho2(:,:,:,j)= rho2(:,:,:,j) - rho_mt2;
    rho4(:,:,:,j)= rho4(:,:,:,j) - rho_mt4;
    rho5(:,:,:,j)= rho5(:,:,:,j) - rho_mt5;
    rho6(:,:,:,j)= rho6(:,:,:,j) - rho_mt6;
end

clear rho_mt rho_mt2 rho_mt4 rho_mt5 rho_mt6

pr_s = -squeeze(trapz(z_rho,cumtrapz(z_rho,rho,3),3)./200.0) ;
pr_1 = 10.*cumtrapz(z_rho,rho,3) ;

pr_s2 = -squeeze(trapz(z_rho,cumtrapz(z_rho,rho2,3),3)./200.0) ;
pr_12 = 10.*cumtrapz(z_rho,rho2,3) ;

pr_s4 = -squeeze(trapz(z_rho,cumtrapz(z_rho,rho4,3),3)./200.0) ;
pr_14 = 10.*cumtrapz(z_rho,rho4,3) ;

pr_s5 = -squeeze(trapz(z_rho,cumtrapz(z_rho,rho5,3),3)./200.0) ;
pr_15 = 10.*cumtrapz(z_rho,rho5,3) ;

pr_s6 = -squeeze(trapz(z_rho,cumtrapz(z_rho,rho6,3),3)./200.0) ;
pr_16 = 10.*cumtrapz(z_rho,rho6,3) ;

parfor j=1:200
   pr_pert(:,:,j,:) =  pr_s(:,:,:) + squeeze(pr_1(:,:,j,:));
   pr_pert2(:,:,j,:) =  pr_s2(:,:,:) + squeeze(pr_12(:,:,j,:));
   pr_pert4(:,:,j,:) =  pr_s4(:,:,:) + squeeze(pr_14(:,:,j,:));
   pr_pert5(:,:,j,:) =  pr_s5(:,:,:) + squeeze(pr_15(:,:,j,:));
   pr_pert6(:,:,j,:) =  pr_s6(:,:,:) + squeeze(pr_16(:,:,j,:));
end

toc

clear rho rho2 rho4 rho5 rho6;%%rho_mt=[];
clear pr_s pr_14 pr_15 pr_s4 pr_s5 pr_s6 pr_1 pr_s2 pr_16;%pr_12=[];pr_s4=[];pr_14=[];

pwbda = squeeze(trapz(dy,(trapz(dx,(squeeze(pr_pert(:,:,24,:).*u_pert(:,:,24,:)))))));
pwbda2 = squeeze(trapz(dy,(trapz(dx,(squeeze(pr_pert2(:,:,24,:).*u_pert2(:,:,24,:)))))));
pwbda4 = squeeze(trapz(dy,(trapz(dx,(squeeze(pr_pert4(:,:,24,:).*u_pert4(:,:,24,:)))))));
pwbda5 = squeeze(trapz(dy,(trapz(dx,(squeeze(pr_pert5(:,:,24,:).*u_pert5(:,:,24,:)))))));
pwbda6 = squeeze(trapz(dy,(trapz(dx,(squeeze(pr_pert6(:,:,24,:).*u_pert6(:,:,24,:)))))));

t=(3e+3:3e+3:2.79e+6)/86400; 

str = '#D95319';
color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;

plot(t,-(cumtrapz(3000,pwbda)),'-.v','Color',color,'linewidth',3,'MarkerSize',12,'MarkerIndices', 1:65:length(t));
hold on

str = '#EDB120';
color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;

plot(t,-(cumtrapz(3000,pwbda2)),':d','Color',color,'linewidth',3,'MarkerSize',12,'MarkerIndices', 1:65:length(t));
hold on

str = '#7E2F8E';
color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;

plot(t,-(cumtrapz(3000,pwbda4)),'--x','Color',color,'linewidth',3,'MarkerSize',12,'MarkerIndices', 1:65:length(t));
hold on

str = '#77AC30';
color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;

plot(t,-(cumtrapz(3000,pwbda5)),'-.+','Color',color,'linewidth',3,'MarkerSize',12,'MarkerIndices', 1:65:length(t));

hold on

str = '#4DBEEE';
color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;

plot(t,-(cumtrapz(3000,pwbda6)),'-s','Color',color,'linewidth',3,'MarkerSize',12,'MarkerIndices', 1:65:length(t));


yticks = get(gca,'ytick') ;
scaling  = 1e-12;
newlabels = arrayfun(@(y) sprintf('%.1f', (scaling.*y)) , yticks, 'un', 0);
set(gca,'yticklabel',newlabels);
set(gca,'FontSize',14,'Fontweight','bold'); 
title('(b)')
