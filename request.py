import numpy as np
import pandas as pd

a, b = 19, 27

# 連続一様分布の確率密度関数
fx = 1.0 / (b - a)
print('確率密度関数は、{}'.format(fx))

# 分散
var = ( (b - a)**2 ) / 12
print('分散={}'.format(var))

