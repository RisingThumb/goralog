<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/css" href="/pub/style/rss.css"?>
%{
d=`{basename -d $req_path}
if (~ $#d 0)
    d='/'

get_sorted_stuffs_from_directory
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
        ifs='|'
        firstLine=`{echo $sortedStuffs(1) | awk '{$1=$1;print}'};
        line=$firstLine(1)
        lbd=`{/usr/bin/date -R -d $line}
%}
        <lastBuildDate>%($lbd%)</lastBuildDate>
%{
        ifs='|'
        for (stuff in $sortedStuffs) {
            ifs='|'
            s=`{echo $stuff | awk '{$1=$1;print}'};
            newdate=`{/usr/bin/date -R -d $s(1)}
            title=$s(2)
            link=$s(3)
            description=`{cat $s(5) | $formatter }
%}
        <item>
            <title>%($title%)</title>
            <author>risingthumb@risingthumb.xyz (Aaron Leonard)</author>
            <link>https://risingthumb.xyz/Writing/Blog/%($link%)</link>
            <guid isPermaLink="true">https://risingthumb.xyz/Writing/Blog/%($link%)</guid>
            <pubDate>%($newdate%)</pubDate>
            <description><![CDATA[<html><head></head><body>%($description%)</body></html>]]></description>
        </item>
%{

        }
        ifs=$oldifs;
%}
    </channel>
</rss>
