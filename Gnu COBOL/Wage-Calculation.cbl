000010 IDENTIFICATION DIVISION.
000020 PROGRAM-ID.     Wage-Calculation.
000030 AUTHOR.         Bill Roberts.
000040 INSTALLATION.   IBM-PC running Windows 11.
000050 DATE-WRITTEN.   2 November 2026.
000060 DATE-COMPILED.  2 November 2026.
000070 SECURITY.       This program does not process sensitive data.
000080
000100*****************************************************************
000110*    This program implements the program design that is my 
000120*    response to Question 6 on page 31 of 'Simple Program Design: 
000130*    A Step-by-Step Approach' by Lesley Anne Robertson. Note that 
000140*    the book is about program design not COBOL.  This program 
000150*    accepts regular hours worked, overtime hours worked, and
000155*    hourly rate of pay and calculates total pay including 
000156*    overtime.
000157*****************************************************************
000160
000170*****************************************************************
000180*     Change History.
000190*     2 November 2026.  Bill Roberts.   No change ID.
000200*     Currently, there are no changes to detail.
000210*****************************************************************
000220
000230 ENVIRONMENT DIVISION.
000240
000250 CONFIGURATION SECTION.
000260
000270 SOURCE-COMPUTER.    IBM-PC.
000280 OBJECT-COMPUTER.    IBM-PC.
       SPECIAL-NAMES.
           CURRENCY SIGN IS '£'.
000300 DATA DIVISION.
000310
000320 WORKING-STORAGE SECTION.
000330 01  WS-Variables.
000331     05 WS-Regular-Hours-Worked  PIC 9(2)V99 VALUE ZERO.
000332     05 WS-Overtime-Hours-Worked PIC 9(2)V99 VALUE ZERO.
000333     05 WS-Hourly-Rate           PIC 9(2)V99 VALUE ZERO.
000334     05 WS-Regular-Wage          PIC 9(5)V99 VALUE ZERO.
000335     05 WS-Overtime-Pay          PIC 9(4)V99 VALUE ZERO.
000336     05 WS-Total-Pay             PIC 9(5)V99 VALUE ZERO.
000337     05 WS-Formatted-Total-Pay   PIC £££,££9.99 VALUE ZERO.
           05 WS-Input-Buffer          PIC X(10) VALUE SPACES.
       01  WS-Loop-Control             PIC X(1) VALUE 'N'.
       01  WS-Main-Loop-Control        PIC X(1) VALUE 'Y'.
           88 Want-to-Continue         VALUE 'Y', 'y'.
           88 Want-to-Quit             VALUE 'N', 'n'.
           88 Valid-Exit-Response      VALUE 'Y', 'y', 'N', 'n'.

000360 PROCEDURE DIVISION.
000370
000380 MAIN-PROCEDURE SECTION.
000390
000400 0000-MAIN.
000410     PERFORM UNTIL Want-to-Quit
000420         PERFORM 0100-GET-INPUT
000430         PERFORM 0200-CALCULATE-TOTAL-PAY
               PERFORM 0300-DISPLAY-RESULT
               DISPLAY ' '
               MOVE SPACES TO WS-Main-Loop-Control
               PERFORM UNTIL Valid-Exit-Response
                   DISPLAY 'Calculate another wage?'
                       WITH NO ADVANCING
                  ACCepT WS-Main-Loop-Control
                  IF NOT Valid-Exit-Response
                     DISPLAY 'Invalid choice.  Enter Y or N'
                  END-IF
               END-PERFORM

000440     END-PERFORM.    
           PERFORM 0400-END-PROGRAM.
           STOP RUN.
000450
000460 SUBROUTINES SECTION.
000470
000480 0100-GET-INPUT.
           MOVE 'N' TO WS-Loop-Control.
           PERFORM UNTIL WS-Loop-Control = 'Y'
               MOVE SPACES TO WS-Input-Buffer
               DISPLAY "Please input number of regular hours: "
               WITH NO ADVANCING   
               ACCEPT WS-Input-Buffer
               IF FUNCTION TEST-NUMVAL(WS-Input-Buffer) = 0
                   COMPUTE WS-Regular-Hours-Worked = 
                           FUNCTION NUMVAL(WS-Input-Buffer)
                   MOVE 'Y' TO WS-Loop-Control
               ELSE
                   DISPLAY "Error: input must be numeric."
               END-IF
           END-PERFORM.

           MOVE 'N' TO WS-Loop-Control.
           PERFORM UNTIL WS-Loop-Control = 'Y'
               MOVE SPACES TO WS-Input-Buffer
               DISPLAY "Please input number of overtime hours: "
               WITH NO ADVANCING   
               ACCEPT WS-Input-Buffer
               IF FUNCTION TEST-NUMVAL(WS-Input-Buffer) = 0
                   COMPUTE WS-Overtime-Hours-Worked = 
                           FUNCTION NUMVAL(WS-Input-Buffer)
                   MOVE 'Y' TO WS-Loop-Control
               ELSE
                   DISPLAY "Error: input must be numeric."
               END-IF
           END-PERFORM.
               
           MOVE 'N' TO WS-Loop-Control.
           PERFORM UNTIL WS-Loop-Control = 'Y'
               MOVE SPACES TO WS-Input-Buffer
               DISPLAY "Please input hourly rate of pay: "
               WITH NO ADVANCING   
               ACCEPT WS-Input-Buffer
               IF FUNCTION TEST-NUMVAL(WS-Input-Buffer) = 0
                   COMPUTE WS-Hourly-Rate = 
                           FUNCTION NUMVAL(WS-Input-Buffer)
                   MOVE 'Y' TO WS-Loop-Control
               ELSE
                   DISPLAY "Error: input must be numeric."
               END-IF
           END-PERFORM.

000540 0200-CALCULATE-TOTAL-PAY.
           COMPUTE WS-Regular-Wage = WS-Regular-Hours-Worked * 
           WS-Hourly-Rate.
           COMPUTE WS-Overtime-Pay = WS-Overtime-Hours-Worked * 1.5 * 
                    WS-Hourly-Rate.
           COMPUTE WS-Total-Pay = WS-Regular-Wage + WS-Overtime-Pay.

       0300-DISPLAY-RESULT.
           Move WS-Total-Pay to WS-Formatted-Total-Pay.
           Display "Total wage = " WS-Formatted-Total-Pay.
000580
000590 0400-END-PROGRAM.
           DISPLAY " ". 
000600     DISPLAY "*************************************************".
000610     DISPLAY "Program terminating normally.".
000620     DISPLAY " ".
000640
