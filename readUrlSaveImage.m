% EE 660 Project
% Manoj Kumar P.A  (manojpamk@gmail.com)

% Execution path : ~/Acads/Fall2015/EE660/ProjectStuff/image_urls

% Reads the list of urls from <classname>_urls, and collects images from
% them, storing in respective folders. 

% NOTE : 
% 1) The url files need to be downloaded from www.image-net.org/
% 2) Some URL links might get stuck. Manual intervention may be necessary.


myclasses = {'dogs','houses','aeroplane','ship','car','motorcycle','bus','beach','mountain','beach'};

for class_index = 1:length(myclasses)
    fileName = sprintf('%s2_urls',cell2mat(myclasses(class_index)));   % Next is flowers2
    fid = fopen(fileName);  
%     mkdir(cell2mat(myclasses(class_index)));
    cd(cell2mat(myclasses(class_index)));
    tline = fgetl(fid);
    while ischar(tline)
        disp(tline)
        try 
            myImage = imread(tline);
        catch myError
            disp('Error during reading. Skipping...');
            tline = fgetl(fid);
            continue;
        end
        tline = strrep(tline,'/','_');
%         error('stop');

        try
            imwrite(myImage,sprintf('%s_%s',cell2mat(myclasses(class_index)),tline));    
        catch writeError
            disp('Error during writing. Skipping...');
            tline = fgetl(fid);
            continue;
        end
        tline = fgetl(fid);
    end
    fclose(fid);
    cd ../
end
