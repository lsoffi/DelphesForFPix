set SkipEvents 0
set MaxEvents 15000
set TrackerAcceptance 3.9
set ErrorFile errors.root

set PTResolution {
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0041 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.004  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0045 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.0065 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.0097 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.004  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.0041 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.0045 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.0066 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.0099 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0041 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.0041 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0046 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.0067 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.0102 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0051 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.0047 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0054 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.0069 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.0101 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0044 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.0043 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.0048 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.0069 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.01   +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0044 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.0046 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.0054 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.0068 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.0101 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0048 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.0048 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0054 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.0075 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.0105 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.005  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.0049 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.0053 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.0071 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.0104 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0052 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0052 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.0056 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.0077 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.0105 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0058 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.0067 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.0081 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.0098 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.0109 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.007  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.0072 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0075 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.0114 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.0147 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0108 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.0103 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.0118 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.0148 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.0193 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.011  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.0109 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.0125 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.016  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.0195 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0139 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.0139 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.0147 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0185 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.0218 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0156 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.0154 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.0163 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0196 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.0218 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0152 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.0149 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.0156 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.0183 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.02   +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0154 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.0156 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.015  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0173 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.0186 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0166 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.0161 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.0166 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.0199 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.0227 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0143 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.0172 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.0185 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.0229 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.0273 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0134 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.0141 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.0166 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.0246 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.0301 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0138 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.0141 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.0154 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.0256 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.0334 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0139 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.0139 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.0183 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.029  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.0371 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0152 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.0151 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.017  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.0272 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.0373 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0141 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.0133 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.0177 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.0289 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.0407 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0165 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.0151 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.0202 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.0333 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.046  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0195 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.0195 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.0244 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.0361 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.0488 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0173 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.0172 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.0248 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.0412 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.0602 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0235 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.0245 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.0304 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.0482 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.0719 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0243 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.0248 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.0307 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.0547 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.09   +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0253 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.0229 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.037  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.0801 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.1427 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0278 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.0441 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.0391 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.2159 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.1715 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0318 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * 0.0375 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * 0.1098 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * 0.552  +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * 1.0025 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0276 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * 0.0241 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * 0.0431 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * 0.1718 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * 0.3385 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.023  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * 0.0329 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * 0.0533 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * 0.225  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * 0.4493 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0226 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * 0.0203 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * 0.0567 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * 0.2511 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * 0.4989 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0199 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * 0.021  +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * 0.0472 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * 0.2221 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * 0.3848 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.029  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * 0.027  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * 0.0724 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * 0.3481 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * 0.6497 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0284 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * 0.0298 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * 0.1122 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * 0.4586 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * 0.9954 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0326 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * 0.0348 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * 0.1222 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * 0.5318 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * 1.5173 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 100              ) * -1.0   +\
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

set PResolution {
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0042 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.0041 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0045 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.0066 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.0101 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0044 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.0043 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.0046 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.0067 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.0099 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0047 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.0044 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0047 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.007  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.0102 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0057 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.0056 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0054 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.007  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.0099 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0052 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.005  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.0049 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.0069 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.0101 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0056 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.0054 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.0051 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.007  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.0098 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0061 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.0058 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0055 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.0075 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.0105 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0063 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.0059 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.0055 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.0074 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.0104 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0066 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0062 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.0059 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.0076 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.0107 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0092 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.0087 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.0083 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.0105 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.0142 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0092 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.0083 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0079 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.0106 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.0147 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0124 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.012  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.0116 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.0133 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.018  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0137 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.0134 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.0128 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.0163 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.019  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0149 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.014  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.0148 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0185 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.0202 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0181 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.0177 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.0165 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0176 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.022  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0179 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.0172 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.016  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.0185 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.0211 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0185 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.0183 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.0154 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0191 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.0196 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0185 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.0184 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.0175 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.0201 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.0242 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.019  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.0203 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.0158 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.022  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.0255 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0172 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.0166 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.0167 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.0245 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.0309 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0196 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.0174 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.0171 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.0251 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.0322 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0164 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.0155 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.018  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.0292 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.0374 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0178 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.0166 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.0166 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.0262 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.0364 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0182 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.0171 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.0178 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.03   +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.0412 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0208 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.0195 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.0213 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.0314 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.0466 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0235 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.0223 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.0246 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.0348 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.0522 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0238 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.0212 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.0269 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.0422 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.0608 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.027  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.026  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.0308 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.046  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.0691 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0244 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.0232 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.0363 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.0552 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.0949 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0283 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.0275 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.0373 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.0794 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.1416 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0308 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.0303 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.0395 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.1046 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.2295 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0376 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * 0.0379 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * 0.1215 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * 0.5848 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * 1.1677 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0282 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * 0.0276 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * 0.0465 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * 0.2455 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * 0.4931 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0315 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * 0.0312 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * 0.0557 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * 0.2329 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * 0.4613 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0226 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * 0.0219 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * 0.0586 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * 0.2737 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * 0.5471 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0261 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * 0.0252 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * 0.0473 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * 0.2088 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * 0.4157 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0304 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * 0.0303 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * 0.0731 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * 0.3492 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * 0.6978 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0349 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * 0.0346 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * 0.0875 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * 0.4825 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * 0.9671 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0384 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * 0.0394 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * 0.1874 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * 0.9318 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * 1.8631 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 100              ) * -1.0   +\
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

