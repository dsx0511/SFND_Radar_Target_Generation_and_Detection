# Project report

## Implementation steps for the 2D CFAR process. 
First, the cell under test (CUT) is slid in both range and doppler dimension of the matrix `RDM`.
To ensure the size of training and guard cells in all directions, the sliding window starts and ends with margin from the edges.
For every CUT, all cells within the window defined with training and guard cell sizes are checked.
If the cell belongs to training cells, the value is added to the scalar named `noise_level`.
After iterating over all cells in the window, the noise level is first normalized using the number of training cells and then the offset is added to the noise level.
Then if the value of CUT is smaller than the final noise level, it is set to zero, otherwise 1.
This procedure is repeated on all possible CUTs in the matrix.
After that, the values of the cells on the boundary, which are not considered as CUT, are also set to zero.

## Selection of Training, Guard cells and offset.
With Tr=10, Td=8, Gr=4, Gd=4, offset=8, it can reproduce the output in the lesson.
<image src="1.png">

With a lower range of training and guard size (Tr=8, Td=4, Gr=4, Gd=2, offset=8), some noise appeared on the right side. But the result is still acceptable.
<image src="2.png">

However, by decreasing the offset to 6 (Tr=10, Td=8, Gr=4, Gd=4, offset=6), a plenty of noise signals are kept.
<image src="3.png">

## Steps taken to suppress the non-thresholded cells at the edges.
The program first iterates over the range dimension (row of the matrix).
If the distance of current row to an edge is lower than or equal to the sum of training and guard cell size `Tr+Gr`, all cells in this row are set to zero.
The similar iteration is then applied to the doppler dimension, which sets all cells in a column to zero if the distance of this column to an edge is lower than or equal to `Td+Gd`.