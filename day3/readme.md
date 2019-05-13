#### Q1 了解目录结构，与前端相关的比如文档（DOC）仿真模型（verilog/VHDL），标准单元库（synopsys/symbols）
每一个/aci路径下面包含了astro（），doc（文档资料），lef（），primetime（），symbols（标准单元库），synopsys（标准单元库），verilog（仿真模型），vhdl（仿真模型）等文件夹。
#### Q2 阅读文档，transition time, propagation delay等参数的含义。
这个问题和昨天的问题相似，transtion delay time, 分为rising time和falling time。rising time是指从10%的Vdd到90%的Vdd的时间，falling time是指从Vdd 90%到10%的时间。
propagation delay，顾名思义是传播延迟，就是输入的电平变到50%Vdd起开始计时，到输出电平变到50%Vdd为止所需要的时间。这些参数都在时序约束当中起到重要的作用。
![传播延时](https://github.com/kangjian888/verilog_everyday/blob/master/day3/propagation_delay.JPG)
![转换时间](https://github.com/kangjian888/verilog_everyday/blob/master/day3/transition_time.JPG)
#### Q3 阅读文档power dissipation/calculation的描述。
仅消耗AC的功耗，转换速率是决定系统功耗的因素之一。关于平均功率计算公式，有输入管脚的功率，输出管脚的功耗。

#### Q4 阅读文档，delay calculation的描述
这个和工艺降额系数(决定是快速典型还是慢速的制程的情况)，Vdd和电压降额系数，温度和温度降额系数。没有负载的传播延迟，还有输出负载的电容以及负载延时因子。所以，负载的电容值对于传播延迟起到的很重要的影响。
#### Q5 提供了那些类型的cell
基本的一位加法单元，基本的逻辑单元（与门，或门，与非门，或非门等），D寄存器，延时单元，多路选择器等。
#### Q6 Verilog文件中包含了哪些信息？
各个逻辑单元的门级模型描述。仿真模型当中的延时的相关参数，我觉得应该是在仿真时候进行适用。