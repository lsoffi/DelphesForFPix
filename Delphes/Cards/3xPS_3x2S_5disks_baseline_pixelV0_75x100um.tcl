set SkipEvents 0
set MaxEvents 10
set TrackerAcceptance 4.3
set ErrorFile errors.root

set PTResolution {
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.004   +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.004   +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0045  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.0066  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.0101  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.004   +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.004   +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.0045  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.0066  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.0102  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.004   +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.004   +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0046  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.0069  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.0101  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0051  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.0049  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0051  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.0067  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.0101  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0043  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.0043  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.0048  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.0069  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.0104  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0045  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.0045  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.005   +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.0071  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.0105  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0048  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.0048  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0052  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.0075  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.0103  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0049  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.0049  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.0057  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.0079  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.0108  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0051  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0051  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.0056  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.0075  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.0106  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0052  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.0052  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.006   +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.0085  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.0114  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0069  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.0069  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0076  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.0105  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.0152  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0093  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.0093  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.0097  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.0137  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.0182  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0106  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.0105  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.0111  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.0147  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.0205  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.013   +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.0127  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.013   +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0158  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.0195  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.014   +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.0138  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.0143  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0177  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.0207  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.014   +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.0136  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.014   +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.018   +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.0223  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0138  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.0143  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.0146  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0154  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.0198  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.014   +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.0141  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.0146  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.0189  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.0223  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0145  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.0151  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.0156  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.0211  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.0256  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.014   +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.0143  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.0156  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.0208  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.0316  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0137  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.0138  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.0157  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.0236  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.0319  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0139  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.0137  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.0177  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.0275  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.0334  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0134  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.0123  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.017   +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.0246  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.0345  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0137  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.0137  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.0156  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.0246  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.0388  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.016   +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.0155  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.0169  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.0252  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.0426  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0162  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.0165  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.0188  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.0318  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.0563  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0174  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.0175  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.0206  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.0358  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.0577  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0212  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.0211  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.024   +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.0395  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.0677  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0206  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.0208  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.026   +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.0491  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.0879  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0223  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.0226  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.0287  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.0602  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.1266  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0242  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.0244  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.0314  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.0782  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.1513  +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0399  +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * 0.039   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * 0.0738  +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * 0.292   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * 0.573   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0251  +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * 0.0259  +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * 0.0526  +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * 0.1738  +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * 0.3264  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0298  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * 0.0304  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * 0.0496  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * 0.1753  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * 0.3483  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0264  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * 0.0262  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * 0.0445  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * 0.1585  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * 0.3079  +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0257  +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * 0.026   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * 0.0497  +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * 0.1853  +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * 0.3675  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0283  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * 0.0289  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * 0.0545  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * 0.2108  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * 0.416   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0353  +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * 0.0367  +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * 0.06    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * 0.2909  +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * 0.603   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0408  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * 0.0418  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * 0.0858  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * 0.3604  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * 0.718   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0481  +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 1   && pt <= 10  ) * 0.0492  +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 10  && pt <= 50  ) * 0.1017  +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 50  && pt <= 100 ) * 0.5931  +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 100              ) * 1.1982  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0508  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 1   && pt <= 10  ) * 0.0508  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 10  && pt <= 50  ) * 0.1791  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 50  && pt <= 100 ) * 0.8634  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 100              ) * 1.725   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.1076  +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 1   && pt <= 10  ) * 0.1191  +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 10  && pt <= 50  ) * 0.725   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 50  && pt <= 100 ) * 3.5967  +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 100              ) * 7.1915  +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 0.7 && pt <= 1   ) * 4.6648  +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 1   && pt <= 10  ) * 7.4169  +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 10  && pt <= 50  ) * 72.5102 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 50  && pt <= 100 ) * 4.5854  +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 100              ) * 9.1693  +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 0.7 && pt <= 1   ) * 5.6721  +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 1   && pt <= 10  ) * 8.057   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 10  && pt <= 50  ) * 80.1335 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 100              ) * -1.0
}

set PResolution {
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0041  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.0041  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0045  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.0066  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.0101  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0043  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.0043  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.0045  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.0066  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.0102  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0047  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.0045  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0046  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.0068  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.0101  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0048  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.0047  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0052  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.0067  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.0102  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0052  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.005   +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.0049  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.0069  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.0104  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0056  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.0052  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.0051  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.0071  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.0105  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.006   +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.0057  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0053  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.0075  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.0104  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0063  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.0059  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.0058  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.0078  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.0109  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0068  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0063  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.0058  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.0076  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.0107  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0078  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.0077  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.0071  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.0086  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.0115  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0092  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.0085  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0078  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.0106  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.0153  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0118  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.0109  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.0099  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.0138  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.0183  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.013   +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.0124  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.0113  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.0148  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.0206  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0154  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.0144  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.0131  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0159  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.0196  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0168  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.0158  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.0149  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0178  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.0208  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0169  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.0156  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.0144  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.0181  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.0225  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0174  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.0165  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.0149  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0155  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.0204  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0176  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.0165  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.0148  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.019   +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.0226  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0172  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.0164  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.0161  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.0212  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.0258  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0175  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.0165  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.0159  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.0209  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.0316  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0174  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.0167  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.0161  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.0236  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.032   +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.018   +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.0166  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.018   +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.0267  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.0336  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0187  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.0168  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.0174  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.0248  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.0346  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0183  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.0169  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.016   +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.0246  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.0389  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.02    +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.0188  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.0175  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.0254  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.0428  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0219  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.0209  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.0194  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.032   +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.0564  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0225  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.0209  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.0212  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.036   +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.0578  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0262  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.0247  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.0244  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.0397  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.0678  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0273  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.0258  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.0263  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.0493  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.0881  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0259  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.0249  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.0294  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.0681  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.1269  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0281  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.0273  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.0318  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.0785  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.1516  +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0488  +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * 0.0438  +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * 0.0742  +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * 0.2927  +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * 0.5735  +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0289  +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * 0.0284  +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * 0.0533  +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * 0.174   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * 0.3267  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0326  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * 0.0327  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * 0.05    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * 0.1755  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * 0.3485  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0304  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * 0.0293  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * 0.045   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * 0.1584  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * 0.3078  +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0292  +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * 0.0286  +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * 0.05    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * 0.1856  +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * 0.3677  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0345  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * 0.0321  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * 0.055   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * 0.2111  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * 0.4162  +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0487  +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * 0.0477  +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * 0.0604  +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * 0.2907  +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * 0.603   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0462  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * 0.0464  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * 0.0864  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * 0.3607  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * 0.7183  +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0518  +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 1   && pt <= 10  ) * 0.0536  +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 10  && pt <= 50  ) * 0.103   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 50  && pt <= 100 ) * 0.5881  +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 100              ) * 1.1933  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0564  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 1   && pt <= 10  ) * 0.0547  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 10  && pt <= 50  ) * 0.1798  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 50  && pt <= 100 ) * 0.864   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 100              ) * 1.7256  +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.1134  +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 1   && pt <= 10  ) * 0.123   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 10  && pt <= 50  ) * 0.7259  +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 50  && pt <= 100 ) * 3.5976  +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 100              ) * 7.1924  +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 0.7 && pt <= 1   ) * 4.6686  +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 1   && pt <= 10  ) * 7.4292  +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 10  && pt <= 50  ) * 72.5324 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 50  && pt <= 100 ) * 4.5868  +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 100              ) * 9.1707  +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 0.7 && pt <= 1   ) * 5.6784  +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 1   && pt <= 10  ) * 8.0616  +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 10  && pt <= 50  ) * 80.1357 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 100              ) * -1.0
}

