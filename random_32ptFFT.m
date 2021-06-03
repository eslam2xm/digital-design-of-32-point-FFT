clear; clc;

x = randi([0 127],1,32); %generate the signal

y = fft(x,32); %Compute the Fourier transform of the signal. 

%dump this data into external files
inputFile = fopen('input.txt','w');
fprintf(inputFile,'%d\n',x);
fclose(inputFile);

outputFile = fopen('output.txt','w');
fprintf(outputFile,'%d\n',y);
fclose(outputFile);