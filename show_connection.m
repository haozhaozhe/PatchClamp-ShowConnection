function show_connection()
    %% function to plot traces to show connections from Golgi to Granule Cells
	% This function requres to download the class @HEKA_Importer 
    % https://github.com/ChristianKeine/HEKA_Patchmaster_Importer
    % a current version of HEKA_Patchmaster_Importer also uploaded
    % The function plot trace from the cell stimulated (Golgi) and recorded (Granule)
    % written by Zhaozhe Hao from Dr Xiaolong Jiang lab, Aug 07 2019
	
%filePath = 'E:\Dropbox\Jiang_lab\ConnectionCode\';
%fileName = '190805s1c2-c7.dat';

%select HEKA datafile
[fileName,filePath] = uigetfile('*.dat');

%load and parse the HEKE recording
HEKA_rec = HEKA_Importer(fullfile(filePath, fileName));
SampleInterval = HEKA_rec.trees.stimTree{2, 2}.stSampleInterval;
Golgi = str2num(fileName(end-7))
Granule = str2num(fileName(end-4))
Golgi_All_Trace = HEKA_rec.RecTable.dataRaw{1,1}{1, Golgi};
Golgi_Average_mv = mean(Golgi_All_Trace,2)*1000; %average across all sweeps
Granule_All_Trace =  HEKA_rec.RecTable.dataRaw{1,1}{1, Granule};
Granule_Average_mv = mean(Granule_All_Trace,2)*1000; %average across all sweeps
TimeStamp = ((1:length(Granule_All_Trace))-1)*SampleInterval;

%plot the two traces 
h =  figure(1);
subplot(2,1,1);
plot(TimeStamp,Golgi_Average_mv);
xlim ([0 0.7])
ylabel ('GoC membrane potential(mV)');
title(fileName);
subplot(2,1,2)
plot(TimeStamp,Granule_Average_mv);
xlim ([0 0.7])
ylim ([min(Granule_Average_mv)-5,max(Granule_Average_mv)+5])
xlabel('time (sec)');
ylabel ('GC membrane potential(mV)');
saveas(h,[fileName(1:end-4), '.png']);


