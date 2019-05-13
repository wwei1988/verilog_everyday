#### Q1 dff 和 latch区别
dff对于边沿敏感，latch对于电平敏感。latch没有时钟端，不受时钟控制，一般在电路设计中应该谨慎使用。
#### Q2 什么是同步电路和异步电路
同步电路就是时钟之间有固定的因果关系，异步电路就是各个时钟之间没有固定的因果关系。
  电路设计可分类为同步电路和异步电路设计。同步电路利用时钟脉冲使其子系统同步运作，而异步电路不使用时钟脉冲做同步，其子系统是使用特殊的“开始”和 “完成”信号使之同步。由于异步电路具有下列优点--无时钟歪斜问题、低电源消耗、平均效能而非最差效能、模块性、可组合和可复用性--因此近年来对异步 电路研究增加快速，论文发表数以倍增，而Intel Pentium 4处理器设计，也开始采用异步电路设计
#### Q3 什么是setup time和hold time
setup time中文翻译叫做建立时间，我们都知道，时钟延到来的时候寄存器会采集数据，这个数据在时钟延到来之前要保持一段时间，才能确保时钟延采到的数据是正确的，需要保持的这个时间的最小值，就称作setup time。hold time的中文翻译叫做保持时间，顾名思义，在时钟上升沿结束后，数据还需要保持一段时间，这个需要保持的时间的最小值，我们就称为hold time
#### Q4 设计一个101的序列检测器，要画出状态转移图，写出verilog
整个工程和仿真可以参见：
[仿真工程github链接](https://github.com/kangjian888/verilog_everyday_prj/tree/master/day_5_code)
![仿真结果](https://github.com/kangjian888/verilog_everyday_prj/blob/master/day_5_code/Screenshot-DVE%20-%20TopLevel.2%20-%20%5BWave.1%5D%20%20-home-IC-...-day_5_code-behav_sim-simv.png)