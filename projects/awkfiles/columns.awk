BEGIN {
    # Overriding some built-in variables

    # FIELDWIDTHS = "20 40 15 85";
    FPAT = "([^,]+)|(\"[^\"]+\")";
    OFS="  \t";
    RS="\n"; # Record separator 
    ORS="\n\n"; # Output record separator

    # Vars
    program = ARGV[0];
    fileName = ARGV[1];
    records[121] = "default";
    strRecord;
    firstRow[121] = "default";
    otherRows[121] = "default";
    firstRowColumnGap[121] = "default";
    otherRowsColumnGap[121] = "default";
    numberRecords = 0;
    numberFields = 0;
    argIndex = 1;

    # Console Decoration 
    dashBreakM = "------------------------------------------------------------------------------------------------------------------------------\n";
    plusBreakM = "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
    sectionDashBreak = "\n------------------------------------------------------------------------------------------------------------\n";
    sectionDashBreak2 = "\n\n------------------------------------------------------------------------------------------------------------\n\n";
    sectionDashBreak3 = "\n\n\n------------------------------------------------------------------------------------------------------------\n\n\n";
    sectionDashBreak4 = "\n\n\n\n------------------------------------------------------------------------------------------------------------\n\n\n\n";

    print "Program started on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());
    print "Program: " program;
    print "Opened file: " fileName;
    printf "Argument Count: %d\n", ARGC;
    
    if (length(ARGV) > 0) {
        for (i in ARGV) {
            if (i < length(ARGV)) {
                printf "\tArgument %d: %3s\n", argIndex, ARGV[i];
            } else {
                printf "\tArgument %d: %3s", argIndex, ARGV[i];
            }
            argIndex += 1;
        }
    }

    print "\n" plusBreakM "\n";
}

NR==1 {
    numberFields = NF;        
    split($0,firstRow,"(,){1}");   
}

NR>1{
    $0 = $0;
    # printf "Reading record: %s\n", $0;
    # printf "Number of fields: %d\n\n", NF;

    numberRecords += FNR;    
    record = $0;
    records[numberRecords] = record;
}


END {
    # Output the column titles 
    printf "%38s\n\n","Column Names";

    for (i in firstRow) {
            printf "%11s", toupper(firstRow[i]); 
    }

    # Added line break 
    printf "\n\n%s\n\n",dashBreak;     

    # Summary 
    if (NF == 3) {
        printf "Number of fields: %d\n\n", NF;
    } else if (NF == 4) {
        printf "Number of fields: %d\n\n", NF;
    } else {
        printf "Number of fields: %d\n\n", NF;
    }

    printf "Number of records: %d\n\n", length(records);

    printf "Closed file %s\n\n",fileName;

    print "Program ended on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());

    exit 0;
}