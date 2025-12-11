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
        a=`{recsel -t Metadata -e $recexpr -S date -p description,title,filename,date $metadatadb | tac | sed 's|sites/|https://|g;s|.md||g;s|.tpl||g;s|.html||g' | recfmt -f apps/goralog/rsstemplate.templ}
        echo $a;
%}
    </channel>
</rss>
