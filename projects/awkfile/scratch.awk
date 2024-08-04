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
    plusBreak = "\n\n+++++++++++++++++++++++++++++++\n\n";

    print "Program started on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());
    print "Opened file: " fileName;
    print "Argument Count: " ARGC;
}

{
    # for (i =0; i<ARGC; ++i) {
    #     printf "Argument: %s\n", ARGV[i];
    # }
}

NR==1 {
    split($0,titleHeads,",");

    printf "   The Columns\n\n";

    if (length(titleHeads) > 1) {
        for (i in titleHeads) {
            printf "%s  \t",toupper(titleHeads[i]);
        }
    }

    printf "%s",plusBreak;
}

NR>1{
    ++numberRecords;    
    FS = "\n";
    record = "$0";
    printf "\n%s\n",$record;
    # printf "%s",dashBreak;
}


END {
    printf "\n\nNumber of records: %d\n\n", numberRecords;

    printf "Closed file %s\n\n",fileName;

    print "Program ended on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());

    exit 0;
}