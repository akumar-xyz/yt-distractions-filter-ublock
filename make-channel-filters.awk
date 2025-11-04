BEGIN {
    print "! YT Home - Hide videos based on channel URLs"
}

# For each line like /@TheOffice
{
    channel = $0
    # Skip empty lines or comments
    if (channel ~ /^$/ || channel ~ /^!/) next

    # Desktop filter (YouTube home)
    printf("youtube.com##ytd-browse[page-subtype=\"home\"] ytd-rich-item-renderer:has([href=\"%s\"])\n", channel)
}

END {
    print "\n! Mobile YT - Hide videos based on channel URLs"
    # Reprocess file for mobile filters
    while ((getline line < ARGV[1]) > 0) {
        if (line ~ /^$/ || line ~ /^!/) continue
        printf("m.youtube.com##ytm-media-item .media-channel a:not([class]):is([href=\"%s\"]):upward(ytm-media-item)\n", line)
    }
}