set D0Resolution {
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0578 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.0411 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0098 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.0061 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.0058 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0598 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.0417 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.01   +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.0062 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.0058 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0583 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.0421 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0102 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.0062 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.0058 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0595 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.0443 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0099 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.0062 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.0057 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.06   +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.0475 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.0099 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.0062 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.0058 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0642 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.0451 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.0104 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.0062 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.0058 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0689 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.047  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0098 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.006  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.0056 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0686 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.0496 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.0103 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.0062 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.0057 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0699 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0503 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.0106 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.0063 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.0058 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0706 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.0506 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.0109 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.0064 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.0063 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0768 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.0553 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0112 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.0068 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.0063 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0751 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.0537 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.0113 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.0073 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.0066 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.08   +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.0569 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.0115 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.0073 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.0067 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0882 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.0621 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.0123 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0074 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.0066 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0989 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.071  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.0131 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0075 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.0067 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0973 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.0694 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.0127 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.0076 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.0066 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0994 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.0702 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.0127 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0075 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.0066 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.1028 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.0725 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.0139 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.0076 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.0068 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.1069 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.0751 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.0142 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.0079 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.0069 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.1153 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.082  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.0141 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.0078 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.007  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.1263 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.0887 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.0141 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.0078 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.0071 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.1431 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.1009 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.015  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.0079 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.007  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.1399 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.0979 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.0155 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.0075 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.007  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.1386 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.0979 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.0152 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.0075 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.0068 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.1369 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.0966 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.0153 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.0074 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.0072 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.1571 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.1011 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.017  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.0079 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.0074 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.1462 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.1036 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.0153 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.0074 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.0067 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.1534 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.1088 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.0169 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.0075 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.0068 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.1632 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.0948 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.0158 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.0079 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.0075 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.1192 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.0737 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.0153 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.0081 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.0084 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.1373 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.1007 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.0154 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.0101 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.0099 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.1237 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * 0.0896 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * 0.0196 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * 0.0157 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * 0.0153 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.1217 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * 0.0887 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * 0.0203 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * 0.0178 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * 0.0177 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.1188 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * 0.0854 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * 0.0182 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * 0.014  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * 0.0139 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.1323 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * 0.0934 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * 0.0169 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * 0.0124 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * 0.0123 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.1454 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * 0.1037 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * 0.0189 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * 0.0156 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * 0.0155 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.1376 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * 0.0984 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * 0.0175 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * 0.0141 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * 0.014  +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.1468 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * 0.1067 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * 0.0242 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * 0.0205 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * 0.0203 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.1566 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * 0.112  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * 0.0254 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * 0.0218 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * 0.0217 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.1507 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 1   && pt <= 10  ) * 0.1034 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 10  && pt <= 50  ) * 0.0442 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 50  && pt <= 100 ) * 0.0426 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 100              ) * 0.0426 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.161  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 1   && pt <= 10  ) * 0.1252 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 10  && pt <= 50  ) * 0.0443 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 50  && pt <= 100 ) * 0.0429 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 100              ) * 0.0429 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.1832 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 1   && pt <= 10  ) * 0.1396 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 10  && pt <= 50  ) * 0.0981 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 50  && pt <= 100 ) * 0.0973 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 100              ) * 0.0972 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 0.7 && pt <= 1   ) * 9.3705 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 1   && pt <= 10  ) * 9.3199 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 10  && pt <= 50  ) * 9.2714 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 50  && pt <= 100 ) * 9.2653 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 100              ) * 9.2797 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 0.7 && pt <= 1   ) * 9.3355 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 1   && pt <= 10  ) * 9.2575 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 10  && pt <= 50  ) * 9.1828 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 50  && pt <= 100 ) * 9.1821 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 100              ) * 9.182  +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 100              ) * -1.0
}

set ZResolution {
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0621 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.0488 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0173 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.0161 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.016  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0674 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.0528 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.0178 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.0162 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.0162 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0659 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.0507 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0167 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.0161 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.0161 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0726 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.0567 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0175 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.016  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.016  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0745 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.0565 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.0182 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.0164 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.0164 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0809 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.0578 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.0179 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.0159 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.0159 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0865 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.0622 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0172 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.0161 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.016  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0873 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.0671 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.0184 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.0159 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.0158 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.1003 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0751 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.0194 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.016  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.0159 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.1086 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.0794 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.0201 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.0161 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.016  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.1283 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.0965 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0211 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.0162 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.0161 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.1314 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.0941 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.0229 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.0162 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.016  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.1429 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.1064 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.0226 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.0163 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.0159 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.1745 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.1235 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.0249 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0171 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.0163 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.2287 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.1639 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.0278 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.019  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.0186 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.2346 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.166  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.0294 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.0194 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.0189 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.2694 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.189  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.0314 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0204 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.0198 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.3001 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.211  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.0339 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.0234 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.0225 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.329  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.2321 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.0405 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.0245 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.0237 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.4181 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.2965 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.0427 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.0253 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.0246 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.4941 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.347  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.0462 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.0278 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.027  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.6432 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.4683 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.0558 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.0287 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.0248 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.6606 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.4626 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.0668 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.0297 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.0278 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.7163 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.5007 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.0663 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.0333 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.0307 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.8518 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.6276 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.0759 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.0363 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.0322 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.9779 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.7004 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.0909 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.0384 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.0377 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 1.0771 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.7608 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.0942 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.0406 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.0371 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 1.2765 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.87   +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.1173 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.0462 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.0437 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 1.1276 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.946  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.1688 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.0582 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.0603 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 1.2738 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.9937 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.2415 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.2263 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.2254 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 1.5587 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 1.1445 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.3037 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.2573 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.2562 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * 1.5364 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * 1.1544 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * 0.3243 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * 0.2781 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * 0.2765 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * 1.8074 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * 1.3285 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * 0.3866 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * 0.3402 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * 0.3384 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * 1.9578 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * 1.5399 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * 0.377  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * 0.3257 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * 0.3228 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * 2.2082 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * 1.8302 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * 0.3779 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * 0.2892 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * 0.2862 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * 2.4969 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * 1.8867 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * 0.4774 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * 0.389  +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * 0.3867 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * 2.9287 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * 2.1743 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * 0.5153 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * 0.4109 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * 0.4077 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * 3.0169 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * 2.3489 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * 0.6023 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * 0.628  +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * 0.626  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * 3.3617 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * 2.7174 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * 0.6888 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * 0.6169 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * 0.6109 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 0.7 && pt <= 1   ) * 3.9449 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 1   && pt <= 10  ) * 3.0753 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 10  && pt <= 50  ) * 1.1275 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 50  && pt <= 100 ) * 1.0837 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 100              ) * 1.0821 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 0.7 && pt <= 1   ) * 4.6888 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 1   && pt <= 10  ) * 3.4935 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 10  && pt <= 50  ) * 1.1115 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 50  && pt <= 100 ) * 1.0585 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 100              ) * 1.0569 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 0.7 && pt <= 1   ) * 5.2211 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 1   && pt <= 10  ) * 3.8874 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 10  && pt <= 50  ) * 1.6623 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 50  && pt <= 100 ) * 1.6196 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 100              ) * 1.6183 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 0.7 && pt <= 1   ) * 6.5991 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 1   && pt <= 10  ) * 5.2858 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 10  && pt <= 50  ) * 3.535  +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 50  && pt <= 100 ) * 3.5775 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 100              ) * 3.578  +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 0.7 && pt <= 1   ) * 7.053  +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 1   && pt <= 10  ) * 5.5344 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 10  && pt <= 50  ) * 3.8573 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 50  && pt <= 100 ) * 3.8411 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 100              ) * 3.8406 +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 100              ) * -1.0
}

set PhiResolution {
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00199 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.00141 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0002  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.002   +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.00144 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.0002  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 6e-05   +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00202 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.00145 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0002  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 6e-05   +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00207 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.00147 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0002  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00209 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.00149 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.00021 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 6e-05   +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00216 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.00153 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.00021 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 6e-05   +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00224 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.00159 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.00024 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 6e-05   +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00227 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.0016  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.00022 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 6e-05   +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.00242 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0017  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.00023 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 6e-05   +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0025  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.00172 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.00023 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 8e-05   +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 7e-05   +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00262 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.00184 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.00025 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 8e-05   +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 7e-05   +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00272 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.00191 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.00026 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00294 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.00205 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.00027 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00309 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.00218 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.00029 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00326 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.00229 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.00031 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00339 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.00238 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.00032 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00358 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.00251 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.00033 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 7e-05   +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00369 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.00259 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.00034 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.00011 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.00394 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.00277 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.00035 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.00012 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0041  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.00288 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.00036 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.00012 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 9e-05   +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00433 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.00304 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.00037 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.00012 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 9e-05   +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00466 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.00327 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.00039 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.00012 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.0001  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00478 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.00337 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.00039 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.00012 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 9e-05   +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00484 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.00344 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.00041 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.00013 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.0001  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00508 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.00347 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.00043 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.00013 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.0001  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00512 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.00361 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.00048 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.00013 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00518 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.00368 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.00044 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.00014 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.00012 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00568 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.00403 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.00046 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.00012 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.00573 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.00408 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.00038 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.00016 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.00394 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.00275 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.0004  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.00019 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.0002  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00431 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.00306 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.00041 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.00021 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.0002  +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00453 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * 0.00325 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * 0.00061 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * 0.00051 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * 0.00051 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00414 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * 0.00295 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * 0.0005  +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * 0.00038 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * 0.00038 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00431 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * 0.00308 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * 0.00049 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * 0.00036 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * 0.00036 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00474 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * 0.00339 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * 0.00049 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * 0.00031 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * 0.00031 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00447 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * 0.00328 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * 0.00053 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * 0.00042 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * 0.00041 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00514 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * 0.00364 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * 0.00055 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * 0.0004  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * 0.0004  +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00556 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * 0.00401 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * 0.00066 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * 0.00055 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * 0.00055 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.00577 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * 0.00411 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * 0.00075 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * 0.00061 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * 0.00061 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.00592 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 1   && pt <= 10  ) * 0.00432 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 10  && pt <= 50  ) * 0.00138 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 50  && pt <= 100 ) * 0.00131 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 100              ) * 0.0013  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0065  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 1   && pt <= 10  ) * 0.00457 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 10  && pt <= 50  ) * 0.00142 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 50  && pt <= 100 ) * 0.00136 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 100              ) * 0.00136 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00896 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 1   && pt <= 10  ) * 0.00681 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 10  && pt <= 50  ) * 0.00415 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 50  && pt <= 100 ) * 0.00412 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 100              ) * 0.00412 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.37096 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 1   && pt <= 10  ) * 0.39227 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 10  && pt <= 50  ) * 0.39477 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 50  && pt <= 100 ) * 0.39485 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 100              ) * 0.39485 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.42018 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 1   && pt <= 10  ) * 0.41716 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 10  && pt <= 50  ) * 0.4143  +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 50  && pt <= 100 ) * 0.41428 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 100              ) * 0.41428 +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 100              ) * -1.0
}

