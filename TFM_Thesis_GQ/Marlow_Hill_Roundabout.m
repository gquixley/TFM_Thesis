%% Setup 
clc 
clear all 
close all 
set(0,'DefaultFigureWindowStyle','docked') 
iteration=400; %SS=400, Dev=35
%% Read in 
densityx=dlmread('density.txt'); % Change to density_2hr.txt

%% Split a - lengths 

L = [10, 10, 10, 10, 10, 10, 10, 10, 10, 10,... % 10 = 100m
    3, 3, 3, 3, 3, 7, 3, 3, 10, 10,... 
    3, 3, 3, 3, 3, 3, 3, 3, 3, 3,...
    3, 3, 3, 3, 3, 3, 3, 3, 3, 3,...
    3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 5, 4]; % For x=0.01

L_cumsum = cumsum(L); 
index=[1:52;L_cumsum];
%clear L 

%% Split b - density -> colour transform 
 

eps = 1e-6;

for i=iteration
    maximum_density = max(max(densityx(i,:)));
    minimum_density = min(min(densityx(i,:)));
    median_density = median(median(densityx(i,:)));
    mean_density = mean(mean(densityx(i,:)));
    mode_density = mode(mode(densityx(i,:))); 

end
gamma = (eps*maximum_density - minimum_density)/(eps - 1);
density = (densityx - gamma)/(maximum_density - gamma); 
clear eps gamma 

%% Split c - split 

r01 = density(:,1:L_cumsum(1));
r02 = density(:,L_cumsum(1)+1:L_cumsum(2)); 
r03 = density(:,L_cumsum(2)+1:L_cumsum(3)); 
r04 = density(:,L_cumsum(3)+1:L_cumsum(4)); 
r05 = density(:,L_cumsum(4)+1:L_cumsum(5)); 
r06 = density(:,L_cumsum(5)+1:L_cumsum(6)); 
r07 = density(:,L_cumsum(6)+1:L_cumsum(7)); 
r08 = density(:,L_cumsum(7)+1:L_cumsum(8)); 
r09 = density(:,L_cumsum(8)+1:L_cumsum(9)); 
r10 = density(:,L_cumsum(9)+1:L_cumsum(10)); 
r11 = density(:,L_cumsum(10)+1:L_cumsum(11)); 
r12 = density(:,L_cumsum(11)+1:L_cumsum(12)); 
r13 = density(:,L_cumsum(12)+1:L_cumsum(13)); 
r14 = density(:,L_cumsum(13)+1:L_cumsum(14)); 
r15 = density(:,L_cumsum(14)+1:L_cumsum(15)); 
r16 = density(:,L_cumsum(15)+1:L_cumsum(16)); 
r17 = density(:,L_cumsum(16)+1:L_cumsum(17)); 
r18 = density(:,L_cumsum(17)+1:L_cumsum(18)); 
r19 = density(:,L_cumsum(18)+1:L_cumsum(19)); 
r20 = density(:,L_cumsum(19)+1:L_cumsum(20)); 
r21 = density(:,L_cumsum(20)+1:L_cumsum(21)); 
r22 = density(:,L_cumsum(21)+1:L_cumsum(22)); 
r23 = density(:,L_cumsum(22)+1:L_cumsum(23)); 
r24 = density(:,L_cumsum(23)+1:L_cumsum(24)); 
r25 = density(:,L_cumsum(24)+1:L_cumsum(25)); 
r26 = density(:,L_cumsum(25)+1:L_cumsum(26)); 
r27 = density(:,L_cumsum(26)+1:L_cumsum(27)); 
r28 = density(:,L_cumsum(27)+1:L_cumsum(28)); 
r29 = density(:,L_cumsum(28)+1:L_cumsum(29)); 
r30 = density(:,L_cumsum(29)+1:L_cumsum(30));
r31 = density(:,L_cumsum(30)+1:L_cumsum(31)); 
r32 = density(:,L_cumsum(31)+1:L_cumsum(32)); 
r33 = density(:,L_cumsum(32)+1:L_cumsum(33)); 
r34 = density(:,L_cumsum(33)+1:L_cumsum(34)); 
r35 = density(:,L_cumsum(34)+1:L_cumsum(35));
r36 = density(:,L_cumsum(35)+1:L_cumsum(36));
r37 = density(:,L_cumsum(36)+1:L_cumsum(37)); 
r38 = density(:,L_cumsum(37)+1:L_cumsum(38)); 
r39 = density(:,L_cumsum(38)+1:L_cumsum(39)); 
r40 = density(:,L_cumsum(39)+1:L_cumsum(40)); 
r41 = density(:,L_cumsum(40)+1:L_cumsum(41));
r42 = density(:,L_cumsum(41)+1:L_cumsum(42));
r43 = density(:,L_cumsum(42)+1:L_cumsum(43));
r44 = density(:,L_cumsum(43)+1:L_cumsum(44));
r45 = density(:,L_cumsum(44)+1:L_cumsum(45));
r46 = density(:,L_cumsum(45)+1:L_cumsum(46));
r47 = density(:,L_cumsum(46)+1:L_cumsum(47));
r48 = density(:,L_cumsum(47)+1:L_cumsum(48));
r49 = density(:,L_cumsum(48)+1:L_cumsum(49));
r50 = density(:,L_cumsum(49)+1:L_cumsum(50));
r51 = density(:,L_cumsum(50)+1:L_cumsum(51));
r52 = density(:,L_cumsum(51)+1:L_cumsum(52));


