(: Show the names, populations and capitals of the provinces (län) of Sweden
 : order by population with largest first.
 :)
<provinces>
  { for $x in doc('mondial.xml')//country[name/text() = "Sweden"]/province
    order by $x/population/number() descending
    return <province capital="{ $x/city[@is_state_cap = "yes"]/name/text() }">
             {$x/name/text()}
           </province>
  }
</provinces>
