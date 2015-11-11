

% fileName = 'aeroplane_urls';
% fid = fopen(fileName);
% cd aeroplane;
% tline = fgetl(fid);
% while ischar(tline)
%     disp(tline)
%     try 
%         myImage = imread(tline);
%     catch myError
%         disp('Error occured. Skipping...');
%         tline = fgetl(fid);
%         continue;
%     end
%     tline = strrep(tline,'/','_');
%     
%     try
%         imwrite(myImage,strcat('aeroplane__',tline));    
%     catch writeError
%         disp('Error during writing. Skipping...');
%         tline = fgetl(fid);
%         continue;
%     end
%     tline = fgetl(fid);
% end
% fclose(fid);
% cd ../

% fileName = 'beach_urls';
% fid = fopen(fileName);
% cd beach;
% tline = fgetl(fid);
% while ischar(tline)
%     disp(tline)
%     try 
%         myImage = imread(tline);
%     catch myError
%         disp('Error occured. Skipping...');
%         tline = fgetl(fid);
%         continue;
%     end
%     tline = strrep(tline,'/','_');
%     
%     try
%         imwrite(myImage,strcat('beach__',tline));    
%     catch writeError
%         disp('Error during writing. Skipping...');
%         tline = fgetl(fid);
%         continue;
%     end
%     tline = fgetl(fid);
% end
% fclose(fid);
% cd ../
% 
% fileName = 'face_urls';
% fid = fopen(fileName);
% cd face;
% tline = fgetl(fid);
% while ischar(tline)
%     disp(tline)
%     try 
%         myImage = imread(tline);
%     catch myError
%         disp('Error occured. Skipping...');
%         tline = fgetl(fid);
%         continue;
%     end
%     tline = strrep(tline,'/','_');
%     
%     try
%         imwrite(myImage,strcat('face__',tline));    
%     catch writeError
%         disp('Error during writing. Skipping...');
%         tline = fgetl(fid);
%         continue;
%     end
%     tline = fgetl(fid);
% end
% fclose(fid);
% cd ../
% 
% fileName = 'flowers_urls';
% fid = fopen(fileName);
% cd flowers;
% tline = fgetl(fid);
% while ischar(tline)
%     disp(tline)
%     try 
%         myImage = imread(tline);
%     catch myError
%         disp('Error occured. Skipping...');
%         tline = fgetl(fid);
%         continue;
%     end
%     tline = strrep(tline,'/','_');
%     
%     try
%         imwrite(myImage,strcat('flowers__',tline));    
%     catch writeError
%         disp('Error during writing. Skipping...');
%         tline = fgetl(fid);
%         continue;
%     end
%     tline = fgetl(fid);
% end
% fclose(fid);
% cd ../

fileName = 'moped_urls';
fid = fopen(fileName);
cd moped;
tline = fgetl(fid);
while ischar(tline)
    disp(tline)
    try 
        myImage = imread(tline);
    catch myError
        disp('Error occured. Skipping...');
        tline = fgetl(fid);
        continue;
    end
    tline = strrep(tline,'/','_');
    
    try
        imwrite(myImage,strcat('moped__',tline));    
    catch writeError
        disp('Error during writing. Skipping...');
        tline = fgetl(fid);
        continue;
    end
    tline = fgetl(fid);
end
fclose(fid);
cd ../

fileName = 'mountain_urls';
fid = fopen(fileName);
cd mountain;
tline = fgetl(fid);
while ischar(tline)
    disp(tline)
    try 
        myImage = imread(tline);
    catch myError
        disp('Error occured. Skipping...');
        tline = fgetl(fid);
        continue;
    end
    tline = strrep(tline,'/','_');
    
    try
        imwrite(myImage,strcat('mountain__',tline));    
    catch writeError
        disp('Error during writing. Skipping...');
        tline = fgetl(fid);
        continue;
    end
    tline = fgetl(fid);
end
fclose(fid);
cd ../

fileName = 'tree_urls';
fid = fopen(fileName);
cd tree;
tline = fgetl(fid);
while ischar(tline)
    disp(tline)
    try 
        myImage = imread(tline);
    catch myError
        disp('Error occured. Skipping...');
        tline = fgetl(fid);
        continue;
    end
    tline = strrep(tline,'/','_');
    
    try
        imwrite(myImage,strcat('tree__',tline));    
    catch writeError
        disp('Error during writing. Skipping...');
        tline = fgetl(fid);
        continue;
    end
    tline = fgetl(fid);
end
fclose(fid);
cd ../