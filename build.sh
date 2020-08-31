#!/bin/bash
for fname in `find . -name '*.md' -type f -not -path "./docs/*"`
do
    filename=$(basename -- "$fname")
    extension="${fname##*.}"
    filename="${filename%.*}"
    out_fname="docs/${filename}.html"
    out_fname=`ruby -e 'puts ARGV[0].sub("./", "./docs/").sub(".md", ".html")' $fname

    pandoc -B includes/header.html.part -A includes/footer.html.part -o ${out_fname} ${fname}
    echo "Generated ${out_fname} from ${fname}..."
done

cp -r ./styles docs/
cp -r ./images docs/
