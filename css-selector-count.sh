#!/usr/bin/env bash
# Author: Luís Zamith <zamith@groupbuddies.com>
#
# Counts the number of rules and selectors on a CSS file. If these excede IE's
# limit, a warning message is printed.
#
# Usage: Pass the production CSS file as the only argument.
#
# ./css-selector-count.sh file.css

NO_RULES=$(cat $1 | grep -o '{' | wc -l)
NO_SELECTORS=$(($NO_RULES + $(cat $1 | grep -o ',' | wc -l)))

echo "Number of rules: $(echo $NO_RULES | tr -d '')"
echo "Number of selectors: $(echo $NO_SELECTORS | tr -d '')"
if [ "$NO_SELECTORS" -gt "4095" ]; then
    echo -e "\033[0;31mThis execedes IE limit!\033[0m"
fi
