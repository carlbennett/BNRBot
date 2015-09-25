#tag Class
Protected Class MemClass
Implements Readable, Writeable
	#tag Method, Flags = &h0
		Sub ClearReadBuffer()
		  
		  Me.mReadBuffer = ""
		  Me.mReadPosition = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearWriteBuffer()
		  
		  Me.mWriteBuffer = ""
		  Me.mWritePosition = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		  '// Reader
		  Me.mReadBuffer = ""
		  Me.mReadPosition = 0
		  Me.AutoTrimReadBuffer = False
		  
		  '// Writer
		  Me.mWriteBuffer = ""
		  Me.mWritePosition = 0
		  
		  '// Endianness
		  Me.LittleEndian = TargetLittleEndian
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(LittleEndian As Boolean)
		  
		  '// Reader
		  Me.mReadBuffer = ""
		  Me.mReadPosition = 0
		  
		  '// Writer
		  Me.mWriteBuffer = ""
		  Me.mWritePosition = 0
		  
		  '// Endianness
		  Me.LittleEndian = LittleEndian
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(LittleEndian As Boolean, TrimReadBuffer As Boolean)
		  
		  '// Reader
		  Me.mReadBuffer = ""
		  Me.mReadPosition = 0
		  Me.AutoTrimReadBuffer = TrimReadBuffer
		  
		  '// Writer
		  Me.mWriteBuffer = ""
		  Me.mWritePosition = 0
		  
		  '// Endianness
		  Me.LittleEndian = LittleEndian
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(InitialData As MemoryBlock)
		  
		  '// Reader
		  If InitialData <> Nil And InitialData.Size <> InitialData.SizeUnknown Then
		    Me.mReadBuffer = InitialData.StringValue(0, InitialData.Size)
		  Else
		    Me.mReadBuffer = ""
		  End If
		  Me.mReadPosition = 0
		  
		  '// Writer
		  Me.mWriteBuffer = ""
		  Me.mWritePosition = 0
		  
		  '// Endianness
		  Me.LittleEndian = TargetLittleEndian
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(InitialData As MemoryBlock, LittleEndian As Boolean)
		  
		  '// Reader
		  If InitialData <> Nil And InitialData.Size <> InitialData.SizeUnknown Then
		    Me.mReadBuffer = InitialData.StringValue(0, InitialData.Size)
		  Else
		    Me.mReadBuffer = ""
		  End If
		  Me.mReadPosition = 0
		  
		  '// Writer
		  Me.mWriteBuffer = ""
		  Me.mWritePosition = 0
		  
		  '// Endianness
		  Me.LittleEndian = LittleEndian
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(InitialData As MemoryBlock, LittleEndian As Boolean, TrimReadBuffer As Boolean)
		  
		  '// Reader
		  If InitialData <> Nil And InitialData.Size <> InitialData.SizeUnknown Then
		    Me.mReadBuffer = InitialData.StringValue(0, InitialData.Size)
		  Else
		    Me.mReadBuffer = ""
		  End If
		  Me.mReadPosition = 0
		  Me.AutoTrimReadBuffer = TrimReadBuffer
		  
		  '// Writer
		  Me.mWriteBuffer = ""
		  Me.mWritePosition = 0
		  
		  '// Endianness
		  Me.LittleEndian = LittleEndian
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(InitialData As String)
		  
		  '// Reader
		  Me.mReadBuffer = InitialData
		  Me.mReadPosition = 0
		  
		  '// Writer
		  Me.mWriteBuffer = ""
		  Me.mWritePosition = 0
		  
		  '// Endianness
		  Me.LittleEndian = TargetLittleEndian
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(InitialData As String, LittleEndian As Boolean)
		  
		  '// Reader
		  Me.mReadBuffer = InitialData
		  Me.mReadPosition = 0
		  
		  '// Writer
		  Me.mWriteBuffer = ""
		  Me.mWritePosition = 0
		  
		  '// Endianness
		  Me.LittleEndian = LittleEndian
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(InitialData As String, LittleEndian As Boolean, TrimReadBuffer As Boolean)
		  
		  '// Reader
		  Me.mReadBuffer = InitialData
		  Me.mReadPosition = 0
		  Me.AutoTrimReadBuffer = TrimReadBuffer
		  
		  '// Writer
		  Me.mWriteBuffer = ""
		  Me.mWritePosition = 0
		  
		  '// Endianness
		  Me.LittleEndian = LittleEndian
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EOF() As Boolean
		  // Part of the Readable interface.
		  
		  Return (Me.mReadPosition >= LenB(Me.mReadBuffer))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Flush()
		  // Part of the Writeable interface.
		  
		  Me.mWriteBuffer = ""
		  Me.mWritePosition = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FromBin(Source As String, Delimiter As String) As String
		  
		  Dim S, B As String, i As UInt64 = 1
		  B = ReplaceAll(Source, Delimiter, "")
		  While i <= Len(B)
		    S = S + ChrB(Val("&B" + Mid(B, i, 8)))
		    i = i + 8
		  Wend
		  Return S
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FromHex(Source As String, Delimiter As String) As String
		  
		  Dim S, B As String, i As UInt64 = 1
		  B = ReplaceAll(Source, Delimiter, "")
		  While i <= Len(B)
		    S = S + ChrB(Val("&H" + Mid(B, i, 2)))
		    i = i + 2
		  Wend
		  Return S
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function FromOct(Source As String, Delimiter As String) As String
		  
		  Dim S, B As String, i As UInt64 = 1
		  B = ReplaceAll(Source, Delimiter, "")
		  While i <= Len(B)
		    S = S + ChrB(Val("&O" + Mid(B, i, 3)))
		    i = i + 3
		  Wend
		  Return S
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReadBuffer(EraseBuffer As Boolean = True) As String
		  
		  Dim Buffer As String = Me.mReadBuffer
		  If EraseBuffer = True Then Me.mReadBuffer = ""
		  Return Buffer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetWriteBuffer(EraseBuffer As Boolean = True) As String
		  
		  Dim Buffer As String = Me.mWriteBuffer
		  If EraseBuffer = True Then Me.mWriteBuffer = ""
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function HexPrefix(Value As UInt64, Prefix As String = "", FixedLength As Byte = 2) As String
		  
		  Dim Buffer As String
		  
		  If Value >= &H0000000000000000 And Value <= &H00000000000000FF Then
		    Buffer = Right("00" + Hex(Value), 2)
		  ElseIf Value >= &H0000000000000100 And Value <= &H000000000000FFFF Then
		    Buffer = Right("0000" + Hex(Value), 4)
		  ElseIf Value >= &H0000000000010000 And Value <= &H00000000FFFFFFFF Then
		    Buffer = Right("00000000" + Hex(Value), 8)
		  ElseIf Value >= &H0000000100000000 And Value <= &HFFFFFFFFFFFFFFFF Then
		    Buffer = Right("0000000000000000" + Hex(Value), 16)
		  Else
		    Buffer = Hex(Value)
		  End If
		  
		  While Len(Buffer) < FixedLength
		    Buffer = "0" + Buffer
		  Wend
		  
		  Return Prefix + Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Add(RHS As MemClass)
		  
		  '// RHS = Right-hand side (MemClass = (Self + RHS))
		  
		  If RHS = Nil Then Return
		  Self.WriteRaw RHS.GetWriteBuffer(False)
		  Self.mReadBuffer = Self.mReadBuffer + RHS.GetReadBuffer(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(Count As Integer, encoding As TextEncoding = Nil) As String
		  // Part of the Readable interface.
		  
		  If encoding <> Nil Then
		    Dim EncodingNotNilException As New RuntimeException
		    EncodingNotNilException.Message = "Local variable 'encoding' was set " _
		    + "but MemClass.Read() requires it to be set as Nil."
		    Raise EncodingNotNilException
		  End If
		  
		  Dim Buffer As String = MidB(Me.mReadBuffer, Me.mReadPosition + 1, Count)
		  Me.mReadPosition = Me.mReadPosition + Count
		  If Me.AutoTrimReadBuffer = True Then Me.TrimReadBuffer()
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadBYTE() As Byte
		  
		  Dim Buffer As Byte = AscB(MidB(Me.mReadBuffer, Me.mReadPosition + 1, 1))
		  Me.mReadPosition = Me.mReadPosition + 1
		  If Me.AutoTrimReadBuffer = True Then Me.TrimReadBuffer()
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ReadBYTE(Source As String, Index As UInt64) As Byte
		  
		  Return AscB(MidB(Source, Index, 1))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadCString() As String
		  
		  Dim Buffer As String
		  
		  If InStrB(Me.mReadPosition + 1, Me.mReadBuffer, ChrB(0)) <= 0 Then
		    
		    '// There is no null-terminator in the Source after or at this Index.
		    Buffer = MidB(Me.mReadBuffer, Me.mReadPosition + 1, LenB(Me.mReadBuffer) - Me.mReadPosition + 1)
		    Me.mReadPosition = LenB(Me.mReadBuffer)
		    
		  Else
		    
		    '// There is a null-terminator in the Source after or at this Index.
		    Buffer = MidB(Me.mReadBuffer, Me.mReadPosition + 1, InStrB(Me.mReadPosition + 1, Me.mReadBuffer, ChrB(0)) - Me.mReadPosition - 1)
		    Me.mReadPosition = InStrB(Me.mReadPosition + 1, Me.mReadBuffer, ChrB(0))
		    
		  End If
		  
		  If Me.AutoTrimReadBuffer = True Then Me.TrimReadBuffer()
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ReadCString(Source As String, Index As UInt64) As String
		  
		  If InStrB(Index, Source, ChrB(0)) <= 0 Then
		    
		    '// There is no null-terminator in the Source after or at this Index.
		    Return MidB(Source, Index, LenB(Source) - Index)
		    
		  Else
		    
		    '// There is a null-terminator in the Source after or at this Index.
		    Return MidB(Source, Index, InStrB(Index, Source, ChrB(0)) - Index)
		    
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadDWORD() As UInt32
		  
		  Dim Buffer As String = MidB(Me.mReadBuffer, Me.mReadPosition + 1, 4)
		  Me.mReadPosition = Me.mReadPosition + 4
		  If Me.AutoTrimReadBuffer = True Then Me.TrimReadBuffer()
		  
		  If LittleEndian = True Then
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 1, 1)), _
		    AscB(MidB(Buffer, 2, 1)) * (2^8), _
		    AscB(MidB(Buffer, 3, 1)) * (2^16), _
		    AscB(MidB(Buffer, 4, 1)) * (2^24))
		  Else
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 4, 1)), _
		    AscB(MidB(Buffer, 3, 1)) * (2^8), _
		    AscB(MidB(Buffer, 2, 1)) * (2^16), _
		    AscB(MidB(Buffer, 1, 1)) * (2^24))
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ReadDWORD(Source As String, Index As UInt64) As UInt32
		  
		  Dim Buffer As String = MidB(Source, Index, 4)
		  
		  #If TargetLittleEndian = True Then
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 1, 1)), _
		    AscB(MidB(Buffer, 2, 1)) * (2^8), _
		    AscB(MidB(Buffer, 3, 1)) * (2^16), _
		    AscB(MidB(Buffer, 4, 1)) * (2^24))
		  #Else
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 4, 1)), _
		    AscB(MidB(Buffer, 3, 1)) * (2^8), _
		    AscB(MidB(Buffer, 2, 1)) * (2^16), _
		    AscB(MidB(Buffer, 1, 1)) * (2^24))
		  #EndIf
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ReadDWORD(Source As String, Index As UInt64, LittleEndian As Boolean) As UInt32
		  
		  Dim Buffer As String = MidB(Source, Index, 4)
		  
		  If LittleEndian = True Then
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 1, 1)), _
		    AscB(MidB(Buffer, 2, 1)) * (2^8), _
		    AscB(MidB(Buffer, 3, 1)) * (2^16), _
		    AscB(MidB(Buffer, 4, 1)) * (2^24))
		  Else
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 4, 1)), _
		    AscB(MidB(Buffer, 3, 1)) * (2^8), _
		    AscB(MidB(Buffer, 2, 1)) * (2^16), _
		    AscB(MidB(Buffer, 1, 1)) * (2^24))
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadError() As Boolean
		  // Part of the Readable interface.
		  
		  Return (Me.mReadPosition >= LenB(Me.mReadBuffer) Or Me.mReadPosition < 0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ReadMemory(Source As String, Index As UInt64, Length As UInt64) As MemoryBlock
		  
		  Dim strBuffer As String = MidB(Source, Index, Length)
		  
		  Dim Buffer As New MemoryBlock(Length)
		  Buffer.LittleEndian = TargetLittleEndian
		  Buffer.StringValue(0, LenB(strBuffer)) = strBuffer
		  
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ReadMemory(Source As String, Index As UInt64, Length As UInt64, LittleEndian As Boolean) As MemoryBlock
		  
		  Dim strBuffer As String = MidB(Source, Index, Length)
		  
		  Dim Buffer As New MemoryBlock(Length)
		  Buffer.LittleEndian = LittleEndian
		  Buffer.StringValue(0, LenB(strBuffer)) = strBuffer
		  
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadMemory(Length As UInt64) As MemoryBlock
		  
		  Dim strBuffer As String = MidB(Me.mReadBuffer, Me.mReadPosition + 1, Length)
		  Me.mReadPosition = Me.mReadPosition + Length
		  If Me.AutoTrimReadBuffer = True Then Me.TrimReadBuffer()
		  
		  Dim Buffer As New MemoryBlock(Length)
		  Buffer.LittleEndian = Me.LittleEndian
		  Buffer.StringValue(0, LenB(strBuffer)) = strBuffer
		  
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadPString() As String
		  
		  Dim Buffer As String = MidB(Me.mReadBuffer, Me.mReadPosition + 2, _
		  AscB(MidB(Me.mReadBuffer, Me.mReadPosition + 1, 1)))
		  Me.mReadPosition = Me.mReadPosition + 1 + AscB(MidB(Me.mReadBuffer, Me.mReadPosition + 1, 1))
		  If Me.AutoTrimReadBuffer = True Then Me.TrimReadBuffer()
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ReadPString(Source As String, Index As UInt64) As String
		  
		  Return MidB(Source, Index + 1, AscB(MidB(Source, Index, 1)))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadQWORD() As UInt64
		  
		  Dim Buffer As String = MidB(Me.mReadBuffer, Me.mReadPosition + 1, 8)
		  Me.mReadPosition = Me.mReadPosition + 8
		  If Me.AutoTrimReadBuffer = True Then Me.TrimReadBuffer()
		  
		  If LittleEndian = True Then
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 1, 1)), _
		    AscB(MidB(Buffer, 2, 1)) * (2^8), _
		    AscB(MidB(Buffer, 3, 1)) * (2^16), _
		    AscB(MidB(Buffer, 4, 1)) * (2^24), _
		    AscB(MidB(Buffer, 5, 1)) * (2^32), _
		    AscB(MidB(Buffer, 6, 1)) * (2^40), _
		    AscB(MidB(Buffer, 7, 1)) * (2^48), _
		    AscB(MidB(Buffer, 8, 1)) * (2^56))
		  Else
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 8, 1)), _
		    AscB(MidB(Buffer, 7, 1)) * (2^8), _
		    AscB(MidB(Buffer, 6, 1)) * (2^16), _
		    AscB(MidB(Buffer, 5, 1)) * (2^24), _
		    AscB(MidB(Buffer, 4, 1)) * (2^32), _
		    AscB(MidB(Buffer, 3, 1)) * (2^40), _
		    AscB(MidB(Buffer, 2, 1)) * (2^48), _
		    AscB(MidB(Buffer, 1, 1)) * (2^56))
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ReadQWORD(Source As String, Index As UInt64) As UInt64
		  
		  Dim Buffer As String = MidB(Source, Index, 8)
		  
		  #If TargetLittleEndian = True Then
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 1, 1)), _
		    AscB(MidB(Buffer, 2, 1)) * (2^8), _
		    AscB(MidB(Buffer, 3, 1)) * (2^16), _
		    AscB(MidB(Buffer, 4, 1)) * (2^24), _
		    AscB(MidB(Buffer, 5, 1)) * (2^32), _
		    AscB(MidB(Buffer, 6, 1)) * (2^40), _
		    AscB(MidB(Buffer, 7, 1)) * (2^48), _
		    AscB(MidB(Buffer, 8, 1)) * (2^56))
		  #Else
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 8, 1)), _
		    AscB(MidB(Buffer, 7, 1)) * (2^8), _
		    AscB(MidB(Buffer, 6, 1)) * (2^16), _
		    AscB(MidB(Buffer, 5, 1)) * (2^24), _
		    AscB(MidB(Buffer, 4, 1)) * (2^32), _
		    AscB(MidB(Buffer, 3, 1)) * (2^40), _
		    AscB(MidB(Buffer, 2, 1)) * (2^48), _
		    AscB(MidB(Buffer, 1, 1)) * (2^56))
		  #EndIf
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ReadQWORD(Source As String, Index As UInt64, LittleEndian As Boolean) As UInt64
		  
		  Dim Buffer As String = MidB(Source, Index, 8)
		  
		  If LittleEndian = True Then
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 1, 1)), _
		    AscB(MidB(Buffer, 2, 1)) * (2^8), _
		    AscB(MidB(Buffer, 3, 1)) * (2^16), _
		    AscB(MidB(Buffer, 4, 1)) * (2^24), _
		    AscB(MidB(Buffer, 5, 1)) * (2^32), _
		    AscB(MidB(Buffer, 6, 1)) * (2^40), _
		    AscB(MidB(Buffer, 7, 1)) * (2^48), _
		    AscB(MidB(Buffer, 8, 1)) * (2^56))
		  Else
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 8, 1)), _
		    AscB(MidB(Buffer, 7, 1)) * (2^8), _
		    AscB(MidB(Buffer, 6, 1)) * (2^16), _
		    AscB(MidB(Buffer, 5, 1)) * (2^24), _
		    AscB(MidB(Buffer, 4, 1)) * (2^32), _
		    AscB(MidB(Buffer, 3, 1)) * (2^40), _
		    AscB(MidB(Buffer, 2, 1)) * (2^48), _
		    AscB(MidB(Buffer, 1, 1)) * (2^56))
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadRaw(Count As Integer) As String
		  
		  Dim Buffer As String = MidB(Me.mReadBuffer, Me.mReadPosition + 1, Count)
		  Me.mReadPosition = Me.mReadPosition + Count
		  If Me.AutoTrimReadBuffer = True Then Me.TrimReadBuffer()
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ReadRaw(Source As String, Index As UInt64, Length As UInt64) As String
		  
		  Return MidB(Source, Index, Length)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadRemaining() As String
		  
		  Dim Buffer As String = MidB(Me.mReadBuffer, Me.mReadPosition + 1, LenB(Me.mReadBuffer) - Me.mReadPosition + 2)
		  Me.mReadPosition = LenB(Me.mReadBuffer)
		  If Me.AutoTrimReadBuffer = True Then Me.TrimReadBuffer()
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ReadRemaining(Source As String, Index As UInt64) As String
		  
		  Return MidB(Source, Index, LenB(Source) - Index + 1)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadWORD() As UInt16
		  
		  Dim Buffer As String = MidB(Me.mReadBuffer, Me.mReadPosition + 1, 2)
		  Me.mReadPosition = Me.mReadPosition + 2
		  If Me.AutoTrimReadBuffer = True Then Me.TrimReadBuffer()
		  
		  If LittleEndian = True Then
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 1, 1)), _
		    AscB(MidB(Buffer, 2, 1)) * (2^8))
		  Else
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 2, 1)), _
		    AscB(MidB(Buffer, 1, 1)) * (2^8))
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ReadWORD(Source As String, Index As UInt64) As UInt16
		  
		  Dim Buffer As String = MidB(Source, Index, 2)
		  
		  #If TargetLittleEndian = True Then
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 1, 1)), _
		    AscB(MidB(Buffer, 2, 1)) * (2^8))
		  #Else
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 2, 1)), _
		    AscB(MidB(Buffer, 1, 1)) * (2^8))
		  #EndIf
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ReadWORD(Source As String, Index As UInt64, LittleEndian As Boolean) As UInt16
		  
		  Dim Buffer As String = MidB(Source, Index, 2)
		  
		  If LittleEndian = True Then
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 1, 1)), _
		    AscB(MidB(Buffer, 2, 1)) * (2^8))
		  Else
		    Return Bitwise.BitOr(AscB(MidB(Buffer, 2, 1)), _
		    AscB(MidB(Buffer, 1, 1)) * (2^8))
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetReadBuffer(Data As String, AppendInstead As Boolean = False)
		  
		  If AppendInstead = True Then
		    Me.mReadBuffer = Me.mReadBuffer + Data
		  Else
		    Me.mReadPosition = 0
		    Me.mReadBuffer = Data
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetWriteBuffer(Data As String, AppendInstead As Boolean = False)
		  
		  If AppendInstead = True Then
		    Me.mWriteBuffer = Me.mWriteBuffer + Data
		  Else
		    Me.mWriteBuffer = Data
		  End If
		  Me.mWritePosition = LenB(Data)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ToBin(Source As String, Delimiter As String) As String
		  
		  Dim S As String, i As UInt64 = 1
		  While i <= LenB(Source)
		    If Len(S) > 0 Then S = S + Delimiter
		    S = S + Right("00000000" + Bin(AscB(MidB(Source, i, 1))), 2)
		    i = i + 1
		  Wend
		  Return S
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ToHex(Source As String, Delimiter As String) As String
		  
		  Dim S As String, i As UInt64 = 1
		  While i <= LenB(Source)
		    If Len(S) > 0 Then S = S + Delimiter
		    S = S + Right("00" + Hex(AscB(MidB(Source, i, 1))), 2)
		    i = i + 1
		  Wend
		  Return S
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function ToOct(Source As String, Delimiter As String) As String
		  
		  Dim S As String, i As UInt64 = 1
		  While i <= LenB(Source)
		    If Len(S) > 0 Then S = S + Delimiter
		    S = S + Right("000" + Oct(AscB(MidB(Source, i, 1))), 3)
		    i = i + 1
		  Wend
		  Return S
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TrimReadBuffer()
		  
		  '// Trims the read buffer so that there is no data behind the ReadPosition value.
		  '// This is mostly used in cases such as a push/pull buffer, or where the read
		  '//   buffer is appended to and is later read from but it is never read as a whole.
		  '//
		  '// This function gets called during every Read* function if AutoTrimReadBuffer is
		  '//   set to True.
		  
		  Me.mReadBuffer = MidB(Me.mReadBuffer, Me.mReadPosition + 1)
		  Me.mReadPosition = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(text As String)
		  // Part of the Writeable interface.
		  
		  Me.WriteRaw text
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub WriteBYTE(ByRef Source As String, Value As Byte)
		  
		  Source = Source + ChrB(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteBYTE(Source As Byte)
		  
		  Me.WriteRaw ChrB(Source)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function WriteBYTE(Value As Byte) As String
		  
		  Dim Buffer As String
		  MemClass.WriteBYTE Buffer, Value
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub WriteCString(ByRef Source As String, Value As String)
		  
		  Source = Source + Value + ChrB(0)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteCString(Source As String)
		  
		  Me.WriteRaw Source + ChrB(0)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function WriteCString(Value As String) As String
		  
		  Dim Buffer As String
		  MemClass.WriteCString Buffer, Value
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub WriteDWORD(ByRef Source As String, Value As UInt32)
		  
		  #If TargetLittleEndian = True Then
		    Source = Source + ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H000000FF), 0)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H0000FF00), 8)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H00FF0000), 16)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &HFF000000), 24))
		  #Else
		    Source = Source + ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &HFF000000), 24)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H00FF0000), 16)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H0000FF00), 8)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H000000FF), 0))
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub WriteDWORD(ByRef Source As String, Value As UInt32, LittleEndian As Boolean)
		  
		  If LittleEndian = True Then
		    Source = Source + ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H000000FF), 0)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H0000FF00), 8)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H00FF0000), 16)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &HFF000000), 24))
		  Else
		    Source = Source + ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &HFF000000), 24)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H00FF0000), 16)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H0000FF00), 8)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H000000FF), 0))
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteDWORD(Source As UInt32)
		  
		  If Me.LittleEndian = True Then
		    Me.WriteRaw ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H000000FF), 0)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H0000FF00), 8)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H00FF0000), 16)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &HFF000000), 24))
		  Else
		    Me.WriteRaw ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &HFF000000), 24)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H00FF0000), 16)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H0000FF00), 8)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H000000FF), 0))
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function WriteDWORD(Value As UInt32) As String
		  
		  Return MemClass.WriteDWORD(Value, TargetLittleEndian)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function WriteDWORD(Value As UInt32, LittleEndian As Boolean) As String
		  
		  Dim Buffer As String
		  MemClass.WriteDWORD(Buffer, Value, LittleEndian)
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteError() As Boolean
		  // Part of the Writeable interface.
		  
		  Return (Me.mWritePosition < 0 Or Me.mWritePosition > LenB(Me.mWriteBuffer))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub WriteMemory(ByRef Source As String, Value As MemoryBlock)
		  
		  If Value = Nil Then Return
		  If Value.Size = Value.SizeUnknown Then Return
		  Source = Source + Value.StringValue(0, Value.Size)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteMemory(Source As MemoryBlock)
		  
		  If Source = Nil Then Return
		  If Source.Size = Source.SizeUnknown Then Return
		  Me.WriteRaw Source.StringValue(0, Source.Size)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function WriteMemory(Value As MemoryBlock) As String
		  
		  Dim Buffer As String
		  MemClass.WriteMemory Buffer, Value
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub WritePString(ByRef Source As String, Value As String)
		  
		  '// PString can only go up to 255 bytes in length.
		  Source = Source + ChrB(LenB(LeftB(Value, 255))) + LeftB(Value, 255)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WritePString(Source As String)
		  
		  '// PString can only go up to 255 bytes in length.
		  Me.WriteRaw ChrB(LenB(LeftB(Source, 255))) + LeftB(Source, 255)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function WritePString(Value As String) As String
		  
		  Dim Buffer As String
		  MemClass.WritePString Buffer, Value
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub WriteQWORD(ByRef Source As String, Value As UInt64)
		  
		  MemClass.WriteQWORD(Source, Value, TargetLittleEndian)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub WriteQWORD(ByRef Source As String, Value As UInt64, LittleEndian As Boolean)
		  
		  If LittleEndian = True Then
		    Source = Source + ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H00000000000000FF), 0)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H000000000000FF00), 8)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H0000000000FF0000), 16)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H00000000FF000000), 24)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H000000FF00000000), 32)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H0000FF0000000000), 40)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H00FF000000000000), 48)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &HFF00000000000000), 56))
		  Else
		    Source = Source + ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &HFF00000000000000), 56)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H00FF000000000000), 48)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H0000FF0000000000), 40)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H000000FF00000000), 32)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H00000000FF000000), 24)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H0000000000FF0000), 16)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H000000000000FF00), 8)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H00000000000000FF), 0))
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteQWORD(Source As UInt64)
		  
		  If Me.LittleEndian = True Then
		    Me.WriteRaw ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H00000000000000FF), 0)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H000000000000FF00), 8)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H0000000000FF0000), 16)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H00000000FF000000), 24)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H000000FF00000000), 32)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H0000FF0000000000), 40)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H00FF000000000000), 48)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &HFF00000000000000), 56))
		  Else
		    Me.WriteRaw ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &HFF00000000000000), 56)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H00FF000000000000), 48)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H0000FF0000000000), 40)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H000000FF00000000), 32)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H00000000FF000000), 24)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H0000000000FF0000), 16)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H000000000000FF00), 8)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H00000000000000FF), 0))
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function WriteQWORD(Value As UInt64) As String
		  
		  Return MemCLass.WriteQWORD(Value, TargetLittleEndian)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function WriteQWORD(Value As UInt64, LittleEndian As Boolean) As String
		  
		  Dim Buffer As String
		  MemClass.WriteQWORD(Buffer, Value, LittleEndian)
		  Return Buffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub WriteRaw(ByRef Source As String, Value As String)
		  
		  Source = Source + Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteRaw(Source As String)
		  
		  Me.mWriteBuffer = LeftB(Me.mWriteBuffer, Me.mWritePosition) _
		  + Source + RightB(Me.mWriteBuffer, LenB(Me.mWriteBuffer) - Me.mWritePosition)
		  Me.mWritePosition = Me.mWritePosition + LenB(Source)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function WriteRaw(Value As String) As String
		  
		  Return Value
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub WriteWORD(ByRef Source As String, Value As UInt16)
		  
		  MemClass.WriteWORD(Source, Value, TargetLittleEndian)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Sub WriteWORD(ByRef Source As String, Value As UInt16, LittleEndian As Boolean)
		  
		  If LittleEndian = True Then
		    Source = Source + ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H00FF), 0)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &HFF00), 8))
		  Else
		    Source = Source + ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &HFF00), 8)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Value, &H00FF), 0))
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteWORD(Source As UInt16)
		  
		  If Me.LittleEndian = True Then
		    Me.WriteRaw ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H00FF), 0)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &HFF00), 8))
		  Else
		    Me.WriteRaw ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &HFF00), 8)) + _
		    ChrB(Bitwise.ShiftRight(Bitwise.BitAnd(Source, &H00FF), 0))
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function WriteWORD(Value As UInt16) As String
		  
		  Return MemClass.WriteWORD(Value, TargetLittleEndian)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function WriteWORD(Value As UInt16, LittleEndian As Boolean) As String
		  
		  Dim Buffer As String
		  MemClass.WriteWORD(Buffer, Value, LittleEndian)
		  Return Buffer
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AutoTrimReadBuffer As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LittleEndian As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReadBuffer As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReadPosition As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWriteBuffer As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWritePosition As UInt64
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return LenB(Me.mReadBuffer)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  If LenB(Me.mReadBuffer) > value Then
			    
			    Me.mReadBuffer = LeftB(Me.mReadBuffer, value)
			    
			  Else
			    
			    While LenB(Me.mReadBuffer) < value
			      Me.mReadBuffer = Me.mReadBuffer + ChrB(0)
			    Wend
			    
			  End If
			  
			End Set
		#tag EndSetter
		ReadLength As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mReadPosition
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  If value < 0 Or value >= LenB(Me.mReadBuffer) Then Raise New OutOfBoundsException
			  Me.mReadPosition = value
			  
			End Set
		#tag EndSetter
		ReadPosition As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return LenB(Me.mWriteBuffer)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  If LenB(Me.mWriteBuffer) > value Then
			    
			    Me.mWriteBuffer = LeftB(Me.mWriteBuffer, value)
			    
			  Else
			    
			    While LenB(Me.mWriteBuffer) < value
			      Me.mWriteBuffer = Me.mWriteBuffer + ChrB(0)
			    Wend
			    
			  End If
			  
			End Set
		#tag EndSetter
		WriteLength As UInt64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  Return Me.mWritePosition
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  
			  If value < 0 Or value > LenB(Me.mWriteBuffer) Then Raise New OutOfBoundsException
			  Me.mWritePosition = value
			  
			End Set
		#tag EndSetter
		WritePosition As UInt64
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoTrimReadBuffer"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LittleEndian"
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
