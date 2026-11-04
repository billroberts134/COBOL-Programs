//MYSAMPLE JOB (1234),'CREATE FILE',CLASS=A,MSGCLASS=X,NOTIFY=&SYSUID
//*-------------------------------------------------------------------*
//* STEP 10: COPY IN-STREAM DATA INTO A PERMANENT SEQUENTIAL DATASET  *
//*-------------------------------------------------------------------*
//STEP10   EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSUT2   DD DSN=MY.FIRST.DATAFILE,
//            DISP=(NEW,CATLG,DELETE),
//            UNIT=SYSDA,
//            SPACE=(TRK,(1,1),RLSE),
//            DCB=(RECFM=FB,LRECL=80,BLKSIZE=800)
//SYSUT1   DD *
00001ALAN TURING         0550000                                                
00002GRACE HOPPER        0750000                                                
00003ADA LOVELACE        0625000                                                
00004JOHN VON NEUMANN    0480050                                                
/*
//SYSIN    DD DUMMY
//