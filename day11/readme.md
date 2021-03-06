#### 时钟转换避免毛刺的技术
原文来自: [Techniques to make clock switching glitch free](https://www.eetimes.com/document.asp?doc_id=1202359)

越来越多的多时钟的电路出现在电路上，尤其是在数字领域。越来越多的芯片需要在运行的时候动态的切换时钟源，。这通常在硬件内部由一个选择器来实现，而且选择器的控制端通过电路内部的逻辑来实现。
两个时钟的频率可以毫无关联，或者是固定的倍数的联系。两种情况下，在时钟的切换的时候，都可能会产生毛刺。时钟网络中的毛刺会对整个系统造成损害，因为会被一些寄存器作为时钟延捕获而会被另一些寄存器所忽略。
在这篇文章当中，我们将会介绍两种用来避免输出时钟毛刺的方法。第一种用来介绍两个时钟有固定的频率关系，另一种用来介绍两个时钟没有任何的关联。
##### 动态时钟转换的问题
图一展示了一个时钟转换的简单实现，用来一个“与-或”的选择器逻辑。选择器有一个控制信号，命名为“SELECT”，当这个信号是“0”的时候，CLK0会被传递到输出端，当这个信号是“1”的时候，CLK1会被传输到输出端。当收到切换信号的时候，时钟源会立即切换，这是造成可能的时钟毛刺的原因所在。输出时钟的值在选择信号的前后分别来自两个时钟源。图二展示了毛刺产生的原理：

![图一](https://github.com/kangjian888/verilog_everyday/blob/master/day11/1.JPG)

![图二](https://github.com/kangjian888/verilog_everyday/blob/master/day11/2.JPG)

选择信号很可能就是由两个源时钟之一驱动的寄存器所产生的，这也就意味着在两个时钟源具有固定倍数关系的情况下，控制信号和两个时钟都有着已知的时序关系；在两个时钟没有任何关联的情况下，控制信号会和至少一个时钟源是异步的。
在对于时钟源的相位和频率没有明确的关系的情况下，在任何一个时钟是高电平的时候都应该避免时钟源的切换。固定延迟的引入可以减小两个时钟源在开始和结束的间隔时间。但是这种情况只能用于两个时钟源存在明确的关系，在输入频率未知或者两个时钟源没有任何关系的情况下，这种方式是不能采用的。
##### 相关时钟源切换
如果时钟源是相互之间有明确的倍数关系，避免毛刺的电路可以参见图二。一个下边沿触发的寄存器插入在选择电路当中，在时钟的下边沿到来的时候寄存选择数据，同时使能选择信号在另一个时钟为低电平的时候。对于输出毛刺的产生提供了绝佳的防护。
低电平下面寄存选择数据保证了在任意一个时钟源是高电平的时候都不会有时钟的切换，从而保证不会把传输了一半的时钟截断（译者注：保证了输出时钟的完整性）。一个时钟选择信号的反馈给另一个时钟的选择信号，保证了在切换时钟的时候，另一个时钟的开始一定要等到现在时钟变成低电平，杜绝了任何的毛刺。
图三用时序图说明了SELECT信号从0变为1的过程，首先在CLK0是下降沿的时候，切断了CLK0的传输（但是，这个时候并没有立即开启CLK1的传输），然后在CLK1也到了下降沿的时候，才会开启CLK1的时钟传输。
在这个传输的过程中，三个时间路径是值得留意的，时钟选择信号到两个或者一个下降沿触发的寄存器，DFF0的输出到DFF1的输入以及DFF1的输出到DFF0的输入。如果这三路中任意一路的变换时刻和目标寄存器的捕获的边沿时刻同时发生，会有很小的几率是的寄存器进入亚稳态，即寄存器的状态介于理想的“1”和理想的“0”之间。
亚稳态可以由时钟选择器和来自另一个寄存器的使能反馈所导致。所以，要求所有寄存器的捕获边沿和时钟源选择信号的变化边沿应该被分别的配置以避免任何的异步的影响。合适的多周期时钟约束以及最小传播延时约束可以比较容易的解决掉这个问题，这也就要求两个时钟的关系是明确已经知道的。

![图三](https://github.com/kangjian888/verilog_everyday/blob/master/day11/3.JPG)

![图四](https://github.com/kangjian888/verilog_everyday/blob/master/day11/4.JPG)

##### 容错性
在芯片初始化的阶段，DFF0和DFF1的输出均被设置为“0”，所以两个时钟都没有输出。在两个寄存器的初值都为“0”的情况下，容错性构建于时钟选择。
如果在起始时刻有一个时钟发生故障不能工作。如果帮助故障时钟的寄存器的起始状态为“1”，这将会阻止下一个时钟到来的时候对于另一个时钟的选择，而且这个寄存器由于驱动时钟的故障导致其状态不能发生变化。如果起始状态两个寄存器都处于“0”的状态，即使一个时钟发生故障，另一个完好的时钟仍然可以传到输出。（这里的结论就是我们寄存器的初始状态应该设置为“0”而不是“1”）。
##### 不相关时钟的去毛刺技术
前面的技术可以用于对于两个时钟源有明确的倍数的关系，这样的情况下，使用者可以避免两个时钟域中的异步的影响，在上述的理论中，并没有方法来处理异步信号之间的关系。
这就衍生出了添加了同步机制来避免由于异步信号导致亚稳态产生的时钟切换电路。异步信号的来源可能是任意一路选择信号或者跨时钟域的反馈信号，当两个时钟源没有任何明确的关系，这种异步的问题就会产生。
如图五所示，上升沿出发的寄存器被添加在选择路径当中来避免亚稳态的产生。在每一个选择路径中添加的上升沿出发的寄存器，加上已经有的下降沿触发的寄存器，有效的避免了由于异步的位选信号以及不同时钟域的反馈信号所导致的亚稳态的产生。

![图五](https://github.com/kangjian888/verilog_everyday/blob/master/day11/5.JPG)

![图六](https://github.com/kangjian888/verilog_everyday/blob/master/day11/6.JPG)

##### 结论
这篇文章介绍了通过略微增加一些资源，通过使用恰当的设计技术来避免时钟切换电路产生的毛刺对于整个电路的危害。这个技术是完全可以扩展并且可以扩展到多个时钟的相互切换。对于多个时钟源的切换，每个时钟源的选择信号将被来自其他所有时钟源选择信号的反馈信号所使能。
关于多路时钟的切换，可以参考:

[2×1 and Nx1 Glitch Free Clock Switching](https://www.valpont.com/2x1-and-nx1-glitch-free-clock-switching/pst/)