
function [far, gar] = roc(gen,imp,type,varargin)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%      [far,gar] = roc(gen,imp)
%%      Function to compute ROC
%%      gen = all genuine scores
%%      imp = all impostor scores
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Begin ROC..');
all = [gen ; imp];

TotGen = length(gen);
TotImp = length(imp);
MinScore = min(all)
MaxScore = max(all)
RangeScore = range(all);

hgen = histc(gen, MinScore-1:MaxScore+1);
himp = histc(imp, MinScore-1:MaxScore+1);

gar = cumsum(hgen);
far = cumsum(himp);
    
gar = gar/TotGen*100;
frr = 100 - gar;
far = far/TotImp*100;


% frr = frr/TotGen*100;
% grr = grr/TotImp*100;
% far = 100 - grr;
% gar = 100 - frr;
% if (type=='d')
%     far = 100 - far;
%     gar = 100 - gar;
% end
%figure;
semilogx(far, gar, varargin{:})
xlabel('False Accept Rate(%)', 'FontSize',14);
ylabel('Genuine Accept Rate(%)', 'FontSize',14);
set(gca,'FontSize',14);

[n ind] = min(abs(far-frr));
s=sprintf('EER = %.2f', far(ind));
disp(s);

disp('End ROC..');

