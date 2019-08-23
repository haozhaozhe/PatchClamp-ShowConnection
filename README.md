# PatchClamp-ShowConnection

function to plot patch clamp traces to demonstrate the connections from Golgi to Granule Cells

Running this function requires to download the class @HEKA_Importer from https://github.com/ChristianKeine/HEKA_Patchmaster_Importer

The function plots traces from the cell stimulated (Golgi cell GoC) and recorded cell (Granule Cell, GC)

Written by Zhaozhe Hao in Dr Xiaolong Jiang lab, Aug 07 2019

## How to use:
 
Add this function and the folder "@HEKA_Importer" containing all the corresponding files to your Matlab directory.

Run the function, select the .dat file generate by HEKA in the the file dialog box. The two traces will be plotted and saved under the same directory.

Try with 190806s2c2-c7.dat
 
## Input: 
No input necessary. Select the file in the file dialog box.
The file name has to follow the exact same format datecX-cY.dat, where X is the cell stimulated (GoC) and Y is the cell recorded (GC)

## Output:
No output. The plotted trace will automatically saved under the same directory.