%clear L_cumsum 


%% info 

[nframes , tot_length]=size(density); 

clear density 

%% Define road lines 

close all 

grid on 
grid minor 

xmin = 0; xmax = 1129; 
h = (xmax -xmin)*(1129/765)/2; 
ymin = -h; ymax = h/4; 

%img = imread('map.png'); 
%image('CData',img,'XData',[xmin xmax],'YData',[ymax ymin]) 

% Number of Points, Resolution + 1
%               dx=0.01     dx=0.005
NumA = 11;      % =11         =21
NumB = 4;       % =4          =7
NumC = 8;       % =8          =15
NumD = 5;       % =5          =9
NumE = 6;       % =6         =11

% Outer roads
[r01_x ,r01_y] = arcpoints([101;-726],[308;-437],10000,NumA); 
[r02_x ,r02_y] = arcpoints([33;-279],[274;-330],10000,NumA); 
[r03_x ,r03_y] = arcpoints([36;-270],[275;-308],10000,NumA); 
[r04_x ,r04_y] = arcpoints([415;-177],[320;-27],10000,NumA); 
[r05_x ,r05_y] = arcpoints([344;-5],[442;-164],10000,NumA); 
[r06_x ,r06_y] = arcpoints([733;-246],[917;-12],10000,NumA); 
[r07_x ,r07_y] = arcpoints([936;-18],[755;-263],10000,NumA); 
[r08_x ,r08_y] = arcpoints([790;-395],[1106;-354],500,NumA); 
[r09_x ,r09_y] = arcpoints([774;-439],[1109;-392],500,NumA);
r09_x = fliplr(r09_x); r09_y= fliplr(r09_y);
[r10_x ,r10_y] = arcpoints([335;-451],[134;-744],10000,NumA); 

% Roads connecting inner roundabouts
[r11_x ,r11_y] = arcpoints([311;-410],[301;-357],10000,NumB); 
[r12_x ,r12_y] = arcpoints([332;-347],[340;-394],10000,NumB); 
[r13_x ,r13_y] = arcpoints([313;-292],[406;-205],10000,NumB); 
[r14_x ,r14_y] = arcpoints([430;-227],[340;-308],10000,NumB); 
[r15_x ,r15_y] = arcpoints([471;-188],[553;-204],10000,NumB); 
[r16_x ,r16_y] = arcpoints([703;-287],[464;-225],10000,NumC); 
[r17_x ,r17_y] = arcpoints([756;-295],[765;-368],10000,NumB); 
[r18_x ,r18_y] = arcpoints([732;-374],[715;-308],10000,NumB); 
[r19_x ,r19_y] = arcpoints([726;-432],[372;-440],10000,NumA); 
[r20_x ,r20_y] = arcpoints([374;-406],[715;-396],10000,NumA);

