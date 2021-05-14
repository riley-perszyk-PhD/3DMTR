function [fullAlign fullNumAlign] = makeFullAlignment(s1,s2,s3,n1,n2,n3)
fullAlign = '';
fullNumAlign = [];
for i = 1:size(s1,2)
    if i==552
        a=1;
    end
    if n1(1,i) ~= 0
        if s1(1,i)=='X'
            fullAlign(1,i) = s1(1,i);
            continue
        end
        if i==206
            a=1;
        end
        [pdbG,varG,var] = pdbResRelatedToX(n1,n2,n3,n1(1,i));
        pdbGI = find(n1(3,:)==pdbG,1);
        varGI = find(n2(3,:)==varG,1);
        varI = find(n3(3,:)==var,1);
        
        fullAlign(1,i) = s1(1,i);
        fullAlign(2,i) = s1(2,i);
        fullAlign(3,i) = s1(3,i);
        fullNumAlign(1,i) = n1(1,i);
        fullNumAlign(3,i) = n1(3,i);
%         i
        pdbGI;
%         if i == 582
%             a=1;
%         end
% i
        if varGI<=size(n2,2)
        if n2(1,varGI) ~= 0
            fullAlign(4,i) = s2(2,varGI);
            fullAlign(5,i) = s2(3,varGI);
            fullNumAlign(5,i) = n2(3,varGI);
        else
            a=1;
%         fullAlign(1,i) = fullAlign(1,i-1);
%         fullAlign(2,i) = fullAlign(2,i-1);
%         fullAlign(3,i) = fullAlign(3,i-1);
%         fullNumAlign(1,i) = fullNumAlign(1,i-1);
%         fullNumAlign(3,i) = fullNumAlign(3,i-1);
%         fullAlign(1,i-1) = '-';
%         fullAlign(2,i-1) = ' ';
%         fullAlign(3,i-1) = '-';
%         fullNumAlign(1,i-1) = 0;
%         fullNumAlign(3,i-1) = 0;
%             fullAlign(4,i) = s2(2,pdbGI);
%             fullAlign(5,i) = s2(3,pdbGI);
%             fullNumAlign(5,i) = n2(3,pdbGI);
        end
        end
        
        
        if varI<=size(n3,2)
        if n3(1,varI) ~= 0
            if s3(3,varI)=='X'
                continue
            end
            fullAlign(6,i) = s3(2,varI);
            fullAlign(7,i) = s3(3,varI);
            fullNumAlign(7,i) = n3(3,varI);
        else
            a=1;
%         fullAlign(1,i) = fullAlign(1,i-1);
%         fullAlign(2,i) = fullAlign(2,i-1);
%         fullAlign(3,i) = fullAlign(3,i-1);
%         fullNumAlign(1,i) = fullNumAlign(1,i-1);
%         fullNumAlign(3,i) = fullNumAlign(3,i-1);
%             fullAlign(4,i) = fullAlign(4,i-1);
%             fullAlign(5,i) = fullAlign(5,i-1);
%             fullNumAlign(5,i) = fullNumAlign(5,i-1);
%         fullAlign(1,i-1) = '-';
%         fullAlign(2,i-1) = ' ';
%         fullAlign(3,i-1) = '-';
%         fullNumAlign(1,i-1) = 0;
%         fullNumAlign(3,i-1) = 0;
%             fullAlign(4,i-1) = ' ';
%             fullAlign(5,i-1) = '-';
%             fullNumAlign(5,i-1) = 0;
%             fullAlign(6,i) = s3(2,pdbGI);
%             fullAlign(7,i) = s3(3,pdbGI);
%             fullNumAlign(7,i) = n3(3,pdbGI);
        end
        end
        
    else
        fullAlign(1,i) = '-';
        fullNumAlign(1,i) = 0;
        
    end
end
end