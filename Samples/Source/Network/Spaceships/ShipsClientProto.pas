// File auto-generated by PasNetGenUnit ShipsClientProto;{$I terra.inc}InterfaceUses ShipsOpcodes, SysUtils;Type	ShipsClientProto = Class(NetClient)		Protected			Procedure OnMovementMessage(Const ID:Integer; Const X, Y, Rotation:Single); Virtual; Abstract;			Procedure ReceiveMovementMessage(Msg:NetMessage);		Public			Procedure SendMovementMessage(Const ID:Integer; Const X, Y, Rotation:Single);			Procedure SendDefenseMessage(Const ID:Integer; Const X, Y, Rotation:Single);	End;ImplementationProcedure ShipsClientProto.SendMovementMessage(Const ID:Integer; Const X, Y, Rotation:Single);Var	Msg:NetMessage;Begin	Msg := NetMessage.Create(net_opcode_Ships_Movement);	Msg.WriteInteger(ID);	Msg.WriteSingle(X);	Msg.WriteSingle(Y);	Msg.WriteSingle(Rotation);	Self.SendMessage(Msg);	ReleaseObject(Msg);End;Procedure ShipsClientProto.SendDefenseMessage(Const ID:Integer; Const X, Y, Rotation:Single);Var	Msg:NetMessage;Begin	Msg := NetMessage.Create(net_opcode_Ships_Defense);	Msg.WriteInteger(ID);	Msg.WriteSingle(X);	Msg.WriteSingle(Y);	Msg.WriteSingle(Rotation);	Self.SendMessage(Msg);	ReleaseObject(Msg);End;Procedure ReceiveMovementMessage(Msg:NetMessage);Var	ID:Integer;	X:Single;	Y:Single;	Rotation:Single;Begin	Msg.ReadInteger(ID);	Msg.ReadSingle(X);	Msg.ReadSingle(Y);	Msg.ReadSingle(Rotation);	OnMovementMessage(ID, X, Y, Rotation);End;End.