% Bottom left roundabout
[r21_x ,r21_y] = arcpoints([311;-410],[308;-437],100,NumB);
[r36_x ,r36_y] = arcpoints([340;-394],[311;-410],10,NumB);
[r22_x ,r22_y] = arcpoints([374;-406],[340;-394],100,NumB);
[r37_x ,r37_y] = arcpoints([372;-440],[374;-406],10,NumB);
[r23_x ,r23_y] = arcpoints([335;-451],[372;-440],100,NumB);
[r38_x ,r38_y] = arcpoints([308;-437],[335;-451],10,NumB);

[r24_x ,r24_y] = arcpoints([274;-330],[301;-357],100,NumB);
[r39_x ,r39_y] = arcpoints([275;-308],[274;-330],10,NumB);
[r25_x ,r25_y] = arcpoints([313;-292],[275;-308],100,NumB);
[r40_x ,r40_y] = arcpoints([340;-308],[313;-292],10,NumB);
[r26_x ,r26_y] = arcpoints([332;-347],[340;-308],100,NumB);
[r41_x ,r41_y] = arcpoints([301;-357],[332;-347],10,NumB);

%Next roundabout - clockwise
[r27_x ,r27_y] = arcpoints([415;-177],[406;-205],100,NumB);
[r42_x ,r42_y] = arcpoints([442;-166],[415;-177],10,NumB);
[r28_x ,r28_y] = arcpoints([471;-188],[442;-166],1000,NumB);
[r43_x ,r43_y] = arcpoints([464;-225],[471;-188],10,NumB);
[r29_x ,r29_y] = arcpoints([430;-227],[464;-225],1000,NumB); 
[r44_x ,r44_y] = arcpoints([406;-205],[430;-227],10,NumB); 

[r30_x ,r30_y] = arcpoints([733;-246],[713;-254],100,NumB); 
[r45_x ,r45_y] = arcpoints([755;-263],[733;-246],10,NumB); 
[r31_x ,r31_y] = arcpoints([756;-295],[755;-263],100,NumB);
[r46_x ,r46_y] = arcpoints([715;-308],[756;-295],10,NumB);
[r32_x ,r32_y] = arcpoints([703;-287],[715;-308],100,NumB);
[r47_x ,r47_y] = arcpoints([713;-254],[703;-287],10,NumB);

%Next roundabout - clockwise
[r33_x ,r33_y] = arcpoints([790;-395],[765;-368],100,NumB);
[r48_x ,r48_y] = arcpoints([774;-439],[790;-395],10,NumB);
[r34_x ,r34_y] = arcpoints([726;-432],[774;-439],100,NumB);
[r49_x ,r49_y] = arcpoints([715;-396],[726;-432],10,NumB);
[r35_x ,r35_y] = arcpoints([732;-374],[715;-396],100,NumB);
[r50_x ,r50_y] = arcpoints([765;-368],[732;-374],10,NumB);

[r51_x ,r51_y] = arcpoints([561;-9],[553;-204],1000,NumE);
[r52_x ,r52_y] = arcpoints([553;-204],[713;-254],1000,NumD);

