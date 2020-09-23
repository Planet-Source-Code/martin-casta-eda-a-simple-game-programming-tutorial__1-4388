Declare Function BITBLT Lib "GDI" (ByVal HDESTDC As Integer, ByVal X As Integer, ByVal Y As Integer, ByVal WIDTHX As Integer, ByVal HEIGHTX As Integer, ByVal HSRCDC As Integer, ByVal XSRC As Integer, ByVal YSRC As Integer, ByVal DWORP As Long) As Integer
Global Const SRCCOPY = &HCC0020
Global Const SRCAND = &H8800C6
Global Const SRCPAINT = &HEE0086

Global XPLANE As Integer
Global YPLANE As Integer
Global XENEMY As Integer
Global YENEMY As Integer
Global XBULLET As Integer
Global YBULLET As Integer
Global FIRESW As Integer

