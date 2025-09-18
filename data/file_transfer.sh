#!/bin/bash

# Files to transfer
FILES=("evqa.zip" "msmarco_3_clusters.tar.gz" "msmarco_pq.index" "queries_audio5000.pkl")
#FILES=("evqa.zip")

# Remote servers
SERVERS=(
    "Alicia@xxxxxxxx.wisc.cloudlab.us"
)

# Loop over servers and copy files
for SERVER in "${SERVERS[@]}"; do
    echo "Transferring files to $SERVER..."
    for FILE in "${FILES[@]}"; do
        scp "$FILE" "$SERVER:~/"
    done
done

echo "Transfer complete."
