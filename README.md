# Simple-ALU

RunALU.v : 1bit之ALU單元，根據signalIn的不同來做不同的運算並設定output。

RunLastALU.v : 為最後一個bit的ALU單元，功能等同於RunALU.v，並在最後設定Output Set之值。

ALU.v : 32bitALU，內有31個RunALU和1個RunLastALU，根據指令做運算後將結果存在32bit之暫存器內，而若是resst訊號為1時就將暫存器內的bit都歸零。

FA.v : 加法器，負責處理ALU內所需運行之加減法運算。

Divider.v : 除法器，為 32-bits 無號數除法 Sequential Restoring Division Hardware，負責處理ALU內所需運行之除法運算。

HiLo.v : HiLo暫存器，給乘除法相關指令使用的暫存器，內有兩個32bit的暫存器hi和lo，其中hi用於儲存餘數，lo用於儲存商數。

Shifter.v : 32-bits Barrel Shifter，用於完成邏輯左移運算。

MUX.v : 多工器，負責判斷指令相應的運算結果。

ALU_Control.v : 根據輸入的 6-bit 控制訊號，決定該完成哪一種運算。控制訊號與功能
對應如下：
 Signal : 6-bit Value (Decimal)
 --------------------------
 AND : 36
 OR : 37
 ADD : 32
 SUB : 34
 SLT : 42
 SLL : 00
 DIVU : 27
 --------------------------

TotalALU.v : 將ALU、Shifter、Divider、HiLo、MUX整合為一個環境，用於整體功能測試。
