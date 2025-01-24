let input =
"""
p=84,26 v=99,-23
p=98,17 v=-41,-46
p=3,84 v=-17,-23
p=92,66 v=36,-4
p=16,102 v=95,-60
p=14,90 v=-71,-62
p=26,29 v=91,-20
p=74,36 v=67,30
p=59,66 v=86,-4
p=32,47 v=-79,7
p=82,42 v=3,-84
p=61,16 v=28,34
p=82,9 v=-84,-78
p=5,71 v=16,84
p=15,79 v=-48,75
p=76,92 v=-32,68
p=43,93 v=54,78
p=22,73 v=-49,68
p=79,13 v=-78,-55
p=61,17 v=1,90
p=71,58 v=-73,16
p=60,63 v=-31,87
p=8,41 v=-17,-96
p=13,51 v=-16,-51
p=86,15 v=12,-65
p=35,71 v=57,3
p=77,81 v=89,86
p=100,37 v=93,-84
p=31,38 v=22,20
p=9,98 v=99,-47
p=29,21 v=72,-76
p=67,99 v=76,-25
p=62,67 v=54,78
p=80,79 v=-1,91
p=74,7 v=51,-42
p=31,57 v=30,70
p=7,74 v=57,-75
p=49,29 v=-9,34
p=27,70 v=-45,-54
p=96,30 v=47,-77
p=7,22 v=-65,52
p=50,53 v=15,-1
p=37,44 v=46,-96
p=85,87 v=-10,-25
p=91,8 v=47,-56
p=96,11 v=-50,-67
p=75,85 v=80,90
p=51,72 v=41,79
p=81,67 v=-93,-25
p=78,51 v=65,-99
p=94,21 v=15,38
p=41,63 v=-77,89
p=98,11 v=-52,31
p=97,53 v=67,12
p=10,93 v=78,-74
p=13,23 v=53,40
p=73,39 v=-11,58
p=82,54 v=45,-39
p=4,14 v=-52,60
p=69,85 v=-93,86
p=88,27 v=-98,-64
p=54,88 v=50,-27
p=53,84 v=-82,-15
p=47,51 v=24,61
p=100,94 v=-54,-52
p=91,23 v=1,-66
p=95,45 v=-42,7
p=76,92 v=80,53
p=29,0 v=13,-29
p=38,46 v=40,2
p=29,19 v=-24,-59
p=4,53 v=-74,11
p=77,87 v=45,-13
p=75,12 v=-82,-52
p=95,84 v=38,93
p=52,52 v=20,17
p=16,0 v=-83,51
p=68,21 v=98,-72
p=9,54 v=-76,20
p=27,9 v=9,-55
p=32,44 v=-11,-96
p=90,59 v=67,6
p=68,52 v=65,30
p=71,44 v=-3,11
p=6,14 v=16,44
p=10,0 v=18,-40
p=85,41 v=17,90
p=15,4 v=-59,57
p=44,65 v=2,97
p=15,78 v=53,-48
p=34,12 v=46,53
p=43,45 v=86,-83
p=76,52 v=-92,-81
p=11,80 v=97,-24
p=37,3 v=48,63
p=1,54 v=49,-5
p=45,61 v=-5,81
p=71,63 v=87,95
p=72,40 v=-83,32
p=10,9 v=-83,47
p=3,23 v=-10,-73
p=84,1 v=85,52
p=52,24 v=-18,36
p=76,37 v=21,-84
p=49,26 v=20,11
p=66,54 v=30,-4
p=24,66 v=-61,79
p=34,22 v=41,-90
p=43,6 v=-52,-66
p=15,30 v=68,6
p=72,74 v=-55,93
p=35,25 v=24,-66
p=80,21 v=56,36
p=43,67 v=59,95
p=61,39 v=-69,-88
p=61,93 v=-66,65
p=18,94 v=97,74
p=4,43 v=13,-75
p=13,62 v=-74,-91
p=61,27 v=32,-59
p=28,88 v=55,-19
p=52,55 v=-94,-60
p=83,37 v=46,97
p=2,72 v=-52,-77
p=35,31 v=-33,23
p=75,73 v=30,-12
p=55,7 v=87,-70
p=48,52 v=-41,-22
p=50,15 v=39,-54
p=35,69 v=63,-92
p=40,55 v=-20,-84
p=51,27 v=61,-67
p=24,29 v=62,21
p=12,14 v=86,45
p=57,29 v=-99,-66
p=82,74 v=16,26
p=2,40 v=-32,-69
p=23,14 v=-81,49
p=89,70 v=-32,99
p=4,27 v=60,-67
p=34,10 v=-77,-57
p=40,73 v=88,73
p=26,38 v=-90,21
p=31,25 v=45,15
p=93,8 v=-65,54
p=61,25 v=-69,-79
p=13,63 v=19,27
p=58,13 v=15,-42
p=29,1 v=3,65
p=65,59 v=41,15
p=86,69 v=-89,-14
p=23,63 v=-87,-79
p=14,7 v=81,-54
p=3,92 v=-96,61
p=78,24 v=-34,-70
p=48,30 v=-22,10
p=59,79 v=85,66
p=91,7 v=5,-60
p=61,25 v=-20,41
p=5,90 v=60,87
p=68,9 v=-24,25
p=27,55 v=42,9
p=48,41 v=37,-78
p=43,44 v=80,-68
p=73,20 v=30,-49
p=13,62 v=-19,-3
p=46,11 v=24,50
p=17,90 v=86,75
p=77,18 v=-84,79
p=5,52 v=4,-30
p=28,63 v=34,41
p=72,83 v=87,-15
p=11,16 v=51,-60
p=4,33 v=-63,-71
p=70,77 v=34,-25
p=37,46 v=22,-20
p=87,49 v=-25,2
p=89,16 v=45,-59
p=9,82 v=-33,97
p=66,27 v=87,-72
p=64,97 v=-38,-40
p=51,90 v=-73,76
p=25,57 v=-68,-95
p=41,13 v=8,-48
p=39,13 v=59,29
p=42,51 v=13,9
p=70,102 v=-14,-54
p=41,69 v=2,83
p=74,7 v=-10,39
p=91,63 v=32,-99
p=6,22 v=-70,-55
p=78,5 v=-12,37
p=54,76 v=-46,-84
p=17,19 v=-4,-62
p=70,101 v=76,58
p=71,94 v=41,74
p=16,91 v=18,-32
p=10,90 v=95,-53
p=97,61 v=71,5
p=63,49 v=-73,-70
p=85,27 v=-76,-56
p=98,11 v=47,47
p=58,7 v=-5,46
p=5,48 v=-6,-94
p=4,90 v=-87,-16
p=55,84 v=-3,-29
p=74,1 v=95,-35
p=3,43 v=35,28
p=11,29 v=91,40
p=10,11 v=38,31
p=61,44 v=-19,10
p=87,52 v=76,96
p=3,92 v=27,67
p=68,64 v=87,-6
p=74,88 v=87,-34
p=24,52 v=43,-61
p=91,10 v=-65,-63
p=65,98 v=49,-21
p=88,66 v=-71,-46
p=21,84 v=-26,93
p=7,69 v=84,81
p=43,21 v=6,-9
p=43,64 v=-73,-19
p=35,47 v=79,-88
p=54,21 v=39,-62
p=20,63 v=-33,27
p=21,51 v=99,10
p=16,82 v=-72,-31
p=23,10 v=-2,-45
p=37,33 v=-22,21
p=41,74 v=-9,88
p=31,96 v=-15,65
p=37,12 v=46,55
p=72,54 v=-54,-52
p=9,58 v=-28,-87
p=0,13 v=-96,-50
p=65,70 v=18,11
p=32,38 v=90,-84
p=97,67 v=40,-3
p=45,17 v=90,57
p=36,85 v=2,83
p=29,39 v=63,78
p=51,99 v=-7,-40
p=18,93 v=18,-30
p=75,93 v=-12,65
p=1,85 v=27,-20
p=17,84 v=97,72
p=3,68 v=-74,96
p=72,22 v=-49,52
p=18,65 v=-50,1
p=71,16 v=63,-59
p=36,44 v=-20,85
p=77,21 v=-27,96
p=70,54 v=95,-70
p=20,5 v=-44,-9
p=97,64 v=55,94
p=49,82 v=35,-16
p=63,54 v=2,-51
p=88,101 v=1,65
p=1,3 v=-89,-34
p=29,97 v=-24,-42
p=45,46 v=-66,14
p=51,33 v=68,35
p=91,29 v=-78,-35
p=10,56 v=-83,31
p=11,94 v=-41,-15
p=63,76 v=19,90
p=84,84 v=21,84
p=24,41 v=-79,25
p=94,82 v=23,85
p=60,52 v=-48,-4
p=47,36 v=66,-51
p=0,49 v=-6,-90
p=40,23 v=-99,-63
p=21,79 v=-64,-40
p=71,18 v=-14,-67
p=53,44 v=-51,7
p=71,40 v=83,51
p=96,87 v=93,-29
p=46,64 v=22,88
p=3,53 v=44,-52
p=54,57 v=74,-95
p=61,63 v=-95,-12
p=96,82 v=3,-17
p=41,96 v=5,89
p=7,46 v=-19,20
p=2,7 v=55,33
p=27,15 v=29,33
p=54,64 v=-7,2
p=84,58 v=-93,59
p=80,24 v=56,5
p=23,13 v=66,-56
p=93,100 v=-89,45
p=89,82 v=91,69
p=55,90 v=96,-5
p=43,41 v=16,-93
p=54,70 v=28,-85
p=50,64 v=-33,-22
p=99,35 v=71,17
p=23,77 v=11,-3
p=78,99 v=43,-38
p=3,80 v=-57,8
p=22,75 v=-48,-18
p=3,94 v=-98,-33
p=72,89 v=-90,39
p=87,84 v=67,61
p=28,0 v=22,55
p=65,55 v=82,70
p=55,48 v=17,-96
p=11,37 v=-33,52
p=63,63 v=-94,9
p=0,10 v=-78,59
p=91,17 v=23,-58
p=56,77 v=72,81
p=99,47 v=14,19
p=15,18 v=31,24
p=47,9 v=56,-13
p=38,11 v=-9,-50
p=93,2 v=-76,47
p=97,52 v=-45,-32
p=51,44 v=-65,68
p=15,2 v=-83,72
p=15,99 v=97,54
p=85,81 v=45,78
p=11,57 v=3,-13
p=91,30 v=11,56
p=42,90 v=-75,73
p=24,7 v=99,-68
p=55,58 v=83,-7
p=35,4 v=15,31
p=21,39 v=42,27
p=62,9 v=6,-48
p=59,99 v=-20,46
p=93,71 v=1,96
p=31,3 v=77,-47
p=98,11 v=25,-52
p=28,41 v=92,22
p=90,64 v=93,81
p=64,93 v=-71,-28
p=31,65 v=-74,-47
p=62,44 v=21,30
p=35,22 v=-76,5
p=69,2 v=-4,47
p=34,28 v=52,32
p=3,37 v=-17,21
p=43,92 v=90,-50
p=16,59 v=29,-1
p=41,6 v=57,-50
p=93,58 v=-74,-16
p=88,60 v=-2,-10
p=62,19 v=-51,37
p=30,80 v=79,83
p=75,14 v=-84,79
p=77,10 v=-34,-71
p=92,60 v=21,13
p=21,25 v=-26,-67
p=88,101 v=57,80
p=60,93 v=14,-99
p=55,33 v=61,-77
p=76,51 v=-60,67
p=23,31 v=-48,25
p=47,28 v=71,18
p=6,10 v=-6,55
p=74,29 v=-51,-56
p=43,49 v=-66,15
p=53,15 v=17,46
p=34,89 v=-90,-28
p=53,12 v=26,-53
p=68,96 v=32,68
p=10,50 v=-6,5
p=30,7 v=69,80
p=2,69 v=60,84
p=78,74 v=32,-12
p=83,87 v=-8,-31
p=86,86 v=48,-45
p=19,6 v=7,-48
p=53,32 v=-55,-89
p=32,35 v=-23,-39
p=95,23 v=-87,43
p=56,82 v=50,-22
p=28,101 v=99,-36
p=8,77 v=5,-13
p=74,21 v=-27,-90
p=68,59 v=98,-6
p=83,93 v=21,76
p=80,24 v=-91,-78
p=7,78 v=47,-8
p=19,81 v=90,-14
p=96,20 v=-30,44
p=70,54 v=-14,10
p=93,25 v=-65,33
p=51,76 v=26,90
p=79,25 v=45,-69
p=89,6 v=-47,-54
p=32,78 v=62,18
p=98,32 v=57,23
p=34,30 v=-22,-91
p=37,94 v=-72,86
p=81,94 v=-45,63
p=20,37 v=-24,29
p=2,63 v=-26,-19
p=4,29 v=-72,-68
p=18,95 v=45,71
p=64,84 v=28,-25
p=8,32 v=84,-93
p=15,3 v=-6,-41
p=42,53 v=81,-92
p=20,73 v=79,72
p=43,3 v=28,-38
p=86,85 v=-21,72
p=97,29 v=69,36
p=23,74 v=-55,72
p=83,87 v=45,-26
p=70,0 v=-93,57
p=61,0 v=-25,74
p=22,0 v=-35,56
p=12,8 v=-70,34
p=27,24 v=66,-74
p=27,87 v=29,78
p=36,98 v=68,72
p=26,40 v=40,-82
p=38,34 v=-80,6
p=34,83 v=33,74
p=23,24 v=9,27
p=46,96 v=96,-43
p=80,41 v=52,19
p=33,10 v=37,-47
p=47,15 v=74,73
p=25,102 v=-3,-72
p=73,63 v=-71,-1
p=27,78 v=-2,83
p=28,8 v=18,55
p=95,102 v=-39,-42
p=65,69 v=-38,-16
p=54,17 v=-18,48
p=63,64 v=96,96
p=3,32 v=-37,33
p=96,84 v=36,61
p=67,9 v=67,-54
p=88,54 v=-74,-52
p=70,52 v=52,14
p=97,81 v=-55,-56
p=4,11 v=40,54
p=51,9 v=-16,-97
p=59,88 v=85,75
p=58,24 v=72,-67
p=73,59 v=76,-93
p=34,40 v=81,2
p=38,22 v=94,52
p=77,27 v=78,39
p=65,50 v=28,16
p=63,14 v=-38,-48
p=13,70 v=-24,75
p=60,16 v=12,-9
p=43,65 v=92,50
p=66,31 v=-24,-65
p=67,32 v=10,4
p=20,27 v=-27,97
p=87,35 v=-52,38
p=69,86 v=80,-41
p=55,81 v=4,-15
p=11,102 v=-28,54
p=34,74 v=52,-16
p=74,90 v=19,77
p=100,71 v=-63,-17
p=16,27 v=-52,30
p=77,75 v=-59,-50
p=18,76 v=27,81
p=65,99 v=42,-45
p=30,15 v=-79,48
p=4,95 v=80,-31
p=81,87 v=83,15
p=22,31 v=33,34
p=46,77 v=-43,-42
p=36,37 v=-99,27
p=35,86 v=29,20
p=54,16 v=-9,-77
p=58,5 v=-38,-34
p=40,26 v=4,-53
p=31,36 v=56,-5
p=46,101 v=-5,97
p=99,97 v=47,88
p=52,42 v=94,-81
p=92,100 v=95,65
p=86,19 v=-78,-48
p=75,100 v=-23,63
p=74,38 v=98,-99
p=61,92 v=-42,-40
p=70,98 v=8,63
p=4,82 v=-74,-32
p=79,1 v=63,-33
p=5,49 v=-17,11
p=55,39 v=-82,-68
p=91,98 v=-96,64
p=55,82 v=24,77
p=54,48 v=83,13
p=0,23 v=-19,-74
p=25,50 v=48,36
p=99,21 v=36,-68
p=26,33 v=9,9
"""
