VERSION 2.00
Begin Form Form1 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FF0000&
   BorderStyle     =   3  'Fixed Double
   Caption         =   "VB Game Programming Tutorial"
   Height          =   4425
   Left            =   1035
   LinkTopic       =   "Form1"
   Picture         =   GAME.FRX:0000
   ScaleHeight     =   268
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   491
   Top             =   1140
   Width           =   7485
   Begin Timer Timer1 
      Interval        =   1
      Left            =   0
      Top             =   0
   End
   Begin PictureBox Picture8 
      AutoRedraw      =   -1  'True
      Height          =   855
      Left            =   4920
      Picture         =   GAME.FRX:7538A
      ScaleHeight     =   55
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   55
      TabIndex        =   7
      Top             =   2040
      Visible         =   0   'False
      Width           =   855
   End
   Begin PictureBox Picture7 
      AutoRedraw      =   -1  'True
      Height          =   855
      Left            =   3840
      Picture         =   GAME.FRX:75A08
      ScaleHeight     =   55
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   55
      TabIndex        =   6
      Top             =   2040
      Visible         =   0   'False
      Width           =   855
   End
   Begin PictureBox Picture6 
      AutoRedraw      =   -1  'True
      Height          =   855
      Left            =   2760
      Picture         =   GAME.FRX:76086
      ScaleHeight     =   55
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   55
      TabIndex        =   5
      Top             =   2040
      Visible         =   0   'False
      Width           =   855
   End
   Begin PictureBox Picture5 
      AutoRedraw      =   -1  'True
      Height          =   855
      Left            =   1680
      Picture         =   GAME.FRX:76704
      ScaleHeight     =   55
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   55
      TabIndex        =   4
      Top             =   2040
      Visible         =   0   'False
      Width           =   855
   End
   Begin PictureBox Picture4 
      AutoRedraw      =   -1  'True
      Height          =   855
      Left            =   4920
      Picture         =   GAME.FRX:76D82
      ScaleHeight     =   55
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   55
      TabIndex        =   3
      Top             =   960
      Visible         =   0   'False
      Width           =   855
   End
   Begin PictureBox Picture3 
      AutoRedraw      =   -1  'True
      Height          =   855
      Left            =   3840
      Picture         =   GAME.FRX:77400
      ScaleHeight     =   55
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   55
      TabIndex        =   2
      Top             =   960
      Visible         =   0   'False
      Width           =   855
   End
   Begin PictureBox Picture2 
      AutoRedraw      =   -1  'True
      Height          =   855
      Left            =   2760
      Picture         =   GAME.FRX:77A7E
      ScaleHeight     =   55
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   55
      TabIndex        =   1
      Top             =   960
      Visible         =   0   'False
      Width           =   855
   End
   Begin PictureBox Picture1 
      AutoRedraw      =   -1  'True
      Height          =   855
      Left            =   1680
      Picture         =   GAME.FRX:780FC
      ScaleHeight     =   55
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   55
      TabIndex        =   0
      Top             =   960
      Visible         =   0   'False
      Width           =   855
   End
End

Sub BULLET ()
     Dim SUCCESS As Integer
     YBULLET = YBULLET - 30
     If YBULLET < 0 Then FIRESW = 0
     SUCCESS = BITBLT(FORM1.hDC, XBULLET, YBULLET, PICTURE7.ScaleWidth, PICTURE7.ScaleHeight, PICTURE7.hDC, 0, 0, SRCAND)
     SUCCESS = BITBLT(FORM1.hDC, XBULLET, YBULLET, PICTURE8.ScaleWidth, PICTURE8.ScaleHeight, PICTURE8.hDC, 0, 0, SRCPAINT)
End Sub

Sub COLLIDEDETECT ()
     Dim SUCCESS As Integer
     Dim DELAY As Integer
     Dim COLLIDESW As Integer
     COLLIDESW = COLLIDE(XPLANE, YPLANE, XENEMY, YENEMY, 50)
     If COLLIDESW = 1 Then
          SUCCESS = BITBLT(FORM1.hDC, XPLANE, YPLANE, PICTURE5.ScaleWidth, PICTURE5.ScaleHeight, PICTURE5.hDC, 0, 0, SRCAND)
          SUCCESS = BITBLT(FORM1.hDC, XPLANE, YPLANE, PICTURE6.ScaleWidth, PICTURE6.ScaleHeight, PICTURE6.hDC, 0, 0, SRCPAINT)
          SUCCESS = BITBLT(FORM1.hDC, XENEMY, YENEMY, PICTURE5.ScaleWidth, PICTURE5.ScaleHeight, PICTURE5.hDC, 0, 0, SRCAND)
          SUCCESS = BITBLT(FORM1.hDC, XENEMY, YENEMY, PICTURE6.ScaleWidth, PICTURE6.ScaleHeight, PICTURE6.hDC, 0, 0, SRCPAINT)
          For DELAY = 1 To 1000
          Next DELAY
          YENEMY = 230
     End If
     COLLIDESW = COLLIDE(XBULLET, YBULLET, XENEMY, YENEMY, 50)
     If COLLIDESW = 1 And FIRESW = 1 Then
          SUCCESS = BITBLT(FORM1.hDC, XENEMY, YENEMY, PICTURE5.ScaleWidth, PICTURE5.ScaleHeight, PICTURE5.hDC, 0, 0, SRCAND)
          SUCCESS = BITBLT(FORM1.hDC, XENEMY, YENEMY, PICTURE6.ScaleWidth, PICTURE6.ScaleHeight, PICTURE6.hDC, 0, 0, SRCPAINT)
          For DELAY = 1 To 1000
          Next DELAY
          YENEMY = 230
          FIRESW = 0
     End If
End Sub

Sub ENEMY ()
     Dim SUCCESS As Integer
     YENEMY = YENEMY + 10
     If YENEMY > 230 Then
          XENEMY = (Rnd * 450)
          YENEMY = 0
     End If
     SUCCESS = BITBLT(FORM1.hDC, XENEMY, YENEMY, PICTURE3.ScaleWidth, PICTURE3.ScaleHeight, PICTURE3.hDC, 0, 0, SRCAND)
     SUCCESS = BITBLT(FORM1.hDC, XENEMY, YENEMY, PICTURE4.ScaleWidth, PICTURE4.ScaleHeight, PICTURE4.hDC, 0, 0, SRCPAINT)
End Sub

Sub Form_Load ()
     Randomize Timer
End Sub

Sub Form_MouseDown (Button As Integer, Shift As Integer, X As Single, Y As Single)
     FIRESW = 1
     XBULLET = XPLANE
     YBULLET = YPLANE
End Sub

Sub Form_MouseMove (Button As Integer, Shift As Integer, X As Single, Y As Single)
     XPLANE = X - 25
     YPLANE = Y - 25
End Sub

Sub PLANE ()
     Dim SUCCESS As Integer
     SUCCESS = BITBLT(FORM1.hDC, XPLANE, YPLANE, PICTURE1.ScaleWidth, PICTURE1.ScaleHeight, PICTURE1.hDC, 0, 0, SRCAND)
     SUCCESS = BITBLT(FORM1.hDC, XPLANE, YPLANE, PICTURE2.ScaleWidth, PICTURE2.ScaleHeight, PICTURE2.hDC, 0, 0, SRCPAINT)
End Sub

Sub Timer1_Timer ()
     Cls
     If FIRESW = 1 Then Call BULLET
     Call PLANE
     Call ENEMY
     Call COLLIDEDETECT
End Sub

