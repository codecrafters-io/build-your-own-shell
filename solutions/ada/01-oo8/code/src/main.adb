with Ada.Text_IO; use Ada.Text_IO;
with Ada.Text_IO.Text_Streams; use Ada.Text_IO.Text_Streams;
with Ada.Command_Line;

procedure Main is
  Console_Stream: constant Stream_Access := Stream(Standard_Output);
begin

   String'Write(Console_Stream, "$ ");

   Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
end Main;