set CtgThetaResolution {
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00205 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.00152 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.00025 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.00017 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.00016 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00212 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.00151 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.00025 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.00017 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.00016 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00219 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.00157 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.00025 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.00017 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.00017 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00227 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.0016  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.00026 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.00017 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.00017 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00234 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.00169 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.00027 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.00017 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.00017 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00253 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.00183 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.00029 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.00017 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.00016 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00278 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.00198 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0003  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.00017 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.00017 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00284 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.00211 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.00031 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.00017 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.00017 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.00332 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.00236 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.00034 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.00018 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.00017 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.00376 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.00265 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.00038 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.00018 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.00017 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00405 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.00291 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.00041 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.00018 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.00017 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00455 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.00323 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.00047 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.00018 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.00017 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00533 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.00375 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.0005  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.00019 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.00017 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00607 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.00428 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.00056 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0002  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.00018 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00685 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.00484 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.00063 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.00027 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.00025 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00814 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.00571 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.00072 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.00029 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.00026 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00947 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.00664 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.00079 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.00034 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.00033 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.01005 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.00705 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.00092 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.00046 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.00043 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.01308 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.00919 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.00104 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.00048 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.00044 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.01448 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.01027 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.0012  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.00049 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.00044 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.01622 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.01137 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.00131 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.00058 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.00054 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.01971 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.01368 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.00178 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.00062 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.00053 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.02294 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.0159  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.00185 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.00082 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.00074 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.02502 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.0181  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.00223 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.00094 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.00085 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.02888 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.0211  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.00256 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.00099 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.00091 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.03539 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.02552 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.00309 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.00127 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.00119 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.03668 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.02655 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.00302 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.00114 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.0011  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.04399 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.03126 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.00362 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.00138 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.00138 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0401  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.03327 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.00402 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.00184 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.00195 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.03646 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.02769 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.00416 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.0027  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.00266 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.04175 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.0295  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.00457 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.00342 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.00323 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.04815 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * 0.03372 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * 0.00563 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * 0.00386 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * 0.00378 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.05276 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * 0.03776 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * 0.00569 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * 0.00383 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * 0.00381 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.05918 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * 0.04079 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * 0.00664 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * 0.00369 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * 0.0035  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.06662 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * 0.04919 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * 0.00781 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * 0.00425 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * 0.00389 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.07782 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * 0.05482 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * 0.00757 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * 0.00428 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * 0.00407 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.09968 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * 0.0643  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * 0.00936 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * 0.00585 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * 0.00584 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.10522 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * 0.06971 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * 0.01003 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * 0.00615 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * 0.00617 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.10921 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * 0.083   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * 0.01281 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * 0.00871 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * 0.00855 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.13171 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 1   && pt <= 10  ) * 0.09796 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 10  && pt <= 50  ) * 0.01681 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 50  && pt <= 100 ) * 0.0143  +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 100              ) * 0.01422 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.1536  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 1   && pt <= 10  ) * 0.11023 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 10  && pt <= 50  ) * 0.02008 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 50  && pt <= 100 ) * 0.01687 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 100              ) * 0.01676 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.18111 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 1   && pt <= 10  ) * 0.13133 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 10  && pt <= 50  ) * 0.04063 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 50  && pt <= 100 ) * 0.03632 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 100              ) * 0.03622 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.19901 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 1   && pt <= 10  ) * 0.15931 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 10  && pt <= 50  ) * 0.05022 +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 50  && pt <= 100 ) * 0.0679  +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 100              ) * 0.06819 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.23625 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 1   && pt <= 10  ) * 0.17612 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 10  && pt <= 50  ) * 0.08287 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 50  && pt <= 100 ) * 0.08148 +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 100              ) * 0.08144 +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.4 && abs(eta) <= 4.5 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.5 && abs(eta) <= 4.6 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.6 && abs(eta) <= 4.7 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.7 && abs(eta) <= 4.8 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.8 && abs(eta) <= 4.9 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.9 && abs(eta) <= 5.0 ) * ( pt > 100              ) * -1.0
}

#######################################
# Order of execution of various modules
#######################################

set ExecutionPath {

  PileUpMerger
  ParticlePropagator
  StatusPid
  GenBeamSpotFilter

  ChargedHadronTrackingEfficiency
  ElectronTrackingEfficiency
  MuonTrackingEfficiency

  TrackMerger
  TrackSmearing

  VertexFinder
  VertexSorterGenClosest
  VertexSorterGenBest
  ElectronSeparator
  MuonSeparator
  Calorimeter
  TrackPileUpSubtractor
  TrackPileUpSubtractorGenClosest
  TrackPileUpSubtractorGenBest
  EFlowMerger
  EFlowMergerGenClosest
  EFlowMergerGenBest
  EFlowMergerNoCHS

  GlobalRho
  Rho
  RhoGenClosest
  RhoGenBest
  RhoNoCHS
  FastJetFinder
  FastJetFinderGenClosest
  FastJetFinderGenBest
  FastJetFinderNoCHS
  GenJetFinder
  JetPileUpSubtractor
  JetPileUpSubtractorGenClosest
  JetPileUpSubtractorGenBest
  JetPileUpSubtractorNoCHS

  NeutrinoFilter
  GenJetFinderNoNu
  GenMissingET

  EFlowChargedMerger
  RunPUPPI
  PuppiJetFinder
  PuppiRho
  PuppiJetPileUpSubtractor
  PuppiMissingET

  PhotonEfficiency
  PhotonIsolation

  ElectronEfficiency
  ElectronIsolation

  MuonEfficiency
  MuonIsolation

  MissingET

  BTagging
  BTaggingLoose
  TauTagging

  TrackPVSubtractor
  IsoTrackFilter

  UniqueObjectFinderGJ
  UniqueObjectFinderEJ
  UniqueObjectFinderMJ

  ScalarHT

  PileUpJetID
  PileUpJetIDGenClosest
  PileUpJetIDGenBest
  PileUpJetIDNoCHS
  PuppiPileUpJetID

  PileUpJetIDMissingET

  VertexSorter
  SimpleSecondaryVertex

  ConstituentFilter
  TreeWriter
}

module Merger PileUpJetIDMissingET {
  add InputArray TrackPileUpSubtractor/eflowTracks
  add InputArray MuonSeparator/muons
  add InputArray PileUpJetID/eflowTowers
  set MomentumOutputArray momentum
}

module Merger EFlowChargedMerger {
  add InputArray TrackPileUpSubtractor/eflowTracks
  add InputArray MuonSeparator/muons
  set OutputArray eflowTracks
}

module RunPUPPI RunPUPPI {
#  set TrackInputArray EFlowChargedMerger/eflowTracks
  set TrackInputArray Calorimeter/eflowTracks
  set NeutralInputArray Calorimeter/eflowTowers

  set TrackerEta $TrackerAcceptance

  set OutputArray weightedparticles
}

module FastJetFinder PuppiJetFinder {
  set InputArray RunPUPPI/weightedparticles
  set OutputArray jets

  set JetAlgorithm 6
  set ParameterR 0.4

  set JetPTMin 0.

  # remove pileup again (using it for synchronization)
#  set KeepPileUp 0
}

module FastJetFinder PuppiRho {
  set InputArray RunPUPPI/weightedparticles

  set ComputeRho true
  set RhoOutputArray rho

  # area algorithm: 0 Do not compute area, 1 Active area explicit ghosts, 2 One ghost passive area, 3 Passive area, 4 Voronoi, 5 Active area
  set AreaAlgorithm 5

  # jet algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set JetAlgorithm 4
  set ParameterR 0.4
  set GhostEtaMax 5.0
  set RhoEtaMax 5.0

  add RhoEtaRange 0.0 2.5
  add RhoEtaRange 2.5 $TrackerAcceptance
  add RhoEtaRange $TrackerAcceptance 5.0

  set JetPTMin 0.0
}

module JetPileUpSubtractor PuppiJetPileUpSubtractor {
  set JetInputArray PuppiJetFinder/jets
  set RhoInputArray PuppiRho/rho

  set OutputArray jets

  set JetPTMin 10.0
}


###############
# PileUp Merger
###############

module Merger PileUpMerger {
  add InputArray Delphes/stableParticles
  add InputArray Delphes/puGoodTracks
  add InputArray Delphes/puNeutrals
  set OutputArray stableParticles
}

#################################
# Propagate particles in cylinder
#################################

module ParticlePropagator ParticlePropagator {
  set InputArray PileUpMerger/stableParticles

  set OutputArray stableParticles
  set ChargedHadronOutputArray chargedHadrons
  set ElectronOutputArray electrons
  set MuonOutputArray muons

  # radius of the magnetic field coverage, in m
  set Radius 1.29
  # half-length of the magnetic field coverage, in m
  set HalfLength 3.00

  # magnetic field
  set Bz 3.8
}

