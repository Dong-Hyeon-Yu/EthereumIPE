```
Name                                                    Gascost         Time (ns)      MGas/S    Gasprice for 10MGas/S    Gasprice for ECDSA eq
---------------------------------------------------  ----------  ----------------  ----------  -----------------------  -----------------------
PrecompiledEcrecover/                                  3000       66422              45.1658                 664.22              3000
PrecompiledSha256/128                                   108         750             144                        7.5                 33.8743
PrecompiledRipeMD/128                                  1080        1478             730.717                   14.78                66.755
PrecompiledIdentity/128                                  27           8.64         3125.72                     0.08638              0.390142
PrecompiledModExp/eip_example1                        13056       48797             267.557                  487.97              2203.95
PrecompiledModExpEip2565/eip_example1                  1360       49366              27.5493                 493.66              2229.65
PrecompiledBn256Add/chfast1                             150       18070               8.30105                180.7                816.145
PrecompiledBn256Add/chfast2                             150       18261               8.21423                182.61               824.772
PrecompiledBn256Add/cdetrio1                            150        1417             105.857                   14.17                63.9999
PrecompiledBn256Add/cdetrio2                            150        1469             102.11                    14.69                66.3485
PrecompiledBn256Add/cdetrio3                            150        1465             102.389                   14.65                66.1678
PrecompiledBn256Add/cdetrio4                            150        1506              99.6016                  15.06                68.0196
PrecompiledBn256Add/cdetrio5                            150        1415             106.007                   14.15                63.9095
PrecompiledBn256Add/cdetrio6                            150        1882              79.7024                  18.82                85.002
PrecompiledBn256Add/cdetrio7                            150        1868              80.2998                  18.68                84.3696
PrecompiledBn256Add/cdetrio8                            150        1946              77.0812                  19.46                87.8926
PrecompiledBn256Add/cdetrio9                            150        1884              79.6178                  18.84                85.0923
PrecompiledBn256Add/cdetrio10                           150        1879              79.8297                  18.79                84.8665
PrecompiledBn256Add/cdetrio11                           150       17868               8.3949                 178.68               807.022
PrecompiledBn256Add/cdetrio12                           150       18683               8.02869                186.83               843.832
PrecompiledBn256Add/cdetrio13                           150       18021               8.32362                180.21               813.932
PrecompiledBn256Add/cdetrio14                           150        3044              49.2773                  30.44               137.485
PrecompiledBn256ScalarMul/chfast1                      6000       86430              69.4203                 864.3               3903.68
PrecompiledBn256ScalarMul/chfast2                      6000       97253              61.6948                 972.53              4392.51
PrecompiledBn256ScalarMul/chfast3                      6000       98338              61.0141                 983.38              4441.51
PrecompiledBn256ScalarMul/cdetrio1                     6000       98005              61.2214                 980.05              4426.47
PrecompiledBn256ScalarMul/cdetrio6                     6000      101099              59.3478                1010.99              4566.21
PrecompiledBn256ScalarMul/cdetrio11                    6000      100646              59.6149                1006.46              4545.75
PrecompiledBn256Pairing/jeff1                        113000           3.42650e+06    32.9782               34265.1             154761
PrecompiledBn256Pairing/jeff2                        113000           3.41063e+06    33.1317               34106.3             154044
PrecompiledBn256Pairing/jeff3                        113000           3.44382e+06    32.8124               34438.2             155543
PrecompiledBn256Pairing/jeff4                        147000           4.69083e+06    31.3378               46908.3             211865
PrecompiledBn256Pairing/jeff5                        147000           4.64332e+06    31.6584               46433.2             209719
PrecompiledBn256Pairing/jeff6                        113000           3.4327e+06     32.9187               34327               155041
PrecompiledBn256Pairing/empty_data                    45000      857598              52.4721                8575.98             38734.1
PrecompiledBn256Pairing/one_point                     79000           2.15122e+06    36.7234               21512.2              97161.3
PrecompiledBn256Pairing/two_point_match_2            113000           3.35737e+06    33.6573               33573.7             151638
PrecompiledBn256Pairing/two_point_match_3            113000           3.4189e+06     33.0516               34189               154417
PrecompiledBn256Pairing/two_point_match_4            113000           3.4007e+06     33.2285               34007               153595
PrecompiledBn256Pairing/ten_point_match_1            385000           1.33659e+07    28.8046              133659               603682
PrecompiledBn256Pairing/ten_point_match_2            385000           1.32231e+07    29.1158              132231               597230
PrecompiledBn256Pairing/ten_point_match_3            113000           3.33899e+06    33.8426               33389.9             150808
PrecompiledBlake2F/vector_4                               0         189.2             0                        1.892                8.54536
PrecompiledBlake2F/vector_5                              12         392.8            30.5499                   3.928               17.7411
PrecompiledBlake2F/vector_6                              12         392.5            30.5732                   3.925               17.7276
PrecompiledBlake2F/vector_7                               1         205.8             4.85909                  2.058                9.29511
PrecompiledBlake2F/vector_8                               8e+06       6.7351e+07    118.781               673510                    3.04196e+06
PrecompiledBn256Fp12Mul/                             100000       12454            8029.55                   124.54               562.494
PrecompiledBLS12381G1Add/bls_g1add_(g1+g1=2*g1)         600       19606              30.6029                 196.06               885.52
PrecompiledBLS12381G1Add/bls_g1add_(2*g1+3*g1=5*g1)     600       19936              30.0963                 199.36               900.425
```

Columns

* `MGas/S` - Shows what MGas per second was measured on that machine at that time
* `Gasprice for 10MGas/S` shows what the gasprice should have been, in order to reach 10 MGas/second
* `Gasprice for ECDSA eq` shows what the gasprice should have been, in order to have the same cost/cycle as ecRecover
    
