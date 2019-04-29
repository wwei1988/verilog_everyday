#### Q1 什么是竞争和冒险？
（答案超自百度）
在组合逻辑电路当中，某个输入变量通过两条或者两条以上的途径到达输出端，由于每条途径延迟的时间不同，到达输出门的时间有先有后，这种现象称为竞争（其实也比较好理解，多条线路上的信号就像赛跑一样，一起出发，但是到达的时间不同）。不产生错误的竞争称为非临界竞争；产生暂时或者永久性错误的竞争称为临界竞争。
由于电路竞争所产生的错误，称为冒险。
所以，存在竞争不一定会有冒险，但是冒险出现一定是因为电路存在竞争。
#### Q2 设计一个2-4译码器
首先确定输入和输出，2个输入，4个输出。
然后我们需要写出真值表。
![design processing](https://github.com/kangjian888/verilog_everyday/blob/master/day4/2.PNG)
#### Q3 输入一个8bit的数，输出其中1的个数。如果只能使用1bit的全加器，最少需要多少个。
![the num of 1bit](https://github.com/kangjian888/verilog_everyday/blob/master/day4/1.PNG)
#### Q4 如果一个标准单元库只有3个cell：2输入mux，TIEH(输出常数1)和TIEL(输出常数0),如何实现以下的功能
1 反相器
2 缓冲器buffer
3 两输入与门
4 两输入或门
5 四输入mux
6 一位全加器
![schematic](https://github.com/kangjian888/verilog_everyday/blob/master/day4/3.PNG)