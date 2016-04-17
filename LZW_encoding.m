% Created by Chandrahas Tirumalasetty 16-April-2016
% licensed under The MIT License (MIT)
% Copyright (c) 2016 Chandrahas Tirumalasetty
% Visit https://opensource.org/licenses/mit-license.php
clc;
clear all;
icode=input('Enter array of integers as row matrix:');
l=length(icode);
s=[];
out=[];
dic={};
for k=1:l
    [r,c]=size(dic);
    y=0;
    for h=1:r
        if dic{h,1}==icode(k);
            y=1;
        end 
    end
  if ~(y==1)
      dic{r+1,1}=icode(k);
  end 
end 

for n=1:l
    ch=icode(n);
    check=[s ch];
    match=0;
    matchrow=0;
    [r,c]=size(dic);
    for p=1:r
     if length(dic{p,1})==length(check)
         if dic{p,1}==check
             match=1;
         end 
     end
    end 
    if match==1
       s=check;
    else 
        for p=1:r
            if length(dic{p,1})==length(s)
                if dic{p,1}==s
                    matchrow=p;
                end
            end
        end 
        out=[out matchrow];
        dic{r+1,1}=check;
        s=ch;
    end 
end 
display('Dictionary created for LZW encoding');
[r,c]=size(dic);
for j=1:r
X=[sprintf('Dictionary Entry No-%d ---> ',j),'[',num2str(dic{j,1}),']'];
disp(X);
end
X=[sprintf('LZW encoded output code as entries in above dictionary is\n'),'[',num2str(out),']'];
disp(X);
