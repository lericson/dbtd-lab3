(: Generate a list of cities that have a population over 1M and give the share
 : of their population as a part of the overall population of the country as a
 : percentage. Order by the population share. Output on the format:
 :   <city popshare="20" country="France">Paris</city>"
 :)

<cities>
  { let $doc := doc("mondial.xml")

    for $country in $doc//country
    let $countryPopulation := $country/population[1]/number()

    (: Find latest city population definition :)
    for $city in $country/province/city
    let $cityPopulation := (for $pop in $city/population
                            order by $pop/@year/number() descending
                            return $pop/number())[1]

    where $cityPopulation > 1000000

    let $share := $cityPopulation div $countryPopulation

    order by $share descending
    return <city popshare="{round($share*100)}"
                 country="{$country/name}">{$city/name/text()}</city>

  }
</cities>