####################################
# StatusPidFilter
# This module removes all generated particles
# except electrons, muons, taus, and status==3
####################################

module StatusPidFilter StatusPid {
#    set InputArray Delphes/stableParticles
    set InputArray Delphes/allParticles
    set OutputArray filteredParticles

    set PTMin 1.0
}

#######################
# GenBeamSpotFilter
# Saves a particle intended to represent the beamspot
#######################

module GenBeamSpotFilter GenBeamSpotFilter {
    set InputArray Delphes/stableParticles
    set OutputArray beamSpotParticles

}

####################################
# Charged hadron tracking efficiency
####################################

module Efficiency ChargedHadronTrackingEfficiency {
  set InputArray ParticlePropagator/chargedHadrons
  set OutputArray chargedHadrons
  set ApplyToPileUp false

  # add EfficiencyFormula {efficiency formula as a function of eta and pt} - Phase II
  set EfficiencyFormula { (pt <= 0.2) * (0.00) + \
(abs(eta) <= 1.2) * (pt > 0.2 && pt <= 1.0) * (pt * 0.96) + \
(abs(eta) <= 1.2) * (pt > 1.0) * (0.97) + \
(abs(eta) > 1.2 && abs(eta) <= 2.5) * (pt > 0.2 && pt <= 1.0) * (pt*0.85) + \
(abs(eta) > 1.2 && abs(eta) <= 2.5) * (pt > 1.0) * (0.87) + \
(abs(eta) > 2.5 && abs(eta) <= 5.0) * (pt > 0.2 && pt <= 1.0) * (pt*0.8) + \
(abs(eta) > 2.5 && abs(eta) <= 5.0) * (pt > 1.0) * (0.82) + \
(abs(eta) > 5.0) * (0.00)}
}

##############################
# Electron tracking efficiency - ID - Phase-II
##############################

module Efficiency ElectronTrackingEfficiency {
  set InputArray ParticlePropagator/electrons
  set OutputArray electrons
  set ApplyToPileUp false

  # set EfficiencyFormula {efficiency formula as a function of eta and pt}
  # tracking efficiency formula for electrons

  set EfficiencyFormula { (pt <= 0.2) * (0.00) + \
(abs(eta) <= 1.2) * (pt > 0.2 && pt <= 1.0) * (pt * 0.96) + \
(abs(eta) <= 1.2) * (pt > 1.0) * (0.97) + \
(abs(eta) > 1.2 && abs(eta) <= 2.5) * (pt > 0.2 && pt <= 1.0) * (pt*0.85) + \
(abs(eta) > 1.2 && abs(eta) <= 2.5) * (pt > 1.0 && pt <= 10.0) * (0.82+pt*0.01) + \
(abs(eta) > 1.2 && abs(eta) <= 2.5) * (pt > 10.0) * (0.90) + \
(abs(eta) > 2.5 && abs(eta) <= 5.0) * (pt > 0.2 && pt <= 1.0) * (pt*0.8) + \
(abs(eta) > 2.5 && abs(eta) <= 5.0) * (pt > 1.0 && pt <= 10.0) * (0.8+pt*0.01) + \
(abs(eta) > 2.5 && abs(eta) <= 5.0) * (pt > 10.0) * (0.85) + \
(abs(eta) > 5.0) * (0.00)}
}

##########################
# Muon tracking efficiency
##########################

module Efficiency MuonTrackingEfficiency {
  set InputArray ParticlePropagator/muons
  set OutputArray muons
  set ApplyToPileUp false

  # set EfficiencyFormula {efficiency formula as a function of eta and pt}

  # tracking efficiency formula for muons

  set EfficiencyFormula { (pt <= 0.2) * (0.00) + \
(abs(eta) <= 1.2) * (pt > 0.2 && pt <= 1.0) * (pt * 0.998) + \
(abs(eta) <= 1.2) * (pt > 1.0) * (0.998) + \
(abs(eta) > 1.2 && abs(eta) <= 2.5) * (pt > 0.2 && pt <= 1.0) * (pt*0.99) + \
(abs(eta) > 1.2 && abs(eta) <= 2.5) * (pt > 1.0) * (0.99) + \
(abs(eta) > 2.5 && abs(eta) <= 5.0) * (pt > 0.2 && pt <= 1.0) * (pt*0.95) + \
(abs(eta) > 2.5 && abs(eta) <= 5.0) * (pt > 1.0) * (0.95) + \
(abs(eta) > 5.0) * (0.00)}
}

##############
# Track merger
##############

module Merger TrackMerger {
# add InputArray InputArray
  add InputArray ChargedHadronTrackingEfficiency/chargedHadrons
  add InputArray ElectronTrackingEfficiency/electrons
  add InputArray MuonTrackingEfficiency/muons
  set OutputArray tracks
}

########################################
# Primary vertex reconstruction
########################################

module TrackSmearing TrackSmearing {
  set InputArray TrackMerger/tracks
  set BeamSpotInputArray GenBeamSpotFilter/beamSpotParticles
  set OutputArray tracks
  set ApplyToPileUp false

  set D0ResolutionFormula $D0Resolution
  set DZResolutionFormula $ZResolution
  set PResolutionFormula $PResolution
  set CtgThetaResolutionFormula $CtgThetaResolution
  set PhiResolutionFormula $PhiResolution
}

module VertexFinder VertexFinder {
  set InputArray TrackSmearing/tracks
  set OutputArray tracks
  set ClusterOutputArray clusters

  set Verbose 0
  set Sigma 2.0
  set SeedMinPT 0.7
  set MinNDF 4
  set GrowSeeds 1
  set MinPT 0.7
}

module VertexSorter VertexSorterGenClosest {
  set InputArray VertexFinder/clusters
  set TrackInputArray VertexFinder/tracks
  set BeamSpotInputArray GenBeamSpotFilter/beamSpotParticles

  set OutputArray clusters

  set Method GenClosest
}

module VertexSorter VertexSorterGenBest {
  set InputArray VertexFinder/clusters
  set TrackInputArray VertexFinder/tracks

  set OutputArray clusters

  set Method GenBest
}

module Separator ElectronSeparator {
  set InputArray VertexFinder/tracks
  add OutputArray electrons
  add OutputArray tracks

  set PID 11
}

module Separator MuonSeparator {
  set InputArray VertexFinder/tracks
  add OutputArray muons
  add OutputArray tracks

  set PID 13
}

#############
# Calorimeter
#############

module Calorimeter Calorimeter {
  set ParticleInputArray ParticlePropagator/stableParticles
  set TrackInputArray MuonSeparator/tracks

  set TowerOutputArray towers
  set PhotonOutputArray photons

  set EFlowTrackOutputArray eflowTracks
  set EFlowTowerOutputArray eflowTowers

  set pi [expr {acos(-1)}]

  # lists of the edges of each tower in eta and phi
  # each list starts with the lower edge of the first tower
  # the list ends with the higher edged of the last tower

  # 5 degrees towers
  set PhiBins {}
  for {set i -70} {$i <= 70} {incr i} {
    add PhiBins [expr {$i * $pi/70.0}]
  }

  foreach eta {-1.566 -1.479 -1.392 -1.305 -1.218 -1.131 -1.044 -0.957 -0.87 -0.783 -0.696 -0.609 -0.522 -0.435 -0.348 -0.261 -0.174 -0.087 0 0.087 0.174 0.261 0.348 0.435 0.522 0.609 0.696 0.783 0.87 0.957 1.044 1.131 1.218 1.305 1.392 1.479 1.566} {
    add EtaPhiBins $eta $PhiBins
  }

  # HGC Geometry/Segmentation
  # R represents the radius of the endcap circle, ending at eta = 4
  # This geometry is actually very similar to CFC
  for {set i 150} {$i >= 0} {incr i -1} {
      set R [expr 154.333 - 0.95 * $i]
      set eta_raw -[expr -log(tan(atan($R / 317.0) / 2.0))]
      set eta [expr double(round(1000 * $eta_raw)) / 1000]
      set N [expr round(($pi * $R) / 0.95)]
      set PhiBins {}
      for {set j -$N} {$j <= $N} {incr j} {
	  set phi_raw [expr $j * $pi / $N]
	  set phi [expr double(round(1000 * $phi_raw)) / 1000]
	  add PhiBins $phi
      }
      add EtaPhiBins $eta $PhiBins
  }
  for {set i 0} {$i <= 150} {incr i} {
      set R [expr 154.333 - 0.95 * $i]
      set eta_raw [expr -log(tan(atan($R / 317.0) / 2.0))]
      set eta [expr double(round(1000 * $eta_raw)) / 1000]
      set N [expr round(($pi * $R) / 0.95)]
      set PhiBins {}
      for {set j -$N} {$j <= $N} {incr j} {
	  set phi_raw [expr $j * $pi / $N]
	  set phi [expr double(round(1000 * $phi_raw)) / 1000]
	  add PhiBins $phi
      }
      add EtaPhiBins $eta $PhiBins
  }

  # 10 degrees towers
  set PhiBins {}
  for {set i -11} {$i <= 11} {incr i} {
    add PhiBins [expr {$i * $pi/11.0}]
  }
  foreach eta {-4.35 -4.175 -4 4.175 4.35 4.525} {
    add EtaPhiBins $eta $PhiBins
  }

