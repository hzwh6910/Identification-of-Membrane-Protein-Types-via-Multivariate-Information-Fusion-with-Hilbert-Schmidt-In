**Identification of Membrane Protein Types via Multivariate Information Fusion with Hilbert-Schmidt Independence Criterion**
=================================================================================================================================
We apply Average Blocks (AvBlock), Discrete Cosine Transform (DCT), Discrete Wavelet Transform(DWT), Histogram of Oriented Gradient (HOG)
and Pseudo-PSSM (PsePSSM) to extract features from PSSM of membrane proteins. These five types of PSSM-based features are employed to construct five kernels. To integrated above five kernels, we propose a Multiple Kernel Support Vector Machine (MKSVM) classifier based on Hilbert Schmidt Independence Criterion (HSIC). Finally, the types of membrane proteins can be predicted by MKSVM-HSIC. The schematic diagram shows in the following
![image](https://github.com/hzwh6910/Identification-of-Membrane-Protein-Types-via-Multivariate-Information-Fusion-with-Hilbert-Schmidt-In/blob/master/jpg/chart.jpg)