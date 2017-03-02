% This function converts raw fid from PV5.1 to ASCII format
% By Alexey Romanov
% alexey.romanov@tomo.nsc.ru

function [out] = cplx_int32_typecast()
f_id = fopen('fid');
A = fread(f_id,'int32')';
fclose(f_id);
B = reshape(A,[512,size(A,2)/512])';
out = zeros(size(B,1),size(B,2)/2);
for i = 1 : size(B,1)
    for j = 1 : size(B,2)/2
        out(i,j) = B(i,2*j-1) + 1i*B(i,2*j);
    end;
end;
%dlmwrite('fid.txt', out);
save('fid.mat','out');
end
