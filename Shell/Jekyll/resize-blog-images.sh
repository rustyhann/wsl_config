# Delete the small files if they exist
for file in *.png
do

    if [ -f "$(echo "$file" | cut -f 1 -d '.')-small.png" ]
    then
        rm "$(echo "$file" | cut -f 1 -d '.')-small.png"
    fi
done

# Convert the large files to small files with 400 width
for file in *.png
do
    convert "$file" -resize 400 "$(echo "$file" | cut -f 1 -d '.')-small.png"
done