%% Plot map lines 
figure
hold on 
plot(r01_x ,r01_y , 'k') 
plot(r02_x ,r02_y , 'k') 
plot(r03_x ,r03_y , 'k') 
plot(r04_x ,r04_y , 'k') 
plot(r05_x ,r05_y , 'k') 
plot(r06_x ,r06_y , 'k')
plot(r07_x ,r07_y , 'k') 
plot(r08_x ,r08_y , 'k') 
plot(r09_x ,r09_y , 'k') 
plot(r10_x ,r10_y , 'k') 
plot(r11_x ,r11_y , 'k') 
plot(r12_x ,r12_y , 'k') 
plot(r13_x ,r13_y , 'k') 
plot(r14_x ,r14_y , 'k') 
plot(r15_x ,r15_y , 'k') 
plot(r16_x ,r16_y , 'k') 
plot(r17_x ,r17_y , 'k') 
plot(r18_x ,r18_y , 'k') 
plot(r19_x ,r19_y , 'k') 
plot(r20_x ,r20_y , 'k')
plot(r21_x ,r21_y , 'k') 
plot(r22_x ,r22_y , 'k') 
plot(r23_x ,r23_y , 'k') 
plot(r24_x ,r24_y , 'k') 
plot(r25_x ,r25_y , 'k') 
plot(r26_x ,r26_y , 'k')
plot(r27_x ,r27_y , 'k') 
plot(r28_x ,r28_y , 'k') 
plot(r29_x ,r29_y , 'k') 
plot(r30_x ,r30_y , 'k') 
plot(r31_x ,r31_y , 'k') 
plot(r32_x ,r32_y , 'k') 
plot(r33_x ,r33_y , 'k') 
plot(r34_x ,r34_y , 'k') 
plot(r35_x ,r35_y , 'k') 
plot(r36_x ,r36_y , 'k') 
plot(r37_x ,r37_y , 'k') 
plot(r38_x ,r38_y , 'k') 
plot(r39_x ,r39_y , 'k') 
plot(r40_x ,r40_y , 'k')
plot(r41_x ,r41_y , 'k') 
plot(r42_x ,r42_y , 'k') 
plot(r43_x ,r43_y , 'k') 
plot(r44_x ,r44_y , 'k') 
plot(r45_x ,r45_y , 'k') 
plot(r46_x ,r46_y , 'k') 
plot(r47_x ,r47_y , 'k') 
plot(r48_x ,r48_y , 'k') 
plot(r49_x ,r49_y , 'k') 
plot(r50_x ,r50_y , 'k')
plot(r51_x ,r51_y , 'k')
plot(r52_x ,r52_y , 'k')

hold off 

xlim([xmin xmax]*1.1) 
ylim([ymin ymax]*1.1) 

%pbaspect([1 1 1]) 
axis equal 
%box off 
%axis off 

clear h img

%% Physical Animation 

close all 
%figure 

siz = 12; 
%img = imread('map.png'); 

