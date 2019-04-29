#### Q1 
reg和wire的区别：
从语法的角度来讲，wire不可以在always以及initial块里面复制，同时reg不能用assign来赋值。这一点是新手在写verilog时候经常犯错的地方。
从功能以及实现的角度来讲，reg代表的是寄存器的实现，往往reg的变量，在最后综合的电路中代表的是寄存器，也就是可以保存的，有记忆的量。但是wire如其英文的意思，往往最后综合出来的线网，也就是对应的就是实际的电路中的一根线，是没有记忆的量，只是起到电路相互连接的作用。
#### Q2:
上下边沿检测器的实现。我写了两种，一种是同步的边沿检测，另一种是异步的边沿检测。对于同步的边沿检测来说，当边沿出现后，在下一个时钟上升沿到来的时候，flag才会变高。对于异步检测，在边沿出现后，flag会立刻变高而不等待时钟信号，具体的实现非常简单，可以参加
[github工程链接](https://github.com/kangjian888/verilog_everyday_prj/tree/master/day_6_code)
![仿真结果](https://github.com/kangjian888/verilog_everyday_prj/blob/master/day_6_code/Screenshot-DVE%20-%20TopLevel.2%20-%20%5BWave.1%5D%20%20-home-IC-...-day_6_code-behav_sim-simv.png)
#### Q3:
编辑器：Sublime
行为级的编译仿真：VCS2014
操作步骤，先编写rtl和testbench，然后用sh脚本控制软件运行。