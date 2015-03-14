<mountains>
{
    (: In each continent, the highest mountain and their heights in meters :)
    let $doc := doc("mondial.xml")
    for $continent in $doc//continent
    return <continent name="{$continent/name/text()}">
             {(let $countries := $doc//country[encompassed/@continent = $continent/@id]
               for $mountain in $doc//mountain[located/@country = $countries/@car_code]
               order by $mountain/elevation/number() descending
               return <highest elevation="{$mountain/elevation/number()}">
                        {$mountain/name/text()}
                      </highest>)[1]}
           </continent>
}
</mountains>