for i=iteration%:100%nframes 
    clf
    %plot([-100 -101],[100 101]) 
    
    denlineplot(r01_x ,r01_y ,r01(i,:)) 
    denlineplot(r02_x ,r02_y ,r02(i,:)) 
    denlineplot(r03_x ,r03_y ,r03(i,:)) 
    denlineplot(r04_x ,r04_y ,r04(i,:)) 
    denlineplot(r05_x ,r05_y ,r05(i,:)) 
    denlineplot(r06_x ,r06_y ,r06(i,:)) 
    denlineplot(r07_x ,r07_y ,r07(i,:)) 
    denlineplot(r08_x ,r08_y ,r08(i,:)) 
    denlineplot(r09_x ,r09_y ,r09(i,:)) 
    denlineplot(r10_x ,r10_y ,r10(i,:)) 
    denlineplot(r11_x ,r11_y ,r11(i,:)) 
    denlineplot(r12_x ,r12_y ,r12(i,:)) 
    denlineplot(r13_x ,r13_y ,r13(i,:)) 
    denlineplot(r14_x ,r14_y ,r14(i,:)) 
    denlineplot(r15_x ,r15_y ,r15(i,:)) 
    denlineplot(r16_x ,r16_y ,r16(i,:)) 
    denlineplot(r17_x ,r17_y ,r17(i,:)) 
    denlineplot(r18_x ,r18_y ,r18(i,:)) 
    denlineplot(r19_x ,r19_y ,r19(i,:)) 
    denlineplot(r20_x ,r20_y ,r20(i,:))
    denlineplot(r21_x ,r21_y ,r21(i,:)) 
    denlineplot(r22_x ,r22_y ,r22(i,:)) 
    denlineplot(r23_x ,r23_y ,r23(i,:)) 
    denlineplot(r24_x ,r24_y ,r24(i,:)) 
    denlineplot(r25_x ,r25_y ,r25(i,:)) 
    denlineplot(r26_x ,r26_y ,r26(i,:)) 
    denlineplot(r27_x ,r27_y ,r27(i,:)) 
    denlineplot(r28_x ,r28_y ,r28(i,:)) 
    denlineplot(r29_x ,r29_y ,r29(i,:)) 
    denlineplot(r30_x ,r30_y ,r30(i,:)) 
    denlineplot(r31_x ,r31_y ,r31(i,:)) 
    denlineplot(r32_x ,r32_y ,r32(i,:)) 
    denlineplot(r33_x ,r33_y ,r33(i,:)) 
    denlineplot(r34_x ,r34_y ,r34(i,:)) 
    denlineplot(r35_x ,r35_y ,r35(i,:)) 
    denlineplot(r36_x ,r36_y ,r36(i,:)) 
    denlineplot(r37_x ,r37_y ,r37(i,:)) 
    denlineplot(r38_x ,r38_y ,r38(i,:)) 
    denlineplot(r39_x ,r39_y ,r39(i,:)) 
    denlineplot(r40_x ,r40_y ,r40(i,:))
    denlineplot(r41_x ,r41_y ,r41(i,:)) 
    denlineplot(r42_x ,r42_y ,r42(i,:)) 
    denlineplot(r43_x ,r43_y ,r43(i,:)) 
    denlineplot(r44_x ,r44_y ,r44(i,:)) 
    denlineplot(r45_x ,r45_y ,r45(i,:)) 
    denlineplot(r46_x ,r46_y ,r46(i,:)) 
    denlineplot(r47_x ,r47_y ,r47(i,:)) 
    denlineplot(r48_x ,r48_y ,r48(i,:)) 
    denlineplot(r49_x ,r49_y ,r49(i,:)) 
    denlineplot(r50_x ,r50_y ,r50(i,:))
    denlineplot(r51_x ,r51_y ,r51(i,:))
    denlineplot(r52_x ,r52_y ,r52(i,:))
    box on
    % colourbar 
    denlineplot(linspace(100,1100,100),ones(100,2)*(-850),linspace(1e-10,1,99)) 
    
    strings_stats={sprintf('Max %5.4f',maximum_density) ,... 
    sprintf('Min %5.4f',minimum_density),  ...
    sprintf('Median %5.4f',median_density), ...
    sprintf('Mean %5.4f', mean_density), ...
    sprintf('Mode %5.4f', mode_density)};

    strings_values={sprintf('Out %5.3f',densityx(i,60)),...
    sprintf('In %5.3f',densityx(i,70)),...
    sprintf('In %5.3f',densityx(i,243)),...
    sprintf('In %5.3f',densityx(i,50)),...
    sprintf('Out %5.3f',densityx(i,40)),...
    sprintf('In %5.3f',densityx(i,30)),...
    sprintf('Out %5.3f',densityx(i,20)),...
    sprintf('In %5.3f',densityx(i,10)),...
    sprintf('Out %5.3f',densityx(i,100)),...
    sprintf('In %5.3f',densityx(i,90)),...
    sprintf('Out %5.3f',densityx(i,80))};
    text([1100,1100,600,300,300,-150,-150,-80,-80,1270,1270]...
        ,[80,20,80,85,25,-240,-300,-710,-770,-380,-320],strings_values,...
        'HorizontalAlignment','center');
    
    text([1000, 100, 550, 550, 550],...
        [-900, -900, -960, -900, -1020],strings_stats ,... 
        'HorizontalAlignment','center');
    
    string_max={sprintf('Max %5.3f',densityx(i,163))}; %178 for amersham hill OR 161 for hospital
    text(220,-220,string_max,'HorizontalAlignment','center'); %670,-150 for amersham hill
    %220,-220 for hospital
    
    text(600,-750,'Density , \rho [cars/km]',... 
        'HorizontalAlignment','center');
    text(-400,310,sprintf('Frame %d, time t=%2.4f[Hrs]',i,i*2/nframes)) 
    text(-400,250,'Riemann solver : HLLE')
    text(-400,190,'Velocity Model : Bell-Shaped')
    text(-400,130,'Reconstruction : Second Order') 
    
    xlim([xmin xmax]*1.2) 
    ylim([ymin ymax]*1.2)  
    
    pbaspect([1 1 1]) 
    axis equal 
    box off 
    axis off 
    
        set(gcf,'PaperSize',[siz,siz]); 
%         %filename=sprintf('frame%04i',i); 
%         %print(filename ,'-dpdf') 
   drawnow     %Enable when doing animation
end
