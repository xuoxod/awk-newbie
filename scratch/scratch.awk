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
    records["121"] = "default";
    strRecord;
    firstRow[121] = "default";
    otherRows[121] = "default";
    firstRowColumnGap[121] = "default";
    otherRowsColumnGap[121] = "default";
    numberRecords = 0;

    # Console Decoration 
    dashBreak = "------------------------------------------------------------------------------------------------------------\n";
    dashBreak2 = "------------------------------------------------------------------------------------------------------------\n\n";
    dashBreak3 = "------------------------------------------------------------------------------------------------------------\n\n\n";
    dashBreak4 = "------------------------------------------------------------------------------------------------------------\n\n\n\n";
    plusBreak = "\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
    plusBreak2 = "\n\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n";
    plusBreak3 = "\n\n\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n\n";
    plusBreak4 = "\n\n\n\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n\n\n";

    print "Program started on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());
    print "Program: " program;
    print "Opened file: " fileName;
    print "Argument Count: " ARGC;
    
    for (i in ARGV) {
        printf "Argument %d: %3s\n", i+1, ARGV[i];
    }

    printf "%s",plusBreak4;
}

NR==1 {
    split($0,firstRow,"(,){1}");   
}

NR>1{
    numberRecords += FNR;    
    record = $0;
    records[numberRecords] = record;
}


END {

    # Output the column titles 

     if (length(firstRow) > 1) {
        for (i in firstRow) {
            
            if (i == length(firstRow)) {
                printf "%36s", toupper(firstRow[i]); 
            } else {
                printf "%-36s", toupper(firstRow[i]); 
            }
        }
    }

    # Added line break 
    printf "\n%s",dashBreak;

    # Output the records 
    for (i in records) {
        record = records[i];
        split(record,commaSplit,"(,)");

        # Find the longest column 
        firstItem = commaSplit[1];
        
        for (j in commaSplit) {
            item = commaSplit[j];

            if (length(firstItem) > length(item)) {
                otherRowsColumnGap["tab"] = length(firstItem);
            } else {
                otherRowsColumnGap["tab"] = length(item);
            }

            if (j < length(commaSplit)) {
                printf "%-36s", item;
            }
            else {
                printf "%36s\n", item;
            }
        }
    }


    printf "\n\n\n%s",plusBreak4;

    printf "Number of records: %d\n\n", length(records);

    printf "Longest column: %d\n\n", otherRowsColumnGap["tab"];

    printf "Closed file %s\n\n",fileName;

    print "Program ended on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());

    exit 0;
}