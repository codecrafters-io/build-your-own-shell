with Ada.Text_IO; use Ada.Text_IO;
with Ada.Text_IO.Text_Streams; use Ada.Text_IO.Text_Streams;
with Ada.Command_Line;

procedure Main is
  Console_Stream: Stream_Access := Stream(Standard_Output);
begin

   -- TODO: Uncomment the code below to pass the first stage
   -- String'Write(Console_Stream, "$ ");

   Ada.Command_Line.Set_Exit_Status (Ada.Command_Line.Success);
end Main;
