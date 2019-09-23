% Base Multiplier
%
%   Shows Multiplication Tables in Different Bases
%
%
%   Can be Adjust to find Square Roots and more
%
%

% Note: Requires the Image Package to be installed 
pkg load image

close all;

%Start Base
B = 1;
% Increment
c = 1;
% End Base
T = 100;
% Iterations
it = 1;
% Root
root =3.0;
% power
pow = 7.0;

l = ceil((T-B)/c+1);

%movMat(l) = struct('cdata',[],'colormap',[]);

j = 0;
for m = 1:1:it
    for k = B:c:T;
        j = j + 1;
        TT =zeros(1);
        for i = 1:1:k
            t = 1:1:k;
            v = mod(i*t,pow*k^(1/(root)));
            TT(i,1:k) = v.';
        end
        % Image Map
        TM = imresize(TT, [T,T]);
        hold on;
        figure(1);
        imshow((TM(1:T-1,1:T-1))/max(max(TM)),'InitialMagnification','fit','colormap',colormap(summer));
        drawnow;
        hold off;


        % Sphere Map
        figure(2);
        hold on;
        colormap(summer);
        [imgIndRows,imgIndCols] = size(TM);
        [X,Y,Z] = sphere(imgIndRows);
        surf(X,Y,Z, 'CData', TM, 'FaceColor','texturemap');
        % print -djpg 'sphere.jpg'
        hold off;
    end
end
figure(1);
print -djpg 'map.jpg'


% Draw Complex Exp. Plot
% figure(3);
% hold on;
% sig = B:c:2*T;
% sigExp = zeros(1,ceil(2*T/c));
% for k=B:c:2*T;    
%     sigExp = sigExp + exp(2i*(k)*pi*sig/(T));
%     plot(sigExp);
%     colormap(hot);
%     drawnow;
%     print -djpg 'complex.jpg'
% end
% hold off;