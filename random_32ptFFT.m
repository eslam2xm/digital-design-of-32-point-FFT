clear; clc;

x = randi([0 127],1,32); %generate the signal

Y = fft(x,32); %Compute the Fourier transform of the signal. 
