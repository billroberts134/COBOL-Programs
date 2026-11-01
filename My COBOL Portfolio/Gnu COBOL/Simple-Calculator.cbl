       IDENTIFICATION DIVISION.

       PROGRAM-ID.     Simple-Calculator.
       AUTHOR.         Original program by John Bailey.
      *                Updated and extended by Bill Roberts. 
      *INSTALLATION.   IBM-PC running Windows 11.
      *DATE-WRITTEN.   29 October 2025.
      *DATE-COMPILED.  29 October 2025.
      *SECURITY.       This program does not process sensitive data.

      *****************************************************************
      *    This program implements a simple calculator and demonstrates
      *    proper input handling, condition names for readability, 
      *    error-checking for division by zero, and the use of  
      *    explicit arithmetic verbs for clarity.
      *****************************************************************

      *****************************************************************
      *Change History.
      *     31 October 2026.  By Bill Roberts.   No change ID.
      *     This version of the program updates the simple calculator
      *     program on pages 62 to 64 of 'Modern COBOL Programming for 
      *     Beginners' by John Bailey.  In updating the program, I
      *     have switched from the program's original free format
      *     to a fixed format.  I have added documentation to the 
      *     Identification Division, and have added an Environment 
      *     Division.  I have increased the degree of modularity
      *     of the Procedure Division, and slightly improved the user
      *     interface by adding 'With no advancing' clauses to the
      *     0200-GET-INPUT procedure.  I have added validation of input 
      *     so the user cannot put non-numeric data into numeric fields.
      *     Also, I have added square and square root functions.
      *****************************************************************

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.

       SOURCE-COMPUTER.    IBM-PC.
       OBJECT-COMPUTER.    IBM-PC.

       DATA DIVISION.

       WORKING-STORAGE SECTION.

           01 WS-OPERAND-1           PIC S9(8)V99.
           01 WS-OPERAND-2           PIC S9(8)V99.
           01 WS-RESULT              PIC S9(10)V99.
           01 WS-FORMATTED-RESULT    PIC -,---,---,--9.99.
           01 WS-OPERATION           PIC X.
              88 ADD-OPERATION       VALUE '+'.
              88 SUBTRACT-OPERATION  VALUE '-'.
              88 MULTIPLY-OPERATION  VALUE '*'.
              88 DIVIDE-OPERATION    VALUE '/'.
              88 SQUARE-OPERATION    VALUE 'S'.
              88 SQRT-OPERATION      VALUE 'R'.
              88 QUIT-OPERATION      VALUE 'Q'.
           01 WS-CONTINUE            PIC X VALUE 'Y'.
              88 KEEP-GOING          VALUE 'Y'.

           01 WS-RAW-INPUT           PIC X(15).
           01 WS-CLEAN-INPUT         PIC X(15).
           01 WS-DECIMAL-COUNT       PIC 9 VALUE 0.
           01 WS-INPUT-STATUS        PIC X VALUE 'N'.
              88 INPUT-IS-VALID             VALUE 'Y'.
              88 INPUT-IS-INVALID           VALUE 'N'.
       PROCEDURE DIVISION.

       MAIN-PROCEDURE SECTION.

       0000-MAIN.

           PERFORM 0100-PROCESS-CALCULATION UNTIL NOT KEEP-GOING.
           PERFORM 0600-END-PROGRAM.
           STOP RUN.

       SUBROUTINES SECTION.
       0100-PROCESS-CALCULATION.
           PERFORM 0200-GET-INPUT.
           IF NOT QUIT-OPERATION
               PERFORM 0300-CALCULATE
               PERFORM 0400-DISPLAY-RESULT
           ELSE 
               MOVE 'N' TO WS-CONTINUE
           END-IF.
       0200-GET-INPUT.
           DISPLAY ' '.
           DISPLAY 
           "Enter operation (+, -, *, /, S=square, R=SQRT, Q to quit): " 
               UPON CONSOLE.
           ACCEPT WS-OPERATION.
           MOVE FUNCTION UPPER-CASE(WS-OPERATION) TO WS-OPERATION.
           
           IF NOT QUIT-OPERATION
      *        --- LOOP FOR OPERAND 1 ---
               SET INPUT-IS-INVALID TO TRUE
               PERFORM UNTIL INPUT-IS-VALID
                   DISPLAY "Enter number: " UPON CONSOLE
                       WITH NO ADVANCING
                   ACCEPT WS-RAW-INPUT
                   PERFORM 0500-VALIDATE-INPUT
                   IF INPUT-IS-VALID
                       MOVE FUNCTION NUMVAL(WS-RAW-INPUT) 
                           TO WS-OPERAND-1
                   ELSE
                       DISPLAY 
                       "Invalid entry! Digits and 1 decimal point only."
                   END-IF
               END-PERFORM
      *        --- LOOP FOR OPERAND 2 (Skip for Square and Square Root) ---
               IF ADD-OPERATION OR SUBTRACT-OPERATION OR 
                  MULTIPLY-OPERATION OR DIVIDE-OPERATION
                   SET INPUT-IS-INVALID TO TRUE
                   PERFORM UNTIL INPUT-IS-VALID
                       DISPLAY "Enter second number: " UPON CONSOLE
                          WITH NO ADVANCING
                       ACCEPT WS-RAW-INPUT
                       PERFORM 0500-VALIDATE-INPUT
                       IF INPUT-IS-VALID
                           MOVE FUNCTION NUMVAL(WS-RAW-INPUT) 
                               TO WS-OPERAND-2
                       ELSE
                       DISPLAY 
                       "Invalid entry! Digits and 1 decimal point only."
                       END-IF
                   END-PERFORM
               END-IF
           END-IF.       
           0300-CALCULATE.
           EVALUATE TRUE
               WHEN ADD-OPERATION
                   ADD WS-OPERAND-1 WS-OPERAND-2 GIVING WS-RESULT
                       ON SIZE ERROR 
                          DISPLAY "Arithmetic size error."
               WHEN SUBTRACT-OPERATION 
                   SUBTRACT WS-OPERAND-2 FROM WS-OPERAND-1
                   GIVING WS-RESULT
                       ON SIZE ERROR 
                           DISPLAY "Arithmetic size error."
               WHEN MULTIPLY-OPERATION
                   MULTIPLY WS-OPERAND-1 BY WS-OPERAND-2 GIVING
                       WS-RESULT ROUNDED 
                           ON SIZE ERROR 
                              DISPLAY "Arithmetic size error."    
               WHEN DIVIDE-OPERATION
                   IF WS-OPERAND-2 = ZERO
                       DISPLAY "Error: division by zero."         
                       MOVE ZERO TO WS-RESULT
                   ELSE
                       DIVIDE WS-OPERAND-1 BY WS-OPERAND-2
                          GIVING WS-RESULT ROUNDED
                              ON SIZE ERROR 
                                  DISPLAY "Arithmetic size error."
                   END-IF
               WHEN SQUARE-OPERATION
                   MULTIPLY WS-OPERAND-1 BY WS-OPERAND-1 GIVING 
                       WS-RESULT ROUNDED
                          ON SIZE ERROR
                              DISPLAY "Arithmetic size error."
               WHEN SQRT-OPERATION
                   IF WS-OPERAND-1 < ZERO
                  DISPLAY "Error: Cannot square root a negative number."
                       MOVE ZERO TO WS-RESULT
                   ELSE
                       COMPUTE WS-RESULT ROUNDED = WS-OPERAND-1 ** 0.5
                          ON SIZE ERROR
                              DISPLAY "Arithmetic size error."
                   END-IF
               WHEN OTHER 
                   DISPLAY "Invalid operation." 
                   MOVE ZERO TO WS-RESULT
           END-EVALUATE.
       0400-DISPLAY-RESULT.
           MOVE WS-RESULT TO WS-FORMATTED-RESULT.
           DISPLAY "Result: " WS-FORMATTED-RESULT.      
      * 0500-VALIDATE-INPUT.
       0500-VALIDATE-INPUT.
      *    1. Strip out spaces so they don't break the IS NUMERIC check
           MOVE WS-RAW-INPUT TO WS-CLEAN-INPUT.
           INSPECT WS-CLEAN-INPUT REPLACING ALL " " BY "0".

      *    2. Count how many periods are in the input string
           MOVE 0 TO WS-DECIMAL-COUNT.
           INSPECT WS-CLEAN-INPUT TALLYING WS-DECIMAL-COUNT 
               FOR ALL ".".

      *    3. Temporarily drop the decimal to see if only numbers remain
           INSPECT WS-CLEAN-INPUT REPLACING ALL "." BY "0".

      *    4.Also strip out negative/positive signs for clean evaluation
           INSPECT WS-CLEAN-INPUT REPLACING ALL "-" BY "0".
           INSPECT WS-CLEAN-INPUT REPLACING ALL "+" BY "0".

      *    5. Set validity status flag based on classic class tests
           IF WS-CLEAN-INPUT IS NUMERIC AND WS-DECIMAL-COUNT <= 1
               SET INPUT-IS-VALID TO TRUE
           ELSE
                SET INPUT-IS-INVALID TO TRUE
           END-IF.    
       0600-END-PROGRAM.
           DISPLAY " ".
           DISPLAY "*************************************************".
           DISPLAY "Program terminating normally.".
           DISPLAY " ".