  # 20 degrees towers
  set PhiBins {}
  for {set i -9} {$i <= 9} {incr i} {
    add PhiBins [expr {$i * $pi/9.0}]
  }
  foreach eta {-5 -4.7 -4.525 4.7 5} {
    add EtaPhiBins $eta $PhiBins
  }

  # default energy fractions {abs(PDG code)} {Fecal Fhcal}
  add EnergyFraction {0} {0.0 1.0}
  # energy fractions for e, gamma and pi0
  add EnergyFraction {11} {1.0 0.0}
  add EnergyFraction {22} {1.0 0.0}
  add EnergyFraction {111} {1.0 0.0}
  # energy fractions for muon, neutrinos and neutralinos
  add EnergyFraction {12} {0.0 0.0}
  add EnergyFraction {13} {0.0 0.0}
  add EnergyFraction {14} {0.0 0.0}
  add EnergyFraction {16} {0.0 0.0}
  add EnergyFraction {1000022} {0.0 0.0}
  add EnergyFraction {1000023} {0.0 0.0}
  add EnergyFraction {1000025} {0.0 0.0}
  add EnergyFraction {1000035} {0.0 0.0}
  add EnergyFraction {1000045} {0.0 0.0}
  # energy fractions for K0short and Lambda
  add EnergyFraction {310} {0.3 0.7}
  add EnergyFraction {3122} {0.3 0.7}


  # set ECalResolutionFormula {resolution formula as a function of eta and energy}
  set ECalResolutionFormula {(abs(eta) <= 1.5)                   * sqrt(energy^2*0.005^2 + energy*0.027^2 + 0.15^2) + \
				 (abs(eta) > 1.5 && abs(eta) <= 4.0) * sqrt(energy^2*0.0056^2 + energy*0.209^2) + \
				 (abs(eta) > 4.0 && abs(eta) <= 5.0) * sqrt(energy^2*0.08^2 + energy*1.97^2)}

  # set HCalResolutionFormula {resolution formula as a function of eta and energy}
  set HCalResolutionFormula {(abs(eta) <= 1.5)                   * sqrt(energy^2*0.0302^2 + energy*0.5205^2 + 1.59^2) + \
				 (abs(eta) > 1.5 && abs(eta) <= 4.0) * sqrt(energy^2*0.02^2 + energy*0.35^2) + \
				 (abs(eta) > 4.0 && abs(eta) <= 4.9) * sqrt(energy^2*0.05^2 + energy*1.00^2)}
}

##########################
# Track pile-up subtractor
##########################

module TrackPileUpSubtractor TrackPileUpSubtractor {
# add InputArray InputArray OutputArray
  add InputArray Calorimeter/eflowTracks eflowTracks
  add InputArray ElectronSeparator/electrons electrons
  add InputArray MuonSeparator/muons muons

  set PVInputArray  VertexFinder/clusters

  # assume perfect pile-up subtraction for tracks with |z| > fZVertexResolution
  # Z vertex resolution in m
  set ZVertexResolution -0.0001
}

module TrackPileUpSubtractor TrackPileUpSubtractorGenClosest {
# add InputArray InputArray OutputArray
  add InputArray Calorimeter/eflowTracks eflowTracks
  add InputArray ElectronSeparator/electrons electrons
  add InputArray MuonSeparator/muons muons

  set PVInputArray  VertexSorterGenClosest/clusters

  # assume perfect pile-up subtraction for tracks with |z| > fZVertexResolution
  # Z vertex resolution in m
  set ZVertexResolution -0.0001
}

module TrackPileUpSubtractor TrackPileUpSubtractorGenBest {
# add InputArray InputArray OutputArray
  add InputArray Calorimeter/eflowTracks eflowTracks
  add InputArray ElectronSeparator/electrons electrons
  add InputArray MuonSeparator/muons muons

  set PVInputArray  VertexSorterGenBest/clusters

  # assume perfect pile-up subtraction for tracks with |z| > fZVertexResolution
  # Z vertex resolution in m
  set ZVertexResolution -0.0001
}

####################
# Energy flow merger
####################

module Merger EFlowMerger {
# add InputArray InputArray
  add InputArray TrackPileUpSubtractor/eflowTracks
  add InputArray Calorimeter/eflowTowers
  add InputArray MuonSeparator/muons
  set OutputArray eflow
}

module Merger EFlowMergerGenClosest {
# add InputArray InputArray
  add InputArray TrackPileUpSubtractorGenClosest/eflowTracks
  add InputArray Calorimeter/eflowTowers
  add InputArray MuonSeparator/muons
  set OutputArray eflow
}

module Merger EFlowMergerGenBest {
# add InputArray InputArray
  add InputArray TrackPileUpSubtractorGenBest/eflowTracks
  add InputArray Calorimeter/eflowTowers
  add InputArray MuonSeparator/muons
  set OutputArray eflow
}

module Merger EFlowMergerNoCHS {
# add InputArray InputArray
  add InputArray Calorimeter/eflowTracks
  add InputArray Calorimeter/eflowTowers
  add InputArray MuonSeparator/muons
  set OutputArray eflow
}

#############
# Rho pile-up
#############

module FastJetFinder Rho {
#  set InputArray Calorimeter/towers
  set InputArray EFlowMerger/eflow

  set ComputeRho true
  set RhoOutputArray rho

  # area algorithm: 0 Do not compute area, 1 Active area explicit ghosts, 2 One ghost passive area, 3 Passive area, 4 Voronoi, 5 Active area
  set AreaAlgorithm 5

  # jet algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set JetAlgorithm 4
  set ParameterR 0.4
  set GhostEtaMax 5.0
  set RhoEtaMax 5.0

  add RhoEtaRange 0.0 2.5
  add RhoEtaRange 2.5 $TrackerAcceptance
  add RhoEtaRange $TrackerAcceptance 5.0

  set JetPTMin 0.0
}

module FastJetFinder RhoGenClosest {
#  set InputArray Calorimeter/towers
  set InputArray EFlowMergerGenClosest/eflow

  set ComputeRho true
  set RhoOutputArray rho

  # area algorithm: 0 Do not compute area, 1 Active area explicit ghosts, 2 One ghost passive area, 3 Passive area, 4 Voronoi, 5 Active area
  set AreaAlgorithm 5

  # jet algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set JetAlgorithm 4
  set ParameterR 0.4
  set GhostEtaMax 5.0
  set RhoEtaMax 5.0

  add RhoEtaRange 0.0 2.5
  add RhoEtaRange 2.5 $TrackerAcceptance
  add RhoEtaRange $TrackerAcceptance 5.0

  set JetPTMin 0.0
}

module FastJetFinder RhoGenBest {
#  set InputArray Calorimeter/towers
  set InputArray EFlowMergerGenBest/eflow

  set ComputeRho true
  set RhoOutputArray rho

  # area algorithm: 0 Do not compute area, 1 Active area explicit ghosts, 2 One ghost passive area, 3 Passive area, 4 Voronoi, 5 Active area
  set AreaAlgorithm 5

  # jet algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set JetAlgorithm 4
  set ParameterR 0.4
  set GhostEtaMax 5.0
  set RhoEtaMax 5.0

  add RhoEtaRange 0.0 2.5
  add RhoEtaRange 2.5 $TrackerAcceptance
  add RhoEtaRange $TrackerAcceptance 5.0

  set JetPTMin 0.0
}

module FastJetFinder RhoNoCHS {
#  set InputArray Calorimeter/towers
  set InputArray EFlowMergerNoCHS/eflow

  set ComputeRho true
  set RhoOutputArray rho

  # area algorithm: 0 Do not compute area, 1 Active area explicit ghosts, 2 One ghost passive area, 3 Passive area, 4 Voronoi, 5 Active area
  set AreaAlgorithm 5

  # jet algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set JetAlgorithm 4
  set ParameterR 0.4
  set GhostEtaMax 5.0
  set RhoEtaMax 5.0

  add RhoEtaRange 0.0 2.5
  add RhoEtaRange 2.5 $TrackerAcceptance
  add RhoEtaRange $TrackerAcceptance 5.0

  set JetPTMin 0.0
}

module FastJetFinder GlobalRho {
#  set InputArray Calorimeter/towers
  set InputArray EFlowMerger/eflow

  set ComputeRho true
  set RhoOutputArray rho

  # area algorithm: 0 Do not compute area, 1 Active area explicit ghosts, 2 One ghost passive area, 3 Passive area, 4 Voronoi, 5 Active area
  set AreaAlgorithm 5

  # jet algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set JetAlgorithm 4
  set ParameterR 0.4
  set GhostEtaMax 5.0
  set RhoEtaMax 5.0

  add RhoEtaRange 0.0 5.0

  set JetPTMin 0.0
}


#####################
# MC truth jet finder
#####################

module FastJetFinder GenJetFinder {
  set InputArray Delphes/stableParticles

  set OutputArray jets

  # algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set JetAlgorithm 6
  set ParameterR 0.4

  set JetPTMin 5.0

}

module NeutrinoFilter NeutrinoFilter {
  set InputArray Delphes/stableParticles

  set OutputArray stableParticles
}

