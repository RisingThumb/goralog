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
        for (file in $filenames) {
            nrexp='filename = '''^$file^'''';
            
            newdate=`{/usr/bin/date -R -d `{recsel -t Metadata -e $nrexp -P date $metadatadb}}
            title=`{recsel -t Metadata -e $nrexp -P title $metadatadb}
            link=`{echo $file | sed 's|sites/|https://|g;s|.md||g;s|.tpl||g;s|.html||g;'}
            description=`{recsel -t Metadata -e $nrexp -P description $metadatadb}
            content=`{cat $file | /usr/bin/sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/"/\&quot;/g' -e 's/\&lt;!---/<!---/g' -e 's/---\&gt;/--->/g' | $formatter }
%}
        <item>
            <title>%($title%)</title>
            <author>risingthumb@risingthumb.xyz (Aaron Leonard)</author>
            <link>%($link%)</link>
            <guid isPermaLink="true">%($link%)</guid>
            <pubDate>%($newdate%)</pubDate>
            <description><![CDATA[<head></head><body>%($content%)</body>]]></description>
        </item>
%{

        }
%}
    </channel>
</rss>
