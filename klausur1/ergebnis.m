clear
maxpunkte = 29;
reduktion = 0;
dateiname = 'sage klausur 1.xls';

%%%%
[nums, txts] = xlsread(dateiname);
studenten = cell(length(nums)-1,3);
for idx = 1: length(nums)-1
  studenten{idx,1} = txts{idx+1,1};
  studenten{idx,2} = nums(idx+1,8);
end

%studenten = {'A.Latal',25.5;'Max Koellmer',36;'Lisa Thom',45.5;'Sven Goedeke',53.5;'Simon Gourevitch',10.5};

minpunkte = floor((maxpunkte-reduktion)/2);
spanne = (maxpunkte-minpunkte)/10;
punkte = wrev((maxpunkte-reduktion-spanne):-spanne:(minpunkte));
noten = wrev([1 1.3 1.7 2 2.3 2.7 3 3.3 3.7 4]);

for idx = 1: length(studenten)
  dum = sum(studenten{idx,2} >= punkte);
  if dum == 0
    notenspiegel(idx) = 5;
    studenten{idx,3} = notenspiegel(idx);
  else
    notenspiegel(idx) = noten(dum);
    studenten{idx,3} = notenspiegel(idx);
  end
end

plot(punkte,noten,'x',[studenten{:,2}],notenspiegel,'*')
grid on

piech = zeros(1,5);
for idx = 1:length(studenten)
  %floor(studenten{idx,3})
  piech(round(studenten{idx,3})) = piech(round(studenten{idx,3}))+1;
end
pie (piech)
legend('1','2','3','4','5')
%studenten
sprintf('Mittelwert : %.2f', mean([studenten{:,3}],2))

if true
  file = fopen('test.txt','w');
  for idx = 1:length(studenten)
    fprintf(file,'%25s :  %8.3f  %8.3f \n', studenten{idx,1}, studenten{idx,2},studenten{idx,3});
  end
  fclose(file);
end

%A. Latal : 3.7
% Max Koellmer: 2.7
%Lisa Thom: 2
% Sven Goedeke: 1.3
% Simon Gourevitch: 5