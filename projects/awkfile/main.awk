BEGIN {
    print " \tReading file " ARGV[1] "\n";
    # exit 0;
    FIELDWIDTHS = "20 40";
    FPAT = "([^,]+)|(\"[^\"]+\")";
    OFS="  \t";
    RS="\n";
    ORS="\n\n";
    limit=USER_DEFINED_LIMIT;
    sLength=RLENGTH;
    c1 = "";
    c2 = "";
    c3 = "";    
    dashBreak = "-------------------------------";
    plusBreak = "+++++++++++++++++++++++++++++++";
}

NR==1 {
    c1=$1;
    c2=$2;
    c3=$3;
}

{
    print "\n"plusBreak "\nNumber of Fields:  ", NF;
    # for (i = 1; i <= NF; i++) {
    #     # printf("$%d = <%s>\n", i, $i);
    #     printf("%d: %s\n",i, $i);
    # }
}

NR!=1 {
    print dashBreak "\nDetailed | "c2 ":  " $2" \t"c1":  "$1" \t" c3 ":  "$3"\n" dashBreak "\n";
}

NR==1 {
    print $2 " \t"$1 " \t"$3;
}

END {
    printf "\n\n\t\t   Commencing clean up\n\n\n";
    exit 0;
}