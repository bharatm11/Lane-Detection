figure
for i=1:1:size(color_mask,3)
    a=color_mask(:,:,i);
    load BW1.mat
    [H1,T1,R1] = hough(a,'RhoResolution',0.5,'Theta',40:1:60);
    [H2,T2,R2] = hough(a,'RhoResolution',0.5,'Theta',(-70):1:(-50));

imshow(video(:,:,:,i));hold on;
P1  = houghpeaks(H1,3,'threshold',ceil(0.3*max(H1(:))));
P2  = houghpeaks(H2,3,'threshold',ceil(0.3*max(H2(:))));
x1 = T1(P1(:,2));
y1 = R1(P1(:,1));
x2 = T2(P2(:,2));
y2 = R2(P2(:,1));
lines2 = houghlines(a,T2,R2,P2,'FillGap',5,'MinLength',10);
lines= [lines1 lines2];
left_xs=0;
left_ys=0;
right_xs=0;
right_ys=0;
for k = 1:length(lines1)
    left_xs1(k,1)=lines1(k).point1(1);
    left_ys1(k,1)=lines1(k).point1(2);
    left_xs2(k,1)=lines1(k).point2(1);
    left_ys2(k,1)=lines1(k).point2(2);
    
    
end

for k=1:length(lines2)
    right_xs1(k,1)=lines2(k).point1(1);
    right_ys1(k,1)=lines2(k).point1(2);
    right_xs2(k,1)=lines2(k).point2(1);
    right_ys2(k,1)=lines2(k).point2(2);
    
end
left_xs=[left_xs1;left_xs2];
left_ys=[left_ys1;left_ys2];
right_xs=[right_xs1;right_xs2];
right_ys=[right_ys1;right_ys2];

left_curve=fit(left_xs ,left_ys ,'poly2');
right_curve=fit(right_xs ,right_ys ,'poly2');

r=plot(right_curve,right_xs,right_ys);
l=plot(left_curve,left_xs,left_ys);
set(r,'Color','b','LineWidth',3);
set(l,'Color','r','LineWidth',3);

legend('off');
F(i) = getframe();
end

