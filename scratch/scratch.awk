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
    dashBreak = "------------------------------------------------------------------------------------------------------------\n";
    dashBreak2 = "------------------------------------------------------------------------------------------------------------\n\n";
    dashBreak3 = "------------------------------------------------------------------------------------------------------------\n\n\n";
    dashBreak4 = "------------------------------------------------------------------------------------------------------------\n\n\n\n";
    plusBreak = "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
    plusBreak2 = "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n";
    plusBreak3 = "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n\n";
    plusBreak4 = "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n\n\n";

    print "Program started on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());
    print "Program: " program;
    print "Opened file: " fileName;
    print "Argument Count: " ARGC;
    printf "%s",plusBreak4;
}

NR==1 {
    split($0,firstRow,"(,){1}");   
}

NR>1{
    ++numberRecords;    
    record = $0;
    records[numberRecords] = record;
}


END {
     if (length(firstRow) > 1) {
        for (i in firstRow) {
            printf "%10s %25s", toupper(firstRow[i]), " "; 
        }
    }

    printf "\n%s",dashBreak3;

    for (i in records) {
        record = records[i];
        split(record,commaSplit,"(,)");
        
        for (j in commaSplit) {
            if (j < length(commaSplit)) {
                printf "%s %20s", commaSplit[j], " ";
            }
            else {
                printf "%s %20s\n", commaSplit[j], " ";
            }
        }
    }


    printf "\n%s",plusBreak;

    printf "Number of records: %d\n\n", length(records);

    printf "Longest string value: %d\n\n", otherRowsColumnGap["tab"];

    printf "Closed file %s\n\n",fileName;

    print "Program ended on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());

    exit 0;
}