set D0Resolution {
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0508 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.0355 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0086 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.006  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.0049 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0515 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.0354 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.0088 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.0059 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.0057 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0614 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.0439 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0086 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.0059 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.0053 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0621 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.0444 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0086 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.0064 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.0059 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0532 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.0433 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.0094 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.0062 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.0049 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0651 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.046  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.0089 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.0053 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.005  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0628 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.0481 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0095 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.0054 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.0051 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0666 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.0471 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.0095 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.0062 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.005  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.07   +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0477 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.0096 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.0055 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.0059 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0627 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.0548 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.0099 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.0056 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.006  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0738 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.0564 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0101 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.0057 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.0061 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.078  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.0568 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.0103 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.0071 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.0067 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0682 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.0581 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.0107 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.0065 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.0068 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0736 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.0631 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.0109 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0071 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.0065 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0942 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.0642 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.0113 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0065 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.0065 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0797 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.0567 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.0115 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.0074 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.0063 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0836 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.0589 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.0117 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0071 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.0064 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0952 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.0769 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.012  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.0064 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.0063 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0984 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.0828 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.0124 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.0073 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.0058 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0994 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.0693 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.0124 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.0071 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.0068 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.1249 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.0849 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.0128 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.0066 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.0062 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.1336 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.0943 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.0132 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.0078 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.0066 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.1224 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.078  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.0133 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.0069 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.0063 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.1134 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.0989 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.015  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.007  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.0064 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.147  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.1033 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.0168 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.0072 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.0066 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.1219 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.0848 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.0142 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.0069 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.0062 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.1308 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.0918 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.015  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.0066 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.0066 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.1321 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.1001 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.0143 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.0076 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.0072 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.1382 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.1002 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.015  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.0086 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.0082 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.1449 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.1013 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.0189 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.0111 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.0092 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.1124 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.09   +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.0188 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.0312 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.0312 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.1682 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * 0.1216 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * 0.0435 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * 0.0421 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * 0.0416 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.1385 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * 0.0981 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * 0.0211 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * 0.0167 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * 0.0407 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.1377 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * 0.092  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * 0.0292 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * 0.0209 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * 0.0272 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.148  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * 0.1093 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * 0.029  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * 0.0254 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * 0.0283 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.1221 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * 0.0875 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * 0.0226 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * 0.0184 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * 0.024  +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.1707 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * 0.1211 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * 0.0333 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * 0.0307 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * 0.0296 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.1522 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * 0.1111 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * 0.0374 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * 0.0357 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * 0.0407 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.1512 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * 0.1099 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * 0.0418 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * 0.0358 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * 0.0388 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 100              ) * -1.0   +\
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
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0549 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.0416 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0141 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.0123 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.0122 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0547 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.0447 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.0164 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.0152 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.0152 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0643 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.05   +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0145 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.0129 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.0127 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0584 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.0444 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0145 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.0139 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.0147 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0623 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.0536 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.0162 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.0126 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.0158 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0766 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.0575 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.0147 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.0125 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.0125 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.07   +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.0523 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0173 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.0125 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.0141 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0886 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.0567 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.0158 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.0133 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.0123 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.1001 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0725 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.0173 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.0156 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.0156 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.102  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.0753 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.0198 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.0116 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.0157 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.1081 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.0888 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0196 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.0115 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.0152 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.126  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.0967 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.0199 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.015  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.0127 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.1429 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.0994 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.0197 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.019  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.018  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.1477 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.1174 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.0236 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0192 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.0153 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.1709 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.1409 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.0245 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0156 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.0159 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.1957 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.1342 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.027  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.0183 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.0215 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.2125 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.1598 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.0289 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0177 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.0191 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.2631 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.1985 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.0309 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.0204 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.0176 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.3769 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.2659 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.0388 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.0201 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.0206 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.3651 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.2416 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.036  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.021  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.0202 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.473  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.2657 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.0372 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.0233 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.0234 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.578  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.3844 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.0531 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.0262 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.0271 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.6534 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.4039 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.0498 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.0299 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.0245 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.6041 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.5028 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.0599 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.028  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.0264 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.7834 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.5544 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.0814 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.0316 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.0307 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.7817 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.5359 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.076  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.0319 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.0328 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.9295 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.6365 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.0903 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.0374 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.0351 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 1.0368 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.7199 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.0837 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.0398 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.0357 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 1.2848 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.848  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.1043 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.2274 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.0431 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 1.3118 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.9876 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.23   +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.048  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.0942 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 1.3245 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 1.0212 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.3169 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.3341 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.2942 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * 1.7052 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * 1.2865 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * 0.4541 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * 0.4398 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * 0.4558 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * 1.8136 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * 1.3429 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * 0.3644 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * 0.3256 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * 0.3221 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * 2.041  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * 1.5742 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * 0.4538 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * 0.3948 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * 0.424  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * 2.354  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * 1.7594 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * 0.4652 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * 0.4364 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * 0.4212 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * 2.4247 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * 1.8542 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * 0.4948 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * 0.4149 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * 0.4573 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * 2.9484 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * 2.2659 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * 0.6654 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * 0.6553 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * 0.6252 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * 3.2375 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * 2.3658 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * 0.6755 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * 0.6667 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * 0.632  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * 3.4247 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * 2.535  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * 0.9984 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * 0.9633 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * 0.975  +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 0.7 && pt <= 1   ) * 3.911  +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 1   && pt <= 10  ) * 2.8846 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 10  && pt <= 50  ) * 1.2414 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 50  && pt <= 100 ) * 1.1964 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 100              ) * 1.2144 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 0.7 && pt <= 1   ) * 4.418  +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 1   && pt <= 10  ) * 3.0322 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 10  && pt <= 50  ) * 1.4347 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 50  && pt <= 100 ) * 1.2506 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 100              ) * 1.17   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 100              ) * -1.0   +\
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
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00188 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.00132 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0002  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00187 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.00132 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.00019 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00194 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.00136 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0002  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00194 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.00138 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0002  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00209 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.00141 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.0002  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0021  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.00157 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.00022 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00219 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.00144 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.00022 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00216 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.00157 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.00023 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 6e-05   +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.00229 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.00162 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.00023 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.00234 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.00188 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.00023 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 6e-05   +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00316 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.00172 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.00025 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 8e-05   +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 6e-05   +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00273 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.00187 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.00027 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 9e-05   +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 7e-05   +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00275 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.00201 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.00028 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00291 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.00212 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.0003  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.00011 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00308 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.00226 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.00031 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 7e-05   +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00318 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.00228 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.0003  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00338 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.00232 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.00033 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 7e-05   +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00346 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.00257 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.00035 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.00011 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 7e-05   +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.00369 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.00264 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.00036 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.00011 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0039  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.00268 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.00035 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.00011 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 9e-05   +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00404 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.0028  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.00039 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.00012 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00435 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.00309 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.00035 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.00012 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 9e-05   +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00433 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.00312 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.00036 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.00012 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 9e-05   +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00439 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.00318 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.0004  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.00013 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.0001  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00473 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.00338 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.00045 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.00014 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.0001  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00479 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.00331 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.00043 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.00014 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.00011 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00509 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.00357 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.0005  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.00012 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00515 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.00368 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.00045 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.00013 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.00512 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.00391 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.00046 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.00018 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.00015 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.00409 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.0029  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.00048 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.0002  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.00021 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00417 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.00288 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.00046 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.00054 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.00062 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00475 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * 0.00356 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * 0.00119 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * 0.00102 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * 0.00109 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00463 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * 0.00308 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * 0.00053 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * 0.00047 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * 0.00039 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0043  +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * 0.00338 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * 0.00059 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * 0.00055 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * 0.00051 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0045  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * 0.00299 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * 0.0007  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * 0.00065 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * 0.00056 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00423 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * 0.00321 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * 0.00062 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * 0.00057 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * 0.00048 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00517 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * 0.00355 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * 0.00082 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * 0.00067 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * 0.00071 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00508 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * 0.00366 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * 0.00103 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * 0.00105 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * 0.0009  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.00526 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * 0.00377 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * 0.00106 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * 0.00105 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * 0.00099 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
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

