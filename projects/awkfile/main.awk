BEGIN {
    # Overriding some built-in variables

    # FIELDWIDTHS = "20 40 15 85";
    FPAT = "([^,]+)|(\"[^\"]+\")";
    OFS="  \t";
    RS="\n";
    ORS="\n\n";

    # Vars
    fileName = ARGV[1];
    numberRecords = 0;
    dashBreak = "\n-------------------------------------------------\n";
    plusBreak = "\n+++++++++++++++++++++++++++++++++++++++++++++++++\n\n";

    print "Program started on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());
    print "Opened file: " fileName;
    print "Argument Count: " ARGC;
}

{
    printf "\n";
}

NR==1 {
    split($0,headers,",");

    if (length(headers) > 1) {
        for (i in headers) {
            printf "%s  \t ",toupper(headers[i]);
        }
    } else {
        printf "\n  \tUh-oh!!\n\n";
    }

    printf "%s",plusBreak;
}

NR>1 {
    ++numberRecords;  

    split($0,records,",");

    for (i in records) {
        if (i < length(records)) {
            printf "%s  \t\t   ",records[i];
        } else {
            printf "%s \n",records[i];
        }
    }
}

END {
    printf "\n\r\n\nNumber of records: %d\n\n", numberRecords;

    printf "Closed file %s\n\n",fileName;

    print "Program ended on " strftime("%m/%d/%Y", systime()) " at " strftime("%H:%M:%S", systime());

    exit 0;
}