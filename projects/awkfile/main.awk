BEGIN {
    # Overriding some built-in variables

    # FIELDWIDTHS = "20 40 15 85";
    FPAT = "([^,]+)|(\"[^\"]+\")";
    OFS="  \t";
    RS="\n";
    ORS="\n\n";

    # Vars
    program = ARGV[0];
    fileName = ARGV[1];
    records["start"];
    strRecord;
    firstRow[121];
    otherRows[121];
    firstRowColumnGap[121];
    otherRowsColumnGap[121];
    numberRecords = 0;

    # Console Decoration 
    dashBreak = "\n-------------------------------------------------\n";
    dashBreak2 = "\n-------------------------------------------------\n\n";
    plusBreak = "\n+++++++++++++++++++++++++++++++++++++++++++++++++\n";
    plusBreak2 = "\n+++++++++++++++++++++++++++++++++++++++++++++++++\n\n";

    print "Program started on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());
    print "Program: " fileName;
    print "Opened file: " fileName;
    printf "Argument Count: %s", ARGC;
    printf "\n%s",plusBreak2;
}

NR==1 {
    split($0,firstRow,"(,){1}");  
}

NR>1 {
    ++numberRecords;  
    record = $0;
    records[numberRecords] = record;
}

END {
    for (i in firstRow) {
        printf "%s %-15s", toupper(firstRow[i]), " "; 
    }

    printf "\n";
    
    for (i in records) {
        record = records[i];
        printf "%-12s\n\n",record;
    }


    printf "\n%s",plusBreak2;

    printf "Number of records: %d\n\n", length(records);

    printf "Other Number of records: %d\n\n", numberRecords;

    printf "Closed file %s\n\n",fileName;

    print "Program ended on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());

    exit 0;
}