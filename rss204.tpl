<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/css" href="/pub/style/rss.css"?>
%{
d=`{basename -d $req_path}
if (~ $#d 0)
    d='/'

dirUsed=`{basename -d $req_path};
recexpr='goralog_base_dir = '''^$dirUsed^''''
filenames=`{recsel -t Metadata -e $recexpr -S date -P filename $metadatadb | tac}
lbddate=`{recsel -t Metadata -e $recexpr -S date -P date $metadatadb | tac | head -n 1}
%}
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
    <channel>
        <atom:link href="%($base_url^$req_path%)" rel="self" type="application/rss+xml" />
        <title>%($siteTitle%)</title>
        <link>%($base_url^$req_path%)</link>
        <description>%($blogDesc%)</description>
        <language>en-us</language>
        <generator>Tom Duff's rc, Kris Maglione's, and RisingThumb's goralog werc hackery</generator>
%{
        lbd=`{/usr/bin/date -R -d $lbddate}
%}
        <lastBuildDate>%($lbd%)</lastBuildDate>
%{
a=`{
    recsel -t Metadata -e $recexpr -S date -p description,title,filename,date $metadatadb \
    | tac \
    | awk '
        BEGIN { RS=""; FS="\n" }
        {
            desc=""; title=""; filename=""; date="";
            for(i=1;i<=NF;i++){
                if ($i ~ /^description:/) desc=substr($i,13)
                if ($i ~ /^title:/)       title=substr($i,7)
                if ($i ~ /^filename:/)    filename=substr($i,10)
                if ($i ~ /^date:/)        date=substr($i,6)
            }
            # Escape for rc
            gsub(/"/, "\\\"", desc)
            gsub(/"/, "\\\"", title)
            gsub(/"/, "\\\"", filename)
            gsub(/"/, "\\\"", date)

            printf("emit_record \"%s\" \"%s\" \"%s\" \"%s\"\n", desc, title, filename, date)
        }
    ' \
    | rc -c '
        fn emit_record {
            description=$1
            title=$2
            filename=$3
            date=$4
            contents=`{cat $filename}

            echo '<item>'
            echo '  <title>'^$contents^'</title>'
            echo '  <author>risingthumb@risingthumb.xyz (Aaron Leonard)</author>'
            echo '  <link>'^$filename^'</link>'
            echo '  <guid isPermaLink="true">'^$filename^'</guid>'
            echo '  <pubDate>'^$date^'</pubDate>'
            echo '  <description>'^$description^'</description>'
            echo '</item>'
        }
    '
}`
        echo $a;
%}
    </channel>
</rss>
