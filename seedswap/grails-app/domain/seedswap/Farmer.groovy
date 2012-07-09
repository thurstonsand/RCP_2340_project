package seedswap

import org.apache.commons.collections.list.LazyList
import org.apache.commons.collections.FactoryUtils
//This class represents a farmer with an associated password and email address.
//Additional variables will be added as needed.
class Farmer {

    String password
    String username
    List seeds = new ArrayList()
    static hasMany = [seeds: Seed]

    String toString(){
        "$email"
    }

    def getExpandableSeedsList(){
        return LazyList.decorate(seeds,FactoryUtils.instantiateFactory(Seed.class))
    }
    //A valid Farmer object must have an email address and a non-blank password
    static constraints = {
        username username:true, blank:false
        password blank:false, password:true
    }
}