set CtgThetaResolution {
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0019  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.00138 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.00024 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.00015 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00194 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.0014  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.00024 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.00014 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00207 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.00151 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.00024 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.00014 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00217 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.00155 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.00025 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.00015 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00223 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.00161 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.00025 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.00014 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00269 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.00205 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.00028 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.00014 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.00013 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00302 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.00183 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0003  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00281 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.00209 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.0003  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.00016 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.00013 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.00316 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.00255 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.00036 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.00016 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.00015 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.00348 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.00243 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.00034 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.00016 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00398 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.00286 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0004  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.00016 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.00015 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00456 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.00314 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.00042 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.00017 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.00015 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00523 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.00374 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.00051 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.00025 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.00024 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00578 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.0041  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.00051 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.00025 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.00024 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00679 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.00474 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.00063 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.00025 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.00024 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00741 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.00521 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.00077 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.00038 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.00039 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00826 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.00613 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.0007  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.00036 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.00033 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.01005 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.0069  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.00092 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.00037 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.00034 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.01078 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.0083  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.00102 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.00039 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.00035 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.01227 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.00875 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.00112 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.00042 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.00036 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.01365 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.01044 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.00123 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.00063 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.00055 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.01849 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.01349 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.00165 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.00068 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.00063 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.01971 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.01412 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.00208 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.0008  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.00069 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.02371 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.01671 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.00207 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.00083 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.00073 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.02687 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.02119 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.00261 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.00097 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.00089 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.02781 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.02033 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.00253 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.00101 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.00092 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.03538 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.02519 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.00292 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.0012  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.00103 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.04017 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.02765 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.00319 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.00128 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.00119 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.04461 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.02901 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.00364 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.00231 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.00234 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.03425 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.02423 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.00397 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.00242 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.00231 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.03679 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.02698 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.00498 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.00384 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.0038  +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.04338 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * 0.02937 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * 0.00618 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * 0.00568 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * 0.00566 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.04768 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * 0.03578 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * 0.00517 +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * 0.0038  +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * 0.00374 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.05306 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * 0.04105 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * 0.00624 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * 0.00463 +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * 0.00458 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0588  +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * 0.04469 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * 0.00629 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * 0.00486 +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * 0.00486 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.06971 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * 0.04968 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * 0.0068  +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * 0.00446 +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * 0.00437 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.08156 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * 0.05842 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * 0.00838 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * 0.00645 +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * 0.00638 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.09511 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * 0.06701 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * 0.01032 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * 0.00788 +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * 0.0078  +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.10915 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * 0.07574 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * 0.01388 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * 0.01189 +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * 0.01183 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.12081 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 1   && pt <= 10  ) * 0.08638 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 10  && pt <= 50  ) * 0.01729 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 50  && pt <= 100 ) * 0.01516 +\
    ( abs(eta) > 3.9 && abs(eta) <= 4.0 ) * ( pt > 100              ) * 0.01509 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.13352 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 1   && pt <= 10  ) * 0.09677 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 10  && pt <= 50  ) * 0.01793 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 50  && pt <= 100 ) * 0.01531 +\
    ( abs(eta) > 4.0 && abs(eta) <= 4.1 ) * ( pt > 100              ) * 0.01522 +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.1 && abs(eta) <= 4.2 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 4.2 && abs(eta) <= 4.3 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 4.3 && abs(eta) <= 4.4 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
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
  VertexFinderTRK
  VertexSorterGenClosest
  VertexSorterGenBest
  ElectronSeparator
  MuonSeparator
  Calorimeter
  TrackPileUpSubtractor
  TrackPileUpSubtractorTRK
  TrackPileUpSubtractorGenClosest
  TrackPileUpSubtractorGenBest
  EFlowMerger
  EFlowMergerTRK
  EFlowMergerGenClosest
  EFlowMergerGenBest
  EFlowMergerNoCHS

  GlobalRho
  Rho
  RhoTRK
  RhoGenClosest
  RhoGenBest
  RhoNoCHS
  FastJetFinder
  FastJetFinderTRK
  FastJetFinderGenClosest
  FastJetFinderGenBest
  FastJetFinderNoCHS
  GenJetFinder
  JetPileUpSubtractor
  JetPileUpSubtractorTRK
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
  PileUpJetIDTRK
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

module VertexFinder VertexFinderTRK {
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

module TrackPileUpSubtractor TrackPileUpSubtractorTRK {
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

module Merger EFlowMergerTRK {
# add InputArray InputArray
  add InputArray TrackPileUpSubtractorTRK/eflowTracks
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

module FastJetFinder RhoTRK {
#  set InputArray Calorimeter/towers
  set InputArray EFlowMergerTRK/eflow

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

module FastJetFinder FastJetFinderTRK {
#  set InputArray Calorimeter/towers
  set InputArray TrackPileUpSubtractorTRK/eflowTracks

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

module JetPileUpSubtractor JetPileUpSubtractorTRK {
  set JetInputArray FastJetFinderTRK/jets
  set RhoInputArray RhoTRK/rho

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
module PileUpJetID PileUpJetIDTRK {
  set JetInputArray JetPileUpSubtractorTRK/jets
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
    add Branch JetPileUpSubtractorTRK/jets JetTRK Jet
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