module FastJetFinder GenJetFinderNoNu {
  set InputArray NeutrinoFilter/stableParticles

  set OutputArray jets

  # algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set JetAlgorithm 6
  set ParameterR 0.4

  set JetPTMin 5.0

}


############
# Jet finder
############

module FastJetFinder FastJetFinder {
#  set InputArray Calorimeter/towers
  set InputArray EFlowMerger/eflow

  set OutputArray jets

  # area algorithm: 0 Do not compute area, 1 Active area explicit ghosts, 2 One ghost passive area, 3 Passive area, 4 Voronoi, 5 Active area
  set AreaAlgorithm 5

  # jet algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set JetAlgorithm 6
  set ParameterR 0.4

  set JetPTMin 5.0
}

module FastJetFinder FastJetFinderGenClosest {
#  set InputArray Calorimeter/towers
  set InputArray EFlowMergerGenClosest/eflow

  set OutputArray jets

  # area algorithm: 0 Do not compute area, 1 Active area explicit ghosts, 2 One ghost passive area, 3 Passive area, 4 Voronoi, 5 Active area
  set AreaAlgorithm 5

  # jet algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set JetAlgorithm 6
  set ParameterR 0.4

  set JetPTMin 5.0
}

module FastJetFinder FastJetFinderGenBest {
#  set InputArray Calorimeter/towers
  set InputArray EFlowMergerGenBest/eflow

  set OutputArray jets

  # area algorithm: 0 Do not compute area, 1 Active area explicit ghosts, 2 One ghost passive area, 3 Passive area, 4 Voronoi, 5 Active area
  set AreaAlgorithm 5

  # jet algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set JetAlgorithm 6
  set ParameterR 0.4

  set JetPTMin 5.0
}

module FastJetFinder FastJetFinderNoCHS {
#  set InputArray Calorimeter/towers
  set InputArray EFlowMergerNoCHS/eflow

  set OutputArray jets

  # area algorithm: 0 Do not compute area, 1 Active area explicit ghosts, 2 One ghost passive area, 3 Passive area, 4 Voronoi, 5 Active area
  set AreaAlgorithm 5

  # jet algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set JetAlgorithm 6
  set ParameterR 0.4

  set JetPTMin 5.0
}

############
# Cambridge-Aachen Jet finder
############

module FastJetFinder CAJetFinder {
#  set InputArray Calorimeter/towers
  set InputArray EFlowMerger/eflow
  set OutputArray jets
  # algorithm: 1 CDFJetClu, 2 MidPoint, 3 SIScone, 4 kt, 5 Cambridge/Aachen, 6 antikt
  set AreaAlgorithm 5
  set JetAlgorithm 5
  set ParameterR 0.8
  # 200 GeV needed for boosted W bosons, 300 GeV is safe for boosted tops
  set JetPTMin 200.0
}

####################
# Constituent filter
####################

module ConstituentFilter ConstituentFilter {

  set ConEMin 1.

# # add JetInputArray InputArray
   add JetInputArray GenJetFinderNoNu/jets

# SZ changed this but it seems sensible
#   add JetInputArray FastJetFinder/jets
#   add JetInputArray UniqueObjectFinderMJ/jets
  add JetInputArray JetPileUpSubtractor/jets

#   add JetInputArray CAJetFinder/jets


# # add ConstituentInputArray InputArray OutputArray
   add ConstituentInputArray Delphes/stableParticles stableParticles
   add ConstituentInputArray TrackPileUpSubtractor/eflowTracks eflowTracks
   add ConstituentInputArray Calorimeter/eflowTowers eflowTowers
   add ConstituentInputArray MuonSeparator/muons muons
  # }



###########################
# Jet Pile-Up Subtraction
###########################

module JetPileUpSubtractor JetPileUpSubtractor {
  set JetInputArray FastJetFinder/jets
  set RhoInputArray Rho/rho

  set OutputArray jets

  set JetPTMin 5.0
}

module JetPileUpSubtractor JetPileUpSubtractorGenClosest {
  set JetInputArray FastJetFinderGenClosest/jets
  set RhoInputArray RhoGenClosest/rho

  set OutputArray jets

  set JetPTMin 5.0
}

module JetPileUpSubtractor JetPileUpSubtractorGenBest {
  set JetInputArray FastJetFinderGenBest/jets
  set RhoInputArray RhoGenBest/rho

  set OutputArray jets

  set JetPTMin 5.0
}

module JetPileUpSubtractor JetPileUpSubtractorNoCHS {
  set JetInputArray FastJetFinderNoCHS/jets
  set RhoInputArray Rho/rho

  set OutputArray jets

  set JetPTMin 5.0
}

module JetPileUpSubtractor CAJetPileUpSubtractor {
  set JetInputArray CAJetFinder/jets
  set RhoInputArray Rho/rho
  set OutputArray jets
  set JetPTMin 20.0
}


###################
# Photon efficiency
###################

module Efficiency PhotonEfficiency {
  set InputArray Calorimeter/photons
  set OutputArray photons

  # set EfficiencyFormula {efficiency formula as a function of eta and pt}

  # efficiency formula for photons
  set EfficiencyFormula {                                      (pt <= 10.0) * (0.00) + \
                                           (abs(eta) <= 1.5) * (pt > 10.0)  * (0.9635) + \
                         (abs(eta) > 1.5 && abs(eta) <= 4.0) * (pt > 10.0)  * (0.9624) + \
                         (abs(eta) > 4.0)                                   * (0.00)}
}

##################
# Photon isolation
##################

module Isolation PhotonIsolation {
  set CandidateInputArray PhotonEfficiency/photons
  set IsolationInputArray EFlowMerger/eflow
  set RhoInputArray Rho/rho

  set OutputArray photons

  set DeltaRMax 0.3

  set PTMin 1.0

  set PTRatioMax 9999.
}

#####################
# Electron efficiency
#####################

module Efficiency ElectronEfficiency {
  set InputArray TrackPileUpSubtractor/electrons
  set OutputArray electrons

  # set EfficiencyFormula {efficiency formula as a function of eta and pt}

  # efficiency formula for electrons
    set EfficiencyFormula {                                      (pt <= 4.0)  * (0.00) + \
                         (abs(eta) <= 1.45 ) * (pt >  4.0 && pt <= 6.0)   * (0.50) + \
                         (abs(eta) <= 1.45 ) * (pt >  6.0 && pt <= 8.0)   * (0.70) + \
                         (abs(eta) <= 1.45 ) * (pt >  8.0 && pt <= 10.0)  * (0.85) + \
                         (abs(eta) <= 1.45 ) * (pt > 10.0 && pt <= 30.0)  * (0.94) + \
                         (abs(eta) <= 1.45 ) * (pt > 30.0 && pt <= 50.0)  * (0.97) + \
                         (abs(eta) <= 1.45 ) * (pt > 50.0 && pt <= 70.0)  * (0.98) + \
                         (abs(eta) <= 1.45 ) * (pt > 70.0 )  * (1.0) + \
                         (abs(eta) > 1.45  && abs(eta) <= 1.55) * (pt >  4.0 && pt <= 10.0)   * (0.35) + \
                         (abs(eta) > 1.45  && abs(eta) <= 1.55) * (pt > 10.0 && pt <= 30.0)   * (0.40) + \
                         (abs(eta) > 1.45  && abs(eta) <= 1.55) * (pt > 30.0 && pt <= 70.0)   * (0.45) + \
                         (abs(eta) > 1.45  && abs(eta) <= 1.55) * (pt > 70.0 )  * (0.55) + \
                         (abs(eta) >= 1.55 && abs(eta) <= 2.0 ) * (pt >  4.0 && pt <= 10.0)  * (0.75) + \
                         (abs(eta) >= 1.55 && abs(eta) <= 2.0 ) * (pt > 10.0 && pt <= 30.0)  * (0.85) + \
                         (abs(eta) >= 1.55 && abs(eta) <= 2.0 ) * (pt > 30.0 && pt <= 50.0)  * (0.95) + \
                         (abs(eta) >= 1.55 && abs(eta) <= 2.0 ) * (pt > 50.0 && pt <= 70.0)  * (0.95) + \
                         (abs(eta) >= 1.55 && abs(eta) <= 2.0 ) * (pt > 70.0 )  * (1.0) + \
                         (abs(eta) >= 2.0 && abs(eta) <= 4.0 ) * (pt >  4.0 && pt <= 10.0)  * (0.65) + \
                         (abs(eta) >= 2.0 && abs(eta) <= 4.0 ) * (pt > 10.0 && pt <= 30.0)  * (0.75) + \
                         (abs(eta) >= 2.0 && abs(eta) <= 4.0 ) * (pt > 30.0 && pt <= 50.0)  * (0.90) + \
                         (abs(eta) >= 2.0 && abs(eta) <= 4.0 ) * (pt > 50.0 && pt <= 70.0)  * (0.90) + \
                         (abs(eta) >= 2.0 && abs(eta) <= 4.0 ) * (pt > 70.0 )  * (0.90) + \
                          (abs(eta) > 4.0)                              * (0.00)}

}

####################
# Electron isolation
####################

module Isolation ElectronIsolation {
  set CandidateInputArray ElectronEfficiency/electrons
  set IsolationInputArray EFlowMerger/eflow
  set RhoInputArray Rho/rho

