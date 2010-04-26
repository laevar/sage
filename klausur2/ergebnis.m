clear
maxpunkte = 29;
reduktion = 0;
dateiname = 'sage klausur 2.xls';

%%%%
[nums, txts] = xlsread(dateiname);
studenten = cell(size(nums,1)-1,3);
for idx = 2: size(nums,1)
  studenten{idx-1,1} = txts{idx,1};
  studenten{idx-1,2} = nums(idx,8);
end

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

%figure
%plot(punkte,noten,'x',[studenten{:,2}],notenspiegel,'*')
%grid on

figure
piech = zeros(1,5);
for idx = 1:length(studenten)
  %floor(studenten{idx,3})
  piech(round(studenten{idx,3})) = piech(round(studenten{idx,3}))+1;
end
pie (piech)
%legend('1','2','3','4','5')
legend('1','4','5')
%studenten
sprintf('Mittelwert : %.2f', mean([studenten{:,3}],2))

if true
  file = fopen('test.txt','w');
  for idx = 1:length(studenten)
    fprintf(file,'%25s :  %8.3f  %8.3f \n', studenten{idx,1}, studenten{idx,2},studenten{idx,3});
  end
  fclose(file);
end