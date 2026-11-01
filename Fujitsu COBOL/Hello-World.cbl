000010 @OPTIONS MAIN
000011 IDENTIFICATION DIVISION.
000020
000030 PROGRAM-ID.     Hello-World.
000040 AUTHOR.         Bill Roberts.
000050 INSTALLATION.   IBM-PC running Windows 11.
000060 DATE-WRITTEN.   29 October 2026.
000070 DATE-COMPILED.  29 October 2026.
000080 SECURITY.       This program does not process sensitive data.
000090
000100*****************************************************************
000110*    The purpose of this program, as well as to write a 
000120*    traditional 'hello world!' program is to demonstrate good 
000130*    program design, compliance with modern practices in variable 
000140*    naming, and modular programming in the Procedure Division.
000150*****************************************************************
000160
000170*****************************************************************
000180*     Change History.
000190*     29 October 2026.  Bill Roberts.   No change ID.
000200*     Currrently, there are no changes to detail.
000210*****************************************************************
000220
000230 ENVIRONMENT DIVISION.
000240
000250 CONFIGURATION SECTION.
000260
000270 SOURCE-COMPUTER.    IBM-PC.
000280 OBJECT-COMPUTER.    IBM-PC.
000290
000300 DATA DIVISION.
000310
000320 WORKING-STORAGE SECTION.
000330
000340 01 WS-GREETING PIC X(40) VALUE "Hello World!  Welcome to COBOL!".
000350
000360 PROCEDURE DIVISION.
000370
000380 MAIN-PROCEDURE SECTION.
000390
000400 0000-MAIN.
000410
000420     PERFORM 0100-PROGRAM-START.
000430     PERFORM 0200-HELLO.
000440     PERFORM 0300-END-PROGRAM.
000450
000460 SUBROUTINES SECTION.
000470
000480 0100-PROGRAM-START.
000490     DISPLAY " ".
000500     DISPLAY "*************************************************".
000510     DISPLAY "Start program run.".
000520     DISPLAY " ".
000530
000540 0200-HELLO.
000550     DISPLAY "*************************************************".    
000560     DISPLAY WS-GREETING.
000570     DISPLAY " ".
000580
000590 0300-END-PROGRAM.
000600     DISPLAY "*************************************************".
000610     DISPLAY "Program terminating normally.".
000620     DISPLAY " ".
000630     STOP RUN.
000640