  set OutputArray electrons

  set DeltaRMax 0.3

  set PTMin 1.0

  set PTRatioMax 9999.
}

#################
# Muon efficiency
#################

module Efficiency MuonEfficiency {
  set InputArray TrackPileUpSubtractor/muons
  set OutputArray muons

  # set EfficiencyFormula {efficiency as a function of eta and pt}

  # efficiency formula for muons
    set EfficiencyFormula {                                    (pt <= 2.0)  * (0.00) + \
                         (abs(eta) <= 4.00) * (pt >  2.0 && pt <= 3.0)  * (0.51) + \
                         (abs(eta) <= 4.00) * (pt >  3.0 && pt <= 4.0)  * (0.85) + \
                         (abs(eta) <= 4.00) * (pt >  4.0 && pt <= 11.0) * (0.93) + \
                         (abs(eta) <= 4.00) * (pt >  11. && pt <= 50.)  * (0.96) + \
                         (abs(eta) <= 4.00) * (pt >  50. && pt <= 70.)  * (0.98) + \
                         (abs(eta) <= 4.00) * (pt > 70.0 )  * (1.00) + \
                         (abs(eta) > 4.00)  * (0.00)}
}

################
# Muon isolation
################

module Isolation MuonIsolation {
  set CandidateInputArray MuonEfficiency/muons
  set IsolationInputArray EFlowMerger/eflow
  set RhoInputArray Rho/rho

  set OutputArray muons

  set DeltaRMax 0.3

  set PTMin 1.0

  set PTRatioMax 9999.
}

###################
# Missing ET merger
###################

module Merger MissingET {
# add InputArray InputArray
  add InputArray EFlowMerger/eflow
  set MomentumOutputArray momentum
}

module Merger GenMissingET {
#  add InputArray Delphes/stableParticles
  add InputArray NeutrinoFilter/stableParticles
  set MomentumOutputArray momentum
}

module Merger PuppiMissingET {
  add InputArray RunPUPPI/weightedparticles
  set MomentumOutputArray momentum
}

##################
# Scalar HT merger
##################
module Merger ScalarHT {
# add InputArray InputArray
  add InputArray UniqueObjectFinderMJ/jets
  add InputArray UniqueObjectFinderEJ/electrons
  add InputArray UniqueObjectFinderGJ/photons
  add InputArray UniqueObjectFinderMJ/muons
#  add InputArray JetPileUpSubtractor/jets
#  add InputArray ElectronIsolation/electrons
#  add InputArray PhotonIsolation/photons
#  add InputArray MuonIsolation/muons
  set EnergyOutputArray energy
}


###########
# b-tagging
###########

module BTagging BTagging {
  set PartonInputArray Delphes/partons
#  set JetInputArray FastJetFinder/jets
  set JetInputArray JetPileUpSubtractor/jets

  set BitNumber 0
  set DeltaR 0.4
  set PartonPTMin 1.0
  set PartonEtaMax 4.0

  # add EfficiencyFormula {abs(PDG code)} {efficiency formula as a function of eta and pt}
  # PDG code = the highest PDG code of a quark or gluon inside DeltaR cone around jet axis
  # gluon's PDG code has the lowest priority

  # https://twiki.cern.ch/twiki/bin/view/CMSPublic/PhysicsResultsBTV
  # default efficiency formula (misidentification rate)
  add EfficiencyFormula {0} {0.001}

  # efficiency formula for c-jets (misidentification rate)
  add EfficiencyFormula {4} {                                      (pt <= 15.0) * (0.000) + \
                                                (abs(eta) <= 1.2) * (pt > 15.0) * (0.1873*tanh(pt*0.0183 - 0.2196)) + \
                              (abs(eta) > 1.2 && abs(eta) <= 4.0) * (pt > 15.0) * (0.1898*tanh(pt*0.00997 - 0.143)) + \
                              (abs(eta) > 4.0)                                  * (0.000)}

  # efficiency formula for b-jets
    add EfficiencyFormula {5} {                                      (pt <= 15.0) * (0.000) + \
                                                (abs(eta) <= 1.2) * (pt > 15.0) * (0.629858*tanh(pt*0.0166188 + 0.300119)) + \
                              (abs(eta) > 1.2 && abs(eta) <= 4.0) * (pt > 15.0) * (0.584522*tanh(pt*0.0144387 + 0.397034)) + \
									 (abs(eta) > 4.0)                                  * (0.000)}
}

module BTagging BTaggingLoose {
  set PartonInputArray Delphes/partons
#  set JetInputArray FastJetFinder/jets
  set JetInputArray JetPileUpSubtractor/jets

  set BitNumber 1
  set DeltaR 0.4
  set PartonPTMin 1.0
  set PartonEtaMax 4.0

  # add EfficiencyFormula {abs(PDG code)} {efficiency formula as a function of eta and pt}
  # PDG code = the highest PDG code of a quark or gluon inside DeltaR cone around jet axis
  # gluon's PDG code has the lowest priority

  # https://twiki.cern.ch/twiki/bin/view/CMSPublic/PhysicsResultsBTV
  # default efficiency formula (misidentification rate)
  add EfficiencyFormula {0} {0.02}

  # efficiency formula for c-jets (misidentification rate)
  add EfficiencyFormula {4} {                                      (pt <= 15.0) * (0.000) + \
                                                (abs(eta) <= 1.2) * (pt > 15.0) * (0.29*tanh(pt*0.0183 - 0.2196)) + \
                              (abs(eta) > 1.2 && abs(eta) <= 4.0) * (pt > 15.0) * (0.29*tanh(pt*0.00997 - 0.143)) + \
                              (abs(eta) > 4.0)                                  * (0.000)}

  # efficiency formula for b-jets

    add EfficiencyFormula {5} {                                      (pt <= 15.0) * (0.000) + \
                                                (abs(eta) <= 1.2) * (pt > 15.0) * (0.629858*tanh(pt*0.0166188 + 0.300119)) + \
                              (abs(eta) > 1.2 && abs(eta) <= 4.0) * (pt > 15.0) * (0.584522*tanh(pt*0.0144387 + 0.397034)) + \
									 (abs(eta) > 4.0)                                  * (0.000)}

}

##########################
# Track pile-up subtractor
##########################

module TrackPileUpSubtractor TrackPVSubtractor {
# add InputArray InputArray OutputArray
  add InputArray MuonSeparator/tracks chargedHadrons
  add InputArray ElectronSeparator/electrons electrons
  add InputArray MuonSeparator/muons muons

  set PVInputArray  VertexFinder/clusters

  # assume perfect pile-up subtraction for tracks with |z| > fZVertexResolution
  # Z vertex resolution in m
  set ZVertexResolution -0.0005
}


################
# Isolated Tracks
################
module IsoTrackFilter IsoTrackFilter {
  ## Isolation using all the tracks
  set ElectronInputArray TrackPVSubtractor/electrons
  set MuonInputArray TrackPVSubtractor/muons
  set HADInputArray TrackPVSubtractor/chargedHadrons

  set OutputArray IsoTrack

  ### Cone 0.3
  set DeltaRMax 0.3

  ## PTmin of isolation
  set PTMin 1

  set PTRatioMax 0.2

  set IsoTrackPTMin 5
}

module TauTagging TauTagging {
  set ParticleInputArray Delphes/allParticles
  set PartonInputArray Delphes/partons
#  set JetInputArray FastJetFinder/jets
  set JetInputArray JetPileUpSubtractor/jets

  set DeltaR 0.4

  set TauPTMin 1.0

  set TauEtaMax 4.0

  # add EfficiencyFormula {abs(PDG code)} {efficiency formula as a function of eta and pt}

  # default efficiency formula (misidentification rate)
  add EfficiencyFormula {0} {0.004}
  # efficiency formula for tau-jets
  add EfficiencyFormula {15} {0.65}
}

#####################################################
# Find uniquely identified photons/electrons/tau/jets
#####################################################

#module UniqueObjectFinder UniqueObjectFinder {
# earlier arrays take precedence over later ones
# add InputArray InputArray OutputArray
#  add InputArray PhotonIsolation/photons photons
#  add InputArray ElectronIsolation/electrons electrons
#  add InputArray JetPileUpSubtractor/jets jets
#}

module UniqueObjectFinder UniqueObjectFinderGJ {
   add InputArray PhotonIsolation/photons photons
   add InputArray JetPileUpSubtractor/jets jets
}

module UniqueObjectFinder UniqueObjectFinderEJ {
   add InputArray ElectronIsolation/electrons electrons
   add InputArray UniqueObjectFinderGJ/jets jets
}

module UniqueObjectFinder UniqueObjectFinderMJ {
   add InputArray MuonIsolation/muons muons
   add InputArray UniqueObjectFinderEJ/jets jets
}

###
#Pileup jet id
###

module PileUpJetID PileUpJetID {
  set JetInputArray JetPileUpSubtractor/jets
  set OutputArray jets
  set NeutralsInPassingJets eflowTowers

  # Using constituents does not make sense with Charged hadron subtraction
  # In 0 mode, dR cut used instead
  set UseConstituents 0

