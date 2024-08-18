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
    summary = "";

    if (length(ARGV[1]) > 0) {
        summary = "Opened file " ARGV[1];
    } else {
        fileName = "piped data";
        summary = "Processing piped data";
    }

    # Console Decoration 
    dashBreakM = "------------------------------------------------------------------------------------------------------------------------------\n";
    plusBreakM = "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
    
    print "Program started on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());
    print "Program: " program;
    printf "%s\n\n", summary;
    printf "Argument Count: %d\n", ARGC;
    
    if (length(ARGV) > 0) {
        for (i in ARGV) {
            if (length(ARGV[i]) > 0) {
                if (i < length(ARGV)) {
                    printf "\tArgument %d: %3s\n", argIndex, ARGV[i];
                } else {
                    printf "\tArgument %d: %3s", argIndex, ARGV[i];
                }
            }
            argIndex += 1;
        }
    }

    print "\n" plusBreakM "\n\n\n\n";
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

    if (numberFields == 2) {
        if (length(firstRow) > 1) {
            for (i in firstRow) {
                
                if (i == length(firstRow)) {
                    printf "%52s", toupper(firstRow[i]); 
                } else {
                    printf "%-52s", toupper(firstRow[i]); 
                }
            }
        }
    

    } else if (numberFields == 3) {
        if (length(firstRow) > 1) {
            for (i in firstRow) {
                
                if (i == length(firstRow)) {
                    printf "%42s", toupper(firstRow[i]); 
                } else {
                    printf "%-42s", toupper(firstRow[i]); 
                }
            }
        }   

    } else if (numberFields > 3) {
        printf "%-30s %-30s %-30s %30s", toupper(firstRow[3]), toupper(firstRow[4]), toupper(firstRow[1]), toupper(firstRow[2]);   
    } else if (numberFields == 1) {
        for (i in firstRow) {            
            printf "%-52s", toupper(firstRow[i]);             
        }  
    }

    # Add line break 
    printf "\n%s",dashBreakM;  

    # Output the records 
    
    if (numberFields == 2) {
        for (i in records) {
            record = records[i];
            split(record, commaSplit, "(,)");

            for (j in commaSplit) {
                item = commaSplit[j];

                if (j < length(commaSplit)) {
                    printf "%-52s", item;
                }
                else {
                    printf "%52s\n", item;
                }
            }
        }

    } else if (numberFields == 3) {
        for (i in records) {
            record = records[i];
            split(record, commaSplit, "(,)");

            for (j in commaSplit) {
                item = commaSplit[j];

                if (j < length(commaSplit)) {
                    printf "%-42s", item;
                }
                else {
                    printf "%42s\n", item;
                }
            }
        }

    } else if (numberFields > 3) {
        for (i in records) {
            record = records[i];
            split(record, commaSplit, "(,)");

            name = commaSplit[1];
            url = commaSplit[2];
            mUrl = substr(url,1,28);
            username = commaSplit[3];
            password = commaSplit[4];
            printf "%-30s %-30s %-30s %30s\n", username, password, name, mUrl;            
        }     
    } else if (numberFields == 1) {
        for (i in records) {
            record = records[i];
            split(record, commaSplit, "(,)");

            for (j in commaSplit) {
                item = commaSplit[j];

                printf "%-52s\n", item;
            }
        }
    }

    # Output end summary
    if (fileName != "piped data") {
        summary = "Closed file " fileName
    } else {
        summary = "Finished processing piped data";
    }

    printf "\n\n\n\n%s",plusBreakM;   

    printf "Number of fields: %d\n\n", numberFields;

    printf "Number of records: %d\n\n", length(records);

    printf "%s\n\n", summary;

    print "Program ended on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());

    exit 0;
}
