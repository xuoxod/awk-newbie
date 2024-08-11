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
    numberFields = 0;

    # Console Decoration 
    dashBreak = "---------------------------------------------------------------------------------------------------------------\n";
    dashBreakM = "------------------------------------------------------------------------------------------------------------------------------\n";
    dashBreak2 = "------------------------------------------------------------------------------------------------------------\n\n";
    dashBreak3 = "------------------------------------------------------------------------------------------------------------\n\n\n";
    dashBreak4 = "------------------------------------------------------------------------------------------------------------\n\n\n\n";
    plusBreak = "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
    plusBreakM = "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n";
    plusBreak2 = "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n";
    plusBreak3 = "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n\n";
    plusBreak4 = "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n\n\n";
    sectionDashBreak = "\n------------------------------------------------------------------------------------------------------------\n";
    sectionDashBreak2 = "\n\n------------------------------------------------------------------------------------------------------------\n\n";
    sectionDashBreak3 = "\n\n\n------------------------------------------------------------------------------------------------------------\n\n\n";
    sectionDashBreak4 = "\n\n\n\n------------------------------------------------------------------------------------------------------------\n\n\n\n";

    print "Program started on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());
    print "Program: " program;
    print "Opened file: " fileName;
    printf "Argument Count: %s\n", ARGC;
    
    for (i in ARGV) {
        if (i < length(ARGV) - 1) {
            printf "\tArgument %d: %3s\n", i+1, ARGV[i];
        } else {
            printf "\tArgument %d: %3s", i+1, ARGV[i];
        }
    }

    printf "\n%s\n\n\n\n",plusBreak;
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

    if (numberFields == 3) {
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

    } else if (numberFields > 3) {
        name = firstRow[1];
        url = firstRow[2];
        username = firstRow[3];
        password = firstRow[4];

        printf "%-30s %-30s %-30s %-30s", toupper(username), toupper(password), toupper(name), toupper(url);

        # Added line break 
        printf "\n%s",dashBreakM;       
    }


    # Output the records 
    if (numberFields == 3) {
        for (i in records) {
            record = records[i];
            split(record, commaSplit, "(,)");

            for (j in commaSplit) {
                item = commaSplit[j];

                if (j < length(commaSplit)) {
                    printf "%-36s", item;
                }
                else {
                    printf "%36s\n", item;
                }
            }
        }

        printf "\n\n\n\n%s",plusBreak;  

    } else if (numberFields > 3) {
        for (i in records) {
            record = records[i];
            split(record, commaSplit, "(,)");

            name = commaSplit[1];
            url = commaSplit[2];
            mUrl = substr(url,1,28);
            username = commaSplit[3];
            password = commaSplit[4];

            # printf "%5s %-5s %-5s %5s\n", username, password, name, url;

            printf "%-30s %-30s %-30s %-30s\n", username, password, name, mUrl;
            
            # if (j < length(commaSplit)) {
            #     printf "%25s %-25s %-25s", username, password, name;
            # }
            # else {
            #     printf "%25s %-25s %-25s\n", username, password, name;
            # }
            
        }

        printf "\n\n\n\n%s",plusBreakM;        
    }

    
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