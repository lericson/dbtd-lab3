(: Which sea contains the largest number of islands? :)


(let $doc := doc("mondial.xml")
 for $sea in $doc//sea
 let $count := count($doc//island[contains(@sea, $sea/@id)])
 order by $count descending
 return <sea islands="{$count}">{$sea/name/text()}</sea>)[1]
