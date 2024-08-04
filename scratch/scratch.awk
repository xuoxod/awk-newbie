BEGIN {
    # Overriding some built-in variables

    # FIELDWIDTHS = "20 40 15 85";
    FPAT = "([^,]+)|(\"[^\"]+\")";
    OFS="  \t";
    RS="\n";
    ORS="\n\n";

    # Vars
    fileName = ARGV[1];
    records["start"];
    strRecord;
    titleHeads["start"];
    numberRecords = 0;
    titleRecord;
    dashBreak = "\n-------------------------------\n";
    plusBreak = "\n+++++++++++++++++++++++++++++++\n\n";

    print "Program started on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());
    print "Opened file: " fileName;
    print "Argument Count: " ARGC;
}

{
    # for (i =0; i<ARGC; ++i) {
    #     printf "Argument: %s\n", ARGV[i];
    # }
    printf "\n";
}

NR==1 {
    split($0,titleHeads,"(:){1}");

    printf "   \tThe First Row\n\n";

    if (length(titleHeads) > 1) {
        for (i in titleHeads) {
            printf "%s  \t",toupper(titleHeads[i]);
        }
    }

    printf "%s",plusBreak;
}

NR>1{
    ++numberRecords;    
    record = $0;
    recordDetails = split(record,details,"(:){1}");

    for (i in details) {
       if (i < length(details)) {
        printf "%s  \t",details[i];
       } else {
        printf "%s\n",details[i];
       }
    }
}


END {
    printf "\n\nNumber of records: %d\n\n", numberRecords;

    printf "Closed file %s\n\n",fileName;

    print "Program ended on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());

    exit 0;
}