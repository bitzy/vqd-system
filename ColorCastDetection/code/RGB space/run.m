clc; clear; close all;

Files = '../../database/';
% Name = 'colorcast_normal.bmp';
Name = 'ͼƬ3.jpg';

Image = imread( [ Files, Name ] );
[ row, col, ~ ] = size( Image );

% resize
N = 64;
krow = floor( row / N ) * N;
kcol = floor( col / N ) * N;
Image = Image( 1 : krow, 1 : kcol, : );

% perform
tic
FUN_COLORCASTDETECTION = @( Image ) ColorCastDetection( Image.data );
FLAG = blockproc( Image, [ N, N ], FUN_COLORCASTDETECTION );
toc
[ m, n ] = size( FLAG );
len = m * n;
100 * sum ( FLAG( : ) ) / len
