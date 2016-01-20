set SkipEvents 0
set MaxEvents 10
set TrackerAcceptance 3.1
set ErrorFile errors.root

set PTResolution {
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.004   +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.004   +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0045  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.0065  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.0097  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0041  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.0041  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.0045  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.0066  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.0099  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0041  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.0042  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0047  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.0067  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.0099  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0049  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.0047  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0053  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.007   +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.0101  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0044  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.0044  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.0049  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.0068  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.01    +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0045  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.0046  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.0051  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.007   +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.0098  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0048  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.0049  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0054  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.0075  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.0105  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0049  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.005   +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.0054  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.0074  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.0103  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0052  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0052  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.0056  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.0076  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.0105  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0065  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.0064  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.0072  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.0097  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.014   +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0072  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.0072  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0078  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.0106  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.0146  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0101  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.0102  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.0114  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.0152  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.0197  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0115  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.0115  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.0124  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.0161  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.0186  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0141  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.0141  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.0151  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0177  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.0209  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0155  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.015   +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.0161  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0184  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.0219  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0148  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.0147  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.0157  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.018   +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.022   +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0155  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.015   +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.0151  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0176  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.0197  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.016   +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.0153  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.0171  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.0201  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.0226  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0148  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.0177  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.0182  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.0224  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.0264  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0106  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.0104  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.0141  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.0216  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.0279  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0107  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.0111  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.0143  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.0213  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.0317  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0101  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.0113  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.0147  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.0258  +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.0366  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.012   +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.0121  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.014   +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.0243  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.0346  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0096  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.0099  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.0122  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.0255  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.043   +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0099  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.01    +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.0122  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.0285  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.0529  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0098  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.01    +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.0131  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.0356  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.0707  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.01    +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.0101  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.0144  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.0492  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.1029  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0104  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.0094  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.0177  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.0708  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.1454  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0104  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.0105  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.0208  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.1203  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.1815  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.01    +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.0102  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.0255  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.118   +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.2425  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.3985  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.404   +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 1.3528  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 6.5031  +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 12.9246 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * -1.0    +\
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

set PResolution {
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0041 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.004  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0045 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.0065 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.0097 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0044 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.0043 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.0045 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.0066 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.0099 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0046 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.0045 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0046 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.0066 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.0101 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0056 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.0054 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0053 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.007  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.0101 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0053 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.005  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.005  +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.0069 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.0101 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0057 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.0054 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.005  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.0071 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.0101 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0061 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.0058 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0055 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.0075 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.0105 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0063 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.0059 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.0056 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.0075 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.0104 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0069 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0064 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.0058 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.0076 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.0107 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0081 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.0077 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.0073 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.01   +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.0142 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.009  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.0085 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0079 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.0108 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.0147 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0125 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.012  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.011  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.0151 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.0197 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0134 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.0128 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.012  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.0162 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.0211 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0169 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.0159 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.0149 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0183 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.0211 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0183 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.0177 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.0164 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0189 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.0216 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0187 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.0185 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.0161 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.0195 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.023  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0185 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.0171 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.016  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0178 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.0198 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0191 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.0185 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.0173 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.0207 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.0238 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.021  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.0201 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.0197 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.0232 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.0265 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0144 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.0132 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.0145 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.0206 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.029  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.014  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.0129 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.0142 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.0218 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.0309 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0153 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.0141 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.0153 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.0246 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.0356 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.016  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.0148 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.0144 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.024  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.0344 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.013  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.0119 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.0125 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.0257 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.0448 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0142 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.013  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.0128 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.0289 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.0547 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0145 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.0132 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.0134 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.0359 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.0699 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0149 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.0135 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.0149 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.0517 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.1028 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0153 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.0138 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.0188 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.0739 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.1461 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0157 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.0142 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.0234 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.0974 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.1931 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.016  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.0145 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.0255 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.1128 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.2241 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.4009 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.4066 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 1.3478 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 6.4721 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 12.926 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * -1.0   +\
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
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0577 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.0431 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0089 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.0056 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.0052 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0605 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.0404 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.0092 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.0061 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.0058 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0613 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.0445 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0093 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.0059 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.0056 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0505 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.0369 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0092 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.006  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.0058 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0567 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.0372 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.0091 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.0062 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.0055 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0648 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.0456 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.0092 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.0055 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.005  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0601 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.0471 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0094 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.006  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.0055 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0654 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.0426 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.0096 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.0061 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.0051 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0714 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0432 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.0093 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.0063 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.0051 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0678 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.0539 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.01   +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.0063 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.0058 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0687 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.0534 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0097 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.0066 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.0061 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0786 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.0579 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.0106 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.0071 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.0067 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0851 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.0605 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.0118 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.0068 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.0062 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0812 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.061  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.011  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0075 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.0067 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0759 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.0664 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.0113 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0065 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.0066 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0793 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.0572 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.0116 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.0071 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.0065 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0831 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.0649 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.0117 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0072 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.0064 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0899 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.0696 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.012  +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.0065 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.0061 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0944 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.082  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.0122 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.0075 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.0066 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0967 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.0693 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.0124 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.0066 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.0068 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.104  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.0784 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.0127 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.0067 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.0066 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.1329 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.0894 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.0126 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.0081 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.0075 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.1107 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.0777 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.0131 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.0074 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.0068 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.1127 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.0835 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.0136 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.0076 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.0071 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.1436 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.1044 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.0167 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.0086 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.0082 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.1251 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.0926 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.0138 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.0086 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.0083 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.1302 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.0993 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.016  +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.0099 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.0099 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.1327 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.0935 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.0156 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.0129 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.0126 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.1412 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.1027 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.0175 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.014  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.0141 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.1436 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.1007 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.0191 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.0163 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.0165 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 3.7163 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 2.6382 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.8811 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.8469 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.8458 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * -1.0   +\
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
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.0662 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.05   +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0142 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.0134 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.0134 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.0544 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.042  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.0163 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.015  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.015  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.0688 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.0524 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0151 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.0128 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.0127 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0708 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.0537 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0146 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.0149 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.0148 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.0633 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.0476 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.0147 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.0132 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.0131 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0773 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.0581 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.0151 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.0126 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.0125 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.0838 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.0629 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.0152 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.0127 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.0126 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.0772 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.0569 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.0173 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.014  +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.014  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0968 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0727 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.0181 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.015  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.0148 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.1173 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.0812 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.0185 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.014  +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.0138 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.1212 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.0919 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0191 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.015  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.0148 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.138  +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.0976 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.0205 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.0153 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.015  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.1399 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.107  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.0207 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.015  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.0148 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.1663 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.127  +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.0229 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.0185 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.0183 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.1801 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.1529 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.0244 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0164 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.0161 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.1891 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.1337 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.0268 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.0184 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.0181 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.2191 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.1619 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.0281 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0208 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.0204 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.2541 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.1841 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.0316 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.0192 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.0187 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.3836 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.2494 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.0398 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.0238 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.0229 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.3426 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.243  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.0371 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.0198 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.0188 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.3851 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.2698 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.0474 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.0234 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.0227 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.5413 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.3901 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.0553 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.0305 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.0296 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.5229 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.3763 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.055  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.0288 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.0276 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.6115 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.4423 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.0688 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.043  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.0412 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.9059 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.6416 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.0826 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.0503 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.049  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.7558 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.5344 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.0769 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.0575 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.0562 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.9185 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.6459 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.0986 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.0695 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.0685 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 1.0326 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.7277 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.1422 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.1368 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.137  +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 1.3024 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.9266 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.1622 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.1445 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.1438 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 1.4559 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 1.2017 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.9311 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.9273 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.9272 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 1.5142 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 1.2752 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.9857 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.9834 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.9833 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * -1.0   +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * -1.0   +\
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

set PhiResolution {
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00194 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.00141 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.0002  +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00193 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.00138 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.00019 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00196 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.00135 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.0002  +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00199 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.00143 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.0002  +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00205 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.00154 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.00021 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.0021  +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.00158 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.00022 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00216 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.00154 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.00021 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00221 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.00152 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.00021 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0023  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.00165 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.00022 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 7e-05   +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 5e-05   +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.00238 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.00167 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.00023 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 8e-05   +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 6e-05   +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00245 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.00175 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.00024 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 8e-05   +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 6e-05   +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00267 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.00189 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.00026 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 9e-05   +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 7e-05   +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00276 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.00197 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.00028 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00297 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.00211 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.00028 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.00011 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00312 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.00224 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.00031 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00319 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.00223 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.0003  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00336 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.0024  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.0003  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.0001  +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 7e-05   +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00363 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.00258 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.00035 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.00011 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.0038  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.00256 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.00034 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.00011 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 8e-05   +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.0038  +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.00267 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.00036 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.00011 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 9e-05   +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00393 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.00277 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.00039 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.00012 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 9e-05   +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00432 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.00303 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.00037 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.00013 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.0001  +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00425 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.00304 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.00037 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.00012 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.0001  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.0044  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.00313 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.0004  +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.00012 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00472 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.00336 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.00044 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.00016 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.00015 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00461 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.00328 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.00046 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.00018 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.00017 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.005   +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.00356 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.00049 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.00022 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.00022 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00512 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.00362 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.00047 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.0003  +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.00029 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.00533 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.00377 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.00051 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.00049 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.00034 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.00559 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.00393 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.00056 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.00043 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.00043 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.09609 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.06838 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.02278 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.02195 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.02186 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * -1.0    +\
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
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00211 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 1   && pt <= 10  ) * 0.00158 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 10  && pt <= 50  ) * 0.00024 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 50  && pt <= 100 ) * 0.00014 +\
    ( abs(eta) > 0.0 && abs(eta) <= 0.1 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00193 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 1   && pt <= 10  ) * 0.0014  +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 10  && pt <= 50  ) * 0.00024 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 0.1 && abs(eta) <= 0.2 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00216 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 1   && pt <= 10  ) * 0.00173 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 10  && pt <= 50  ) * 0.00024 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 0.2 && abs(eta) <= 0.3 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00214 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 1   && pt <= 10  ) * 0.00155 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 10  && pt <= 50  ) * 0.00025 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 0.3 && abs(eta) <= 0.4 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00223 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 1   && pt <= 10  ) * 0.00166 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 10  && pt <= 50  ) * 0.00026 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 0.4 && abs(eta) <= 0.5 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00266 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 1   && pt <= 10  ) * 0.00197 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 10  && pt <= 50  ) * 0.00028 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 50  && pt <= 100 ) * 0.00014 +\
    ( abs(eta) > 0.5 && abs(eta) <= 0.6 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00283 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 1   && pt <= 10  ) * 0.0021  +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 10  && pt <= 50  ) * 0.00029 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 50  && pt <= 100 ) * 0.00014 +\
    ( abs(eta) > 0.6 && abs(eta) <= 0.7 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00283 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 1   && pt <= 10  ) * 0.00203 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 10  && pt <= 50  ) * 0.00031 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 0.7 && abs(eta) <= 0.8 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.00322 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 1   && pt <= 10  ) * 0.0023  +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 10  && pt <= 50  ) * 0.00034 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 0.8 && abs(eta) <= 0.9 ) * ( pt > 100              ) * 0.00015 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.00362 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 1   && pt <= 10  ) * 0.00261 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 10  && pt <= 50  ) * 0.00037 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 50  && pt <= 100 ) * 0.00015 +\
    ( abs(eta) > 0.9 && abs(eta) <= 1.0 ) * ( pt > 100              ) * 0.00014 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.00404 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 1   && pt <= 10  ) * 0.00289 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 10  && pt <= 50  ) * 0.0004  +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 50  && pt <= 100 ) * 0.00016 +\
    ( abs(eta) > 1.0 && abs(eta) <= 1.1 ) * ( pt > 100              ) * 0.00015 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.00451 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 1   && pt <= 10  ) * 0.00321 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 10  && pt <= 50  ) * 0.00044 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 50  && pt <= 100 ) * 0.00017 +\
    ( abs(eta) > 1.1 && abs(eta) <= 1.2 ) * ( pt > 100              ) * 0.00015 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.00513 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 1   && pt <= 10  ) * 0.00382 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 10  && pt <= 50  ) * 0.00052 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 50  && pt <= 100 ) * 0.00024 +\
    ( abs(eta) > 1.2 && abs(eta) <= 1.3 ) * ( pt > 100              ) * 0.00022 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.00574 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 1   && pt <= 10  ) * 0.00404 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 10  && pt <= 50  ) * 0.00053 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 50  && pt <= 100 ) * 0.00026 +\
    ( abs(eta) > 1.3 && abs(eta) <= 1.4 ) * ( pt > 100              ) * 0.00024 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.00663 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 1   && pt <= 10  ) * 0.00482 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 10  && pt <= 50  ) * 0.00062 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 50  && pt <= 100 ) * 0.00025 +\
    ( abs(eta) > 1.4 && abs(eta) <= 1.5 ) * ( pt > 100              ) * 0.00022 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.00745 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 1   && pt <= 10  ) * 0.00518 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 10  && pt <= 50  ) * 0.00066 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 50  && pt <= 100 ) * 0.00027 +\
    ( abs(eta) > 1.5 && abs(eta) <= 1.6 ) * ( pt > 100              ) * 0.00024 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.00846 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 1   && pt <= 10  ) * 0.00613 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 10  && pt <= 50  ) * 0.00076 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 50  && pt <= 100 ) * 0.00036 +\
    ( abs(eta) > 1.6 && abs(eta) <= 1.7 ) * ( pt > 100              ) * 0.00033 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.00955 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 1   && pt <= 10  ) * 0.00686 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 10  && pt <= 50  ) * 0.00099 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 50  && pt <= 100 ) * 0.00036 +\
    ( abs(eta) > 1.7 && abs(eta) <= 1.8 ) * ( pt > 100              ) * 0.00034 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.01249 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 1   && pt <= 10  ) * 0.0087  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 10  && pt <= 50  ) * 0.00104 +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 50  && pt <= 100 ) * 0.0004  +\
    ( abs(eta) > 1.8 && abs(eta) <= 1.9 ) * ( pt > 100              ) * 0.00035 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.01363 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 1   && pt <= 10  ) * 0.00951 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 10  && pt <= 50  ) * 0.00115 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 50  && pt <= 100 ) * 0.00044 +\
    ( abs(eta) > 1.9 && abs(eta) <= 2.0 ) * ( pt > 100              ) * 0.0004  +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.01411 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 1   && pt <= 10  ) * 0.01045 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 10  && pt <= 50  ) * 0.00146 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 50  && pt <= 100 ) * 0.00062 +\
    ( abs(eta) > 2.0 && abs(eta) <= 2.1 ) * ( pt > 100              ) * 0.00056 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 0.7 && pt <= 1   ) * 0.01853 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 1   && pt <= 10  ) * 0.01328 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 10  && pt <= 50  ) * 0.00165 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 50  && pt <= 100 ) * 0.00079 +\
    ( abs(eta) > 2.1 && abs(eta) <= 2.2 ) * ( pt > 100              ) * 0.00074 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 0.7 && pt <= 1   ) * 0.01956 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 1   && pt <= 10  ) * 0.01385 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 10  && pt <= 50  ) * 0.00179 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 50  && pt <= 100 ) * 0.00088 +\
    ( abs(eta) > 2.2 && abs(eta) <= 2.3 ) * ( pt > 100              ) * 0.00082 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 0.7 && pt <= 1   ) * 0.02198 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 1   && pt <= 10  ) * 0.01564 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 10  && pt <= 50  ) * 0.00234 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 50  && pt <= 100 ) * 0.00131 +\
    ( abs(eta) > 2.3 && abs(eta) <= 2.4 ) * ( pt > 100              ) * 0.00126 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 0.7 && pt <= 1   ) * 0.02772 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 1   && pt <= 10  ) * 0.02004 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 10  && pt <= 50  ) * 0.00272 +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 50  && pt <= 100 ) * 0.0015  +\
    ( abs(eta) > 2.4 && abs(eta) <= 2.5 ) * ( pt > 100              ) * 0.00142 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 0.7 && pt <= 1   ) * 0.02948 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 1   && pt <= 10  ) * 0.02082 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 10  && pt <= 50  ) * 0.00293 +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 50  && pt <= 100 ) * 0.0018  +\
    ( abs(eta) > 2.5 && abs(eta) <= 2.6 ) * ( pt > 100              ) * 0.00176 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 0.7 && pt <= 1   ) * 0.03664 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 1   && pt <= 10  ) * 0.02554 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 10  && pt <= 50  ) * 0.00354 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 50  && pt <= 100 ) * 0.00236 +\
    ( abs(eta) > 2.6 && abs(eta) <= 2.7 ) * ( pt > 100              ) * 0.00231 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 0.7 && pt <= 1   ) * 0.03975 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 1   && pt <= 10  ) * 0.02823 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 10  && pt <= 50  ) * 0.00506 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 50  && pt <= 100 ) * 0.00454 +\
    ( abs(eta) > 2.7 && abs(eta) <= 2.8 ) * ( pt > 100              ) * 0.00453 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 0.7 && pt <= 1   ) * 0.04596 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 1   && pt <= 10  ) * 0.03227 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 10  && pt <= 50  ) * 0.00596 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 50  && pt <= 100 ) * 0.00513 +\
    ( abs(eta) > 2.8 && abs(eta) <= 2.9 ) * ( pt > 100              ) * 0.0051  +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 0.7 && pt <= 1   ) * 0.04404 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 1   && pt <= 10  ) * 0.03258 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 10  && pt <= 50  ) * 0.01831 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 50  && pt <= 100 ) * 0.01827 +\
    ( abs(eta) > 2.9 && abs(eta) <= 3.0 ) * ( pt > 100              ) * 0.01827 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 0.7 && pt <= 1   ) * 0.03979 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 1   && pt <= 10  ) * 0.03159 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 10  && pt <= 50  ) * 0.02015 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 50  && pt <= 100 ) * 0.02023 +\
    ( abs(eta) > 3.0 && abs(eta) <= 3.1 ) * ( pt > 100              ) * 0.02024 +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.1 && abs(eta) <= 3.2 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.2 && abs(eta) <= 3.3 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.3 && abs(eta) <= 3.4 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.4 && abs(eta) <= 3.5 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.5 && abs(eta) <= 3.6 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.6 && abs(eta) <= 3.7 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.7 && abs(eta) <= 3.8 ) * ( pt > 100              ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 0.7 && pt <= 1   ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 1   && pt <= 10  ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 10  && pt <= 50  ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 50  && pt <= 100 ) * -1.0    +\
    ( abs(eta) > 3.8 && abs(eta) <= 3.9 ) * ( pt > 100              ) * -1.0    +\
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



