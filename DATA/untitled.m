clear all
close all
clc
AR=2;
Re=350;
caso=strcat("AR",num2str(AR),"RE",num2str(Re));
A=readtable(strcat(caso,"/Run/Runtimedata-27"));
A=table2array(A);
A=A(floor(end/10):end,:);
fx=A(:,6)+A(:,7);
fy=A(:,4)+A(:,5);
t=A(:,3)-A(1,3);

fxf=fft(fx);

omega0=2*pi/t(end);

k=omega0*[1:length(fft(fx))];

figure
loglog(k(2:floor(end/2)),fxf(2:floor(end/2)).*conj(fxf(2:floor(end/2))))
tx=xlabel("$frq$");
ty=ylabel("$psd$");
tx.Interpreter = 'latex';
ty.Interpreter = 'latex';
%tl.Interpreter = 'latex';
tt=title(strcat("AR: ",num2str(AR),", Re=",num2str(Re),""));
tt.Interpreter = 'latex';
set(gca,'TickLabelInterpreter', 'latex');
ax = gca;
ax.FontSize = 20;
x0=10;
y0=10;
width=500;
height=500;
set(gcf,'position',[x0,y0,width,height])
exportgraphics(ax,strcat('/home/emanuele/git/Papers/Floquet/fig/nnl/psd',caso,'.png'),'Resolution',100)

figure
plot(fx,fy)

tx=xlabel("$Cd$");
ty=ylabel("$Cl$");
tx.Interpreter = 'latex';
ty.Interpreter = 'latex';
%tl.Interpreter = 'latex';
tt=title(strcat("AR: ",num2str(AR),", Re=",num2str(Re),""));
tt.Interpreter = 'latex';
set(gca,'TickLabelInterpreter', 'latex');
ax = gca;
ax.FontSize = 20;
x0=10;
y0=10;
width=500;
height=500;
set(gcf,'position',[x0,y0,width,height])
exportgraphics(ax,strcat('/home/emanuele/git/Papers/Floquet/fig/nnl/ClCd',caso,'.png'),'Resolution',100)

figure; hold on
plot(t, fx)
plot(t, fy)