  set TrackInputArray Calorimeter/eflowTracks
  set NeutralInputArray Calorimeter/eflowTowers
  set ParameterR 0.4

  set JetPTMin 5.0

#  set MeanSqDeltaRMaxBarrel 0.13
#  set BetaMinBarrel 0.16
#  set MeanSqDeltaRMaxEndcap 0.07
#  set BetaMinEndcap 0.06
    set MeanSqDeltaRMaxBarrel 0.07
    set BetaMinBarrel 0.13
    set MeanSqDeltaRMaxEndcap 0.07
    set BetaMinEndcap 0.15
  set MeanSqDeltaRMaxForward 0.01

}

module PileUpJetID PileUpJetIDGenClosest {
  set JetInputArray JetPileUpSubtractorGenClosest/jets
  set OutputArray jets
  set NeutralsInPassingJets eflowTowers

  # Using constituents does not make sense with Charged hadron subtraction
  # In 0 mode, dR cut used instead
  set UseConstituents 0

  set TrackInputArray Calorimeter/eflowTracks
  set NeutralInputArray Calorimeter/eflowTowers
  set ParameterR 0.4

  set JetPTMin 5.0

#  set MeanSqDeltaRMaxBarrel 0.13
#  set BetaMinBarrel 0.16
#  set MeanSqDeltaRMaxEndcap 0.07
#  set BetaMinEndcap 0.06
    set MeanSqDeltaRMaxBarrel 0.07
    set BetaMinBarrel 0.13
    set MeanSqDeltaRMaxEndcap 0.07
    set BetaMinEndcap 0.15
  set MeanSqDeltaRMaxForward 0.01

}

module PileUpJetID PileUpJetIDGenBest {
  set JetInputArray JetPileUpSubtractorGenBest/jets
  set OutputArray jets
  set NeutralsInPassingJets eflowTowers

  # Using constituents does not make sense with Charged hadron subtraction
  # In 0 mode, dR cut used instead
  set UseConstituents 0

  set TrackInputArray Calorimeter/eflowTracks
  set NeutralInputArray Calorimeter/eflowTowers
  set ParameterR 0.4

  set JetPTMin 5.0

#  set MeanSqDeltaRMaxBarrel 0.13
#  set BetaMinBarrel 0.16
#  set MeanSqDeltaRMaxEndcap 0.07
#  set BetaMinEndcap 0.06
    set MeanSqDeltaRMaxBarrel 0.07
    set BetaMinBarrel 0.13
    set MeanSqDeltaRMaxEndcap 0.07
    set BetaMinEndcap 0.15
  set MeanSqDeltaRMaxForward 0.01

}

module PileUpJetID PileUpJetIDNoCHS {
  set JetInputArray JetPileUpSubtractorNoCHS/jets
  set OutputArray jets
  set NeutralsInPassingJets eflowTowers

  # Using constituents does not make sense with Charged hadron subtraction
  # In 0 mode, dR cut used instead
  set UseConstituents 0

  set TrackInputArray Calorimeter/eflowTracks
  set NeutralInputArray Calorimeter/eflowTowers
  set ParameterR 0.4

  set JetPTMin 5.0

#  set MeanSqDeltaRMaxBarrel 0.13
#  set BetaMinBarrel 0.16
#  set MeanSqDeltaRMaxEndcap 0.07
#  set BetaMinEndcap 0.06
    set MeanSqDeltaRMaxBarrel 0.07
    set BetaMinBarrel 0.13
    set MeanSqDeltaRMaxEndcap 0.07
    set BetaMinEndcap 0.15
  set MeanSqDeltaRMaxForward 0.01

}

module PileUpJetID PuppiPileUpJetID {
  set JetInputArray PuppiJetPileUpSubtractor/jets
  set OutputArray jets
  set NeutralsInPassingJets eflowTowers

  # Using constituents does not make sense with Charged hadron subtraction
  # In 0 mode, dR cut used instead
  set UseConstituents 0

  set TrackInputArray Calorimeter/eflowTracks
  set NeutralInputArray Calorimeter/eflowTowers
  set ParameterR 0.4

  set JetPTMin 5.0

#  set MeanSqDeltaRMaxBarrel 0.13
#  set BetaMinBarrel 0.16
#  set MeanSqDeltaRMaxEndcap 0.07
#  set BetaMinEndcap 0.06
    set MeanSqDeltaRMaxBarrel 0.07
    set BetaMinBarrel 0.13
    set MeanSqDeltaRMaxEndcap 0.07
    set BetaMinEndcap 0.15
  set MeanSqDeltaRMaxForward 0.01

}

module VertexSorter VertexSorter {
  set InputArray VertexFinder/clusters
  set TrackInputArray VertexFinder/tracks
  set JetInputArray JetPileUpSubtractor/jets

  set OutputArray clusters

  set Method BTV
}

module SimpleSecondaryVertex SimpleSecondaryVertex {
  set InputArray JetPileUpSubtractor/jets
  set TrackInputArray VertexFinder/tracks
  set ClusterInputArray VertexSorter/clusters
  set BeamSpotInputArray GenBeamSpotFilter/beamSpotParticles

  set OutputArray jets

  set ParameterR 0.3
  set MinTracks 2
}

##################
# ROOT tree writer
##################

module TreeWriter TreeWriter {
  add Branch StatusPid/filteredParticles Particle GenParticle
  add Branch GenBeamSpotFilter/beamSpotParticles BeamSpotParticle GenParticle
  add Branch Delphes/vbfQuarks VBFquarks GenParticle

  add Branch MuonSeparator/tracks Track Track

  add Branch FastJetFinder/jets RawJet Jet

  add Branch GenJetFinder/jets GenJetWithNu Jet
  add Branch GenJetFinderNoNu/jets GenJet Jet
#  add Branch UniqueObjectFinderMJ/jets Jet Jet
#  add Branch UniqueObjectFinderEJ/electrons Electron Electron
#  add Branch UniqueObjectFinderGJ/photons Photon Photon
#  add Branch UniqueObjectFinderMJ/muons Muon Muon
  add Branch JetPileUpSubtractor/jets Jet Jet
  add Branch JetPileUpSubtractorGenClosest/jets JetGenClosest Jet
  add Branch JetPileUpSubtractorGenBest/jets JetGenBest Jet
  add Branch JetPileUpSubtractorNoCHS/jets JetNoCHS Jet
  add Branch ElectronIsolation/electrons Electron Electron
  add Branch PhotonIsolation/photons Photon Photon
  add Branch MuonIsolation/muons Muon Muon

  add Branch PileUpJetIDMissingET/momentum PileUpJetIDMissingET MissingET
  add Branch GenMissingET/momentum GenMissingET MissingET
  add Branch PuppiMissingET/momentum PuppiMissingET MissingET


  add Branch MissingET/momentum MissingET MissingET
  add Branch ScalarHT/energy ScalarHT ScalarHT
  add Branch Rho/rho Rho Rho
  add Branch PuppiRho/rho PuppiRho Rho
  add Branch GlobalRho/rho GlobalRho Rho
  add Branch Delphes/NPU NPU ScalarHT
  add Branch IsoTrackFilter/IsoTrack IsoTrack IsoTrack

  add Branch PuppiJetPileUpSubtractor/jets PuppiJet Jet

  add Branch VertexSorter/clusters UnsortedCluster Cluster
  add Branch VertexSorter/clusters Cluster Cluster

  add Branch Delphes/eventInfo Event Event

  set OffsetFromModifyBeamSpot 0

#  add Branch RunPUPPI/weightedparticles PuppiWeightedParticles GenParticle
#  add Branch Delphes/allParticles Particle GenParticle
#  add Branch Calorimeter/eflowTracks EFlowTrack Track
#  add Branch Calorimeter/eflowTowers EFlowTower Tower
#  add Branch MuonMomentumSmearing/muons EFlowMuon Muon
#  add Branch PuppiJetPileUpSubtractor/jets SubtractedPuppiJet Jet
#  add Branch PuppiRho/rho PuppiRho Rho
}

# # add Branch InputArray BranchName BranchClass
#  # add Branch Delphes/allParticles Particle GenParticle
  # add Branch StatusPid/filteredParticles Particle GenParticle
#  # add Branch TrackMerger/tracks Track Track
#  # add Branch Calorimeter/towers Tower Tower
#  # add Branch ConstituentFilter/eflowTracks EFlowTrack Track
#  # add Branch ConstituentFilter/eflowTowers EFlowTower Tower
#  # add Branch ConstituentFilter/muons EFlowMuon Muon
  # add Branch GenJetFinder/jets GenJet Jet
  # add Branch CAJetPileUpSubtractor/jets CAJet Jet
  # add Branch UniqueObjectFinderMJ/jets Jet Jet
  # add Branch UniqueObjectFinderEJ/electrons Electron Electron
  # add Branch UniqueObjectFinderGJ/photons Photon Photon
  # add Branch UniqueObjectFinderMJ/muons Muon Muon
  # add Branch MissingET/momentum MissingET MissingET
  # add Branch ScalarHT/energy ScalarHT ScalarHT
  # add Branch Rho/rho Rho ScalarHT



