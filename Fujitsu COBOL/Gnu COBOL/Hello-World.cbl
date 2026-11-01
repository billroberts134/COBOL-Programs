       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Hello-World.
       AUTHOR.         Bill Roberts.
       INSTALLATION.   IBM-PC running Windows 11.
       DATE-WRITTEN.   29 October 2026.
       DATE-COMPILED.  29 October 2026.
       SECURITY.       This program does not process sensitive data.

      *****************************************************************
      *    The purpose of this program, as well as to write a 
      *    traditional 'hello world!' program is to demonstrate good 
      *    program design, compliance with modern practices in variable 
      *    naming, and modular programming in the Procedure Division.
      *****************************************************************

      *****************************************************************
      *     Change History.
      *     29 October 2026.  Bill Roberts.   No change ID.
      *     Currrently, there are no changes to detail.
      *****************************************************************

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.

       SOURCE-COMPUTER.    IBM-PC.
       OBJECT-COMPUTER.    IBM-PC.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

       01 WS-GREETING PIC X(40) VALUE "Hello World!  Welcome to COBOL!".

       PROCEDURE DIVISION.

       MAIN-PROCEDURE SECTION.

       0000-MAIN.

           PERFORM 0100-PROGRAM-START.
           PERFORM 0200-HELLO.
           PERFORM 0300-END-PROGRAM.

       SUBROUTINES SECTION.

       0100-PROGRAM-START.
           DISPLAY " ".
           DISPLAY "*************************************************".
           DISPLAY "Start program run.".
           DISPLAY " ".

       0200-HELLO.
           DISPLAY "*************************************************".    
           DISPLAY WS-GREETING.
           DISPLAY " ".

       0300-END-PROGRAM.
           DISPLAY "*************************************************".
           DISPLAY "Program terminating normally.".
           DISPLAY " ".
           STOP RUN.

