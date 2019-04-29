#### Q1
bit 二进制表示的每一位0或1，计算机系统中的最小单位。
byte 8个bits形成一个byte
word 4个byte形成一个word，即32个bits为一个word
dword double word，两个word形成一个dword
qword quadword，四个word形成一个qword

#### Q2
原码：数字的最高位表示数字符号，其余位的表示数字的绝对值。
反码：正数的表示和原码相同，负数符号位保持不变，其余位取反
补码：正数的表示和原码相同，负数在反码基础加1
如果有n位，
原码范围：2^（n-1）-1～-2^（n-1）-1
反码范围：2^（n-1）-1～-2^（n-1）-1
补码范围：2^（n-1）-1～-2^（n-1）
反码和补码的出现，是为了使用加法来统一减法。

#### Q3
 十进制转换为二进制
利用补码
(127)10   =(0111 1111)2
(-127)10 =(1000 0001)2
(127.375)10 = (0111 1111. 011)2
(-127.375)10 =(1000 0000. 101)2

#### Q4
```
// =============================================================================
// Filename: 4.22_verilog_BCD_encoder.v
// Author: KANG, Jian
// Email: jkangac@connect.ust.hk
// Affiliation: Hong Kong University of Science and Technology
// Description:
// -----------------------------------------------------------------------------
`timescale 1 ns / 1 ps
module BCD_encoder(
	input [3:0] in,
	output [9:0] out
		
);

always @ (*)
    begin
        case (in) 
            4'd0:
                begin
                    out = 10'b00_0000_0001;
                end
             4'd1:
                begin
                    out = 10'b00_0000_0010;
                end
             4'd2:
                begin
                    out = 10'b00_0000_0100;
                end  
            4'd3:
                begin
                    out = 10'b00_0000_1000;
                end
             4'd4:
                begin
                    out = 10'b00_0001_0000;
                end
             4'd5:
                begin
                    out = 10'b00_0010_0000;
                end 
             4'd6:
                begin
                    out = 10'b00_0100_0000;
                end
             4'd7:
                begin
                    out = 10'b00_1000_0000;
                end
             4'd8:
                begin
                    out = 10'b01_0000_0000;
                end
             4'd9:
                begin
                    out = 10'b10_0000_0000;
                end                                                                          
            default:
                begin
                    out = 10'b00_0000_0000;                    
                end
        endcase
    end
endmodule
```
![原理图](https://github.com/kangjian888/verilog_everyday/blob/master/day1/BCD_encoder_schematic.png)
