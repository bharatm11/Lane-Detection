%% Read data frame by frame

% Uncomment line 4 for "Project Video" and line 5 for "Challenge Video"

obj=VideoReader('project_video.mp4');
%obj=VideoReader('challenge_video.mp4');
video=obj.read(); %#ok<VIDREAD>
%% GrayScale
for i=1:1:size(video,4)
    gray_vid(:,:,i)=rgb2gray(video(:,:,:,i));
    
    
    %% Edge Detection and Clean
    
    
    edges(:,:,i)=edge(gray_vid(:,:,i),'sobel','vertical');
    edges(:,:,i)=bwmorph(edges(:,:,i),'clean');
    edges(:,:,i)=bwmorph(edges(:,:,i),'thicken');
    
    
    
    %% Calculate Color Mask
    
    
    alpha=video(:,:,:,i);
    color_mask(:,:,i)=im2bw(max(alpha(:,:,1),alpha(:,:,2)),0.65);
    
    
    %% Apply Color Mask
    
    color_mask(:,:,i)=edges(:,:,i).*color_mask(:,:,i);
    
    
    %% Mask Top Half and Sides
    
    
    for k=1:1:0.6*size(color_mask ,1)
        color_mask(k,:,i)=0;
    end
    for k=1:1:0.2*size(color_mask ,2)
        color_mask(:,k,i)=0;
    end
    for k=0.8*size(color_mask ,2):1:size(color_mask ,2)
        color_mask(:,k,i)=0;
    end
   processed_color_mask(:,:,i)=color_mask((570:710),(570:710),i)*0;
    
       
    disp(i);
    pause(0.003)